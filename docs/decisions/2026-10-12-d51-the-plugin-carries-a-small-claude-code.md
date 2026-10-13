---
id: 2026-10-12-d51-the-plugin-carries-a-small-claude-code
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The plugin carries a small Claude Code manifest after all, kept in sync with the Agent Plugins one by the static check

## Context
Supersedes the "no Claude Code manifest" half of D45. Loading does not need `plugin/.claude-plugin/plugin.json`, but `claude plugin validate` refuses a plugin directory without one, and under `--strict` it wants `version`, `description` and `author` too. The file holds name, version, description, author, repository and license; `checks/check.py` fails when its name, version or description differ from `plugin/plugin.json`.

## Options
- The choice in D45: replaced by this one

## Decision
The plugin carries a small Claude Code manifest after all, kept in sync with the Agent Plugins one by the static check.

## Consequences
Why: CI runs the strict validator, and a `version` lets Claude Code users pin a release once there is one.
Revisit when: the validator accepts a plugin without a manifest.
