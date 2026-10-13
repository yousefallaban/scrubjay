---
area: conventions
---
# Conventions

- A skill's frontmatter holds `name`, equal to its folder, and `description`, which carries the trigger; a practice adds `user-invocable: false`: the description is all an agent sees before loading, so it names the phrasings that must trigger it, such as "I'm back, where were we".
- A skill's body is Process, Verification, then Rationalizations and red flags only in spec-start, spec-build, spec-ship and grilling, then Fallbacks: what to do without a question tool, sub-agents or a shell.
- A command skill never names a template path; it loads docs-conventions and writes from the template for that file: `assets/` is reached through one skill only.
- The product name appears only in the manifests and README files: `checks/check.py` fails on it anywhere else under `plugin/`.
- A template slot in frontmatter is quoted, `id: "{{slug}}"`, and the quotes go when the slot is filled: templates stay valid YAML.
- Eval cases grant Write and Edit, never Bash; a prompt that needs the agent to run something says the session cannot and asks it to say what it would run: the runner refuses a Bash grant on this machine, and the skills state the no-shell fallback anyway.
- A regex grader over a file takes an exact path, so a prompt names the file when the agent would otherwise choose the name; `file_exists` takes a glob.
- A case's `case.yaml` carries `schema_version: "1.1"`, and a case that needs a project copies `checks/fixture-webshop.sh` as its `fixture.sh`.
- Commit messages are `type: description` with type among feat, fix, refactor, docs, test, chore, perf, ci.
- Decisions are appended to `reference/decisions.md` the moment they are made, never edited; a later one supersedes.
