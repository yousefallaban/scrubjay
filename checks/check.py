#!/usr/bin/env python3
"""Static checks for the pack. Python 3 standard library only, no agent CLI.

Checks, in order: skill frontmatter, manifests, templates parse, templates listed,
the product name only in allowed files, relative links resolve. Exits non-zero on
the first failing rule and prints the file and the rule.
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PLUGIN = ROOT / "plugin"
CLAUDE_MARKET = ROOT / ".claude-plugin" / "marketplace.json"
CODEX_MARKET = ROOT / ".agents" / "plugins" / "marketplace.json"
MANIFEST = PLUGIN / "plugin.json"
CLAUDE_MANIFEST = PLUGIN / ".claude-plugin" / "plugin.json"
CONVENTIONS = PLUGIN / "skills" / "docs-conventions"
RESULTS = PLUGIN / "evals" / "results"  # run output, gitignored, never checked

# Files that may carry the product name: the manifests and the README files.
NAME_ALLOWED = {CLAUDE_MARKET, CODEX_MARKET, MANIFEST, CLAUDE_MANIFEST, PLUGIN / "README.md"}

# Frontmatter keys a SKILL.md may carry: the Agent Skills standard plus the
# invocation key Claude Code reads. Extend here when a tested agent needs more.
SKILL_KEYS = {"name", "description", "license", "compatibility", "metadata", "allowed-tools", "user-invocable"}

# Agent Plugins plugin.json, schema 1.0.0: required keys, allowed keys, no others.
AP_SCHEMA = "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json"
AP_REQUIRED = {"$schema", "name"}
AP_ALLOWED = AP_REQUIRED | {"version", "description", "author", "homepage", "repository", "license", "keywords", "extensions"}
AP_NAME = re.compile(r"^(?!.*(--|\.\.))[a-z0-9.-]{1,64}$")

CODEX_INSTALLATION = {"AVAILABLE", "INSTALLED_BY_DEFAULT", "NOT_AVAILABLE"}

failures: list[str] = []
notes: list[str] = []


def rel(path: Path) -> str:
    return str(path.relative_to(ROOT))


def fail(path: Path, rule: str, detail: str = "") -> None:
    failures.append(f"{rel(path)}: {rule}" + (f" ({detail})" if detail else ""))


def load_json(path: Path):
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError:
        fail(path, "missing")
    except json.JSONDecodeError as e:
        fail(path, "invalid JSON", str(e))
    return None


def frontmatter(text: str):
    """Return (keys, ok). keys are the top-level frontmatter keys; ok is False when the block is malformed."""
    if not text.startswith("---\n"):
        return None, True
    end = text.find("\n---", 4)
    if end < 0:
        return None, False
    block = text[4:end]
    keys = {}
    for line in block.splitlines():
        if not line.strip():
            continue
        if line.startswith((" ", "\t")):
            continue  # nested value, belongs to the previous key
        m = re.match(r"^([A-Za-z0-9_$-]+):\s*(.*)$", line)
        if not m:
            return None, False
        keys[m.group(1)] = m.group(2).strip()
    return keys, True


def check_skills() -> None:
    skills = PLUGIN / "skills"
    if not skills.is_dir():
        fail(skills, "missing skills directory")
        return
    for folder in sorted(p for p in skills.iterdir() if p.is_dir()):
        skill = folder / "SKILL.md"
        if not skill.is_file():
            fail(folder, "skill folder without SKILL.md")
            continue
        keys, ok = frontmatter(skill.read_text(encoding="utf-8"))
        if not ok or keys is None:
            fail(skill, "frontmatter missing or malformed")
            continue
        if keys.get("name") != folder.name:
            fail(skill, "name must equal the folder name", f"{keys.get('name')!r} vs {folder.name!r}")
        if not keys.get("description"):
            fail(skill, "description is empty")
        extra = set(keys) - SKILL_KEYS
        if extra:
            fail(skill, "frontmatter keys outside the whitelist", ", ".join(sorted(extra)))


def check_manifests() -> None:
    manifest = load_json(MANIFEST)
    if isinstance(manifest, dict):
        missing = AP_REQUIRED - set(manifest)
        if missing:
            fail(MANIFEST, "required keys missing", ", ".join(sorted(missing)))
        extra = set(manifest) - AP_ALLOWED
        if extra:
            fail(MANIFEST, "keys the Agent Plugins schema does not allow", ", ".join(sorted(extra)))
        if manifest.get("$schema") != AP_SCHEMA:
            fail(MANIFEST, "$schema must be the Agent Plugins 1.0.0 schema URL")
        if not AP_NAME.match(str(manifest.get("name", ""))):
            fail(MANIFEST, "name must be 1 to 64 lowercase letters, digits, dots or hyphens")
        if "extensions" in manifest and not all(isinstance(v, dict) for v in manifest["extensions"].values()):
            fail(MANIFEST, "every extensions value must be an object")
    plugin_name = manifest.get("name") if isinstance(manifest, dict) else None

    # Claude Code's own manifest: optional for loading, required by its validator.
    # Its name and version must match the Agent Plugins manifest.
    claude_manifest = load_json(CLAUDE_MANIFEST)
    if isinstance(claude_manifest, dict) and isinstance(manifest, dict):
        for key in ("name", "version", "description"):
            if claude_manifest.get(key) != manifest.get(key):
                fail(CLAUDE_MANIFEST, f"{key} must equal plugin/plugin.json", f"{claude_manifest.get(key)!r} vs {manifest.get(key)!r}")
        if not isinstance(claude_manifest.get("author"), dict) or not claude_manifest["author"].get("name"):
            fail(CLAUDE_MANIFEST, "author.name is required under --strict")

    claude = load_json(CLAUDE_MARKET)
    if isinstance(claude, dict):
        for key in ("name", "owner", "plugins"):
            if key not in claude:
                fail(CLAUDE_MARKET, "required key missing", key)
        if not isinstance(claude.get("owner"), dict) or not claude["owner"].get("name"):
            fail(CLAUDE_MARKET, "owner.name is required")
        for entry in claude.get("plugins", []):
            check_entry(CLAUDE_MARKET, entry, plugin_name)

    codex = load_json(CODEX_MARKET)
    if isinstance(codex, dict):
        for key in ("name", "plugins"):
            if key not in codex:
                fail(CODEX_MARKET, "required key missing", key)
        for entry in codex.get("plugins", []):
            check_entry(CODEX_MARKET, entry, plugin_name)
            policy = entry.get("policy")
            if not isinstance(policy, dict):
                fail(CODEX_MARKET, "entry needs a policy object", entry.get("name", "?"))
            else:
                if policy.get("installation") not in CODEX_INSTALLATION:
                    fail(CODEX_MARKET, "policy.installation must be one of " + ", ".join(sorted(CODEX_INSTALLATION)))
                if not policy.get("authentication"):
                    fail(CODEX_MARKET, "policy.authentication is required")
            if not entry.get("category"):
                fail(CODEX_MARKET, "entry needs a category", entry.get("name", "?"))


def check_entry(market: Path, entry: dict, plugin_name) -> None:
    name = entry.get("name")
    if not name or "source" not in entry:
        fail(market, "entry needs name and source")
        return
    if plugin_name and name != plugin_name:
        fail(market, "entry name must equal the name in plugin/plugin.json", f"{name!r} vs {plugin_name!r}")
    source = entry["source"]
    path = source if isinstance(source, str) else source.get("path") if isinstance(source, dict) else None
    if not isinstance(path, str) or not path.startswith("./"):
        fail(market, "source must be a relative path starting with ./", repr(source))
        return
    if (market.parent.parent if market == CODEX_MARKET else market.parent).joinpath(path).resolve() != PLUGIN.resolve():
        # Both marketplace files sit one or two levels below the repo root; resolve from the root.
        if (ROOT / path).resolve() != PLUGIN.resolve():
            fail(market, "source must point at plugin/", path)


def check_templates() -> None:
    assets = CONVENTIONS / "assets"
    if not assets.is_dir():
        notes.append("templates: docs-conventions/assets not present yet, skipped")
        return
    for path in sorted(assets.rglob("*.md")):
        text = path.read_text(encoding="utf-8")
        keys, ok = frontmatter(text)
        if not ok:
            fail(path, "frontmatter is malformed")
        if text.count("{{") != text.count("}}"):
            fail(path, "unbalanced {{ }} slots")
        if text.startswith("---\n"):
            for line in text[4:text.find("\n---", 4)].splitlines():
                if re.match(r"^[A-Za-z0-9_$-]+:\s*[\[{]", line):
                    fail(path, "frontmatter slot must be quoted to stay valid YAML", line.strip())
    index = assets / "index.md"
    if index.is_file() and "docs-format:" not in index.read_text(encoding="utf-8"):
        fail(index, "must carry docs-format in its frontmatter")


def check_templates_listed() -> None:
    skill = CONVENTIONS / "SKILL.md"
    if not skill.is_file():
        notes.append("templates listed: docs-conventions/SKILL.md not present yet, skipped")
        return
    text = skill.read_text(encoding="utf-8")
    named = set(re.findall(r"assets/([A-Za-z0-9_./-]+\.md)", text))
    if not named:
        fail(skill, "names no template under assets/")
    for name in sorted(named):
        if not (CONVENTIONS / "assets" / name).is_file():
            fail(skill, "names a template that does not exist", f"assets/{name}")


def check_name() -> None:
    manifest = load_json(MANIFEST) or {}
    product = str(manifest.get("name", "")).lower()
    if not product:
        return
    files = [p for p in PLUGIN.rglob("*") if p.is_file() and p.suffix in {".md", ".json", ".yml", ".yaml", ".sh", ".txt"} and RESULTS not in p.parents]
    files += [CLAUDE_MARKET, CODEX_MARKET]
    for path in sorted(set(files)):
        if path in NAME_ALLOWED or not path.exists():
            continue
        if product in path.read_text(encoding="utf-8", errors="replace").lower():
            fail(path, "carries the product name; only manifests and README files may")


def check_links() -> None:
    link = re.compile(r"\[[^\]]*\]\(([^)\s]+)\)")
    for path in sorted(p for p in PLUGIN.rglob("*.md") if RESULTS not in p.parents):
        for target in link.findall(path.read_text(encoding="utf-8")):
            if target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            target = target.split("#", 1)[0]
            if target and not (path.parent / target).exists():
                fail(path, "relative link does not resolve", target)


def main() -> int:
    for check in (check_skills, check_manifests, check_templates, check_templates_listed, check_name, check_links):
        check()
    for note in notes:
        print(f"note: {note}")
    if failures:
        print("FAIL")
        for f in failures:
            print(f"  {f}")
        return 1
    print("PASS: skills, manifests, templates, name, links")
    return 0


if __name__ == "__main__":
    sys.exit(main())
