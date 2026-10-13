---
id: 2026-10-12-d46-templates-live-under-assets-in-the-docs
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Templates live under assets/ in the docs-conventions skill. Command skills never name a template path. docs-conventions holds the charter and the claim format; per-file rules are references loaded by the command that writes the file

## Context
The Agent Skills standard keeps file references one level deep from a skill's root, and Claude Code's skill directory variable points at the skill's own folder, not the plugin root. A `../docs-conventions/templates/x.md` reference works only when the pack is installed whole. So a command says "load docs-conventions and write from its template for `<file>`", and docs-conventions lists its templates under `assets/`. Its SKILL.md holds only the charter table and the claim format; section rules per file go to `references/<file>.md`, loaded on demand. The baseline task measures resident tokens and records the number.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Templates live under assets/ in the docs-conventions skill. Command skills never name a template path. docs-conventions holds the charter and the claim format; per-file rules are references loaded by the command that writes the file.

## Consequences
Why: a broken template reference makes the agent improvise a file shape, which is bet A's drift failure. docs-conventions is loaded by every command, so every line in it is a recurring cost.
Revisit when: an agent resolves plugin-root paths from a skill, or the measured cost is small.
