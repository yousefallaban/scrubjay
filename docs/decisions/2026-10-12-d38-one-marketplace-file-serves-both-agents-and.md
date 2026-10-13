---
id: 2026-10-12-d38-one-marketplace-file-serves-both-agents-and
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# One marketplace file serves both agents, and the plugin manifest is a root plugin.json in the Agent Plugins format

## Context
Extends D20 and D22. `.claude-plugin/marketplace.json` lists the plugin with a relative source into the plugin subfolder; Codex accepts that path as a legacy location and supports `git-subdir`. The plugin root carries `plugin.json` with the Agent Plugins schema, which Codex reads. A `.claude-plugin/plugin.json` is added only if Claude Code refuses a root manifest; its eval docs name both locations, so this is checked at build.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
One marketplace file serves both agents, and the plugin manifest is a root plugin.json in the Agent Plugins format.

## Consequences
Why: one file per concern instead of one per agent, and fewer manifests for the static checks and the name rule to cover.
Revisit when: either agent drops support for the shared location.
Changed in part by D45.
