---
spec: 2026-10-12-v0-1
---
## Approach
One plugin folder, `plugin/`, holds the eight skills and the few files users need, and the repo around it holds the manifests, the checks, the cases and this spec. Every skill is written test-first against `scrubjay-example`, in the order the bets demand: the docs layer, the block and resume before grilling. The templates and the file charter live in one practice, docs-conventions, and the six commands reach them only through it. The static checks are one Python script with no dependencies, run by CI on every pull request. Command cases run through Claude Code's eval command, and the three block-driven claims are checked by hand on both agents with the transcripts kept. Nothing lands on main until the release check passes and this spec ships.

## Trade-offs
- Cases live under `evals/` at the repo root if `claude plugin eval --eval-dir` accepts a path above the plugin, otherwise under `plugin/evals/`, where users receive them as plain files. Settled in T3 and recorded as a decision.
- No `.claude-plugin/plugin.json`. Claude Code's manifest is optional and the plugin name comes from the marketplace entry (D45). Claude Code users then track commits instead of a `version`, which is fine before 1.0.
- The static checks use the Python 3 standard library, not a JSON Schema library: required fields and types only, so CI installs nothing. `claude plugin validate --strict` runs as an extra when the CLI is present.
- `scrubjay-example` is TypeScript on Bun, because `bun test` needs no setup and matches the stack most of our specs will meet. Any repo with a test command works the same.

## Files
.claude-plugin/marketplace.json                        new: Claude Code marketplace; one entry, source ./plugin
.agents/plugins/marketplace.json                       new: Codex marketplace; the same entry plus policy and category fields
plugin/plugin.json                                     new: Agent Plugins manifest, read by Codex; name, version, description, repository
plugin/README.md                                       new: what the pack is, the two bets, install per agent, one line per command, the quickstart, how to test a change
plugin/CREDITS.md                                      new: the packs we learned mechanics from, and what each gave
plugin/LICENSE                                         new: copy of the repo license, so the installed folder carries it
plugin/skills/docs-conventions/SKILL.md                new: the file charter and the claim format; loaded by every command
plugin/skills/docs-conventions/references/<file>.md    new: section rules per file type, loaded by the command that writes that file
plugin/skills/docs-conventions/assets/                 new: the templates, copied from reference/templates/
plugin/skills/grilling/SKILL.md                        new: question rounds; not user-invocable
plugin/skills/docs-init/SKILL.md                       new
plugin/skills/docs-map/SKILL.md                        new
plugin/skills/spec-start/SKILL.md                      new
plugin/skills/spec-plan/SKILL.md                       new
plugin/skills/spec-build/SKILL.md                      new: includes changing course
plugin/skills/spec-ship/SKILL.md                       new
evals/<skill>/<case>/                                  new: prompt, graders, a scaffold script where the case needs a repo state; the baseline scenario per skill
evals/by-hand/<claim>.md                               new: the protocol and transcripts for answers-from-docs, resumes and session-line
checks/check.py                                        new: the static checks, Python 3 standard library only
checks/run.sh                                          new: runs check.py, then claude plugin validate --strict when the CLI exists
.github/workflows/checks.yml                           new: runs checks/run.sh on every pull request
README.md                                              changed: points to plugin/README.md for install; stays the repo's front page
docs/specs/2026-10-12-v0-1/reference/baseline.md       new: what the baseline run found, written in T2
scrubjay-example                                       new, separate repo: a small webshop on Bun with products, wishlist and returns with partial refunds, tests, tagged baseline

## Architecture to update at ship
- stack.md, from reference/static-checks.md
- boundaries.md, from the Files section above: plugin/ versus the repo around it
- conventions.md, from reference/skill-anatomy.md

## Risks
- Agents skip steps under pressure. Covered by test-first skills and the behavior case per skill, case-minimum.
- Three facts in research.md are still marked verify: an eval directory outside the plugin, how skills inside a Codex plugin are named, and `user-invocable` under a strict validator. Each is settled in the task that first needs it and recorded as a decision.
- docs-conventions is resident in every command. Its size is measured in T2 and T4, and references/ absorb what the charter doesn't need.
- The block fails to load in Claude Code through a parent CLAUDE.md. Covered by links-claude-md and its by-hand check.
