Purpose: what checks/check.py verifies, so the static-checks claim is concrete and CI needs nothing but Python 3.

1. Skill frontmatter. Every `plugin/skills/*/SKILL.md` has `name` equal to its folder and a non-empty `description`, and no keys outside the whitelist each agent reads.
2. Manifests. `plugin/plugin.json` has `$schema` and `name`. `.claude-plugin/marketplace.json` has `name`, `owner` and `plugins[]` with `name` and `source`. `.agents/plugins/marketplace.json` has the same plus `policy.installation`, `policy.authentication` and `category` per entry. Entry names equal the name in plugin.json, and every source points at `plugin/`.
3. Templates parse. Every file under `docs-conventions/assets/` has valid YAML frontmatter where the template has one, its fixed headings, and no `{{` outside a slot.
4. Templates exist. Every template the docs-conventions SKILL.md names is under `assets/`.
5. Name. The product name appears only in the manifests and README files.
6. Links. Every relative markdown link inside `plugin/` resolves.

Extra, only when the Claude Code CLI is present: `claude plugin validate --strict` on `plugin/` and on the repo root.

The script exits non-zero on the first failure and prints the file and the rule. `checks/run.sh` wraps it and the optional extra, and CI calls only the wrapper.
