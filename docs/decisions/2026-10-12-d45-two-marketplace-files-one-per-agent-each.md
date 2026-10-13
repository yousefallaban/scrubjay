---
id: 2026-10-12-d45-two-marketplace-files-one-per-agent-each
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Two marketplace files, one per agent, each validated against its own schema. One root plugin.json for Codex. No Claude Code manifest

## Context
Supersedes the one-file half of D38. Codex requires `policy.installation`, `policy.authentication` and `category` on every entry at `.agents/plugins/marketplace.json`; Claude Code's validator warns on those as unknown fields, so one shared file never passes `--strict`. Claude Code's own manifest is optional: without `.claude-plugin/plugin.json` it loads `skills/` from the standard layout and takes the plugin name from the marketplace entry. A root `plugin.json` is not read by Claude Code and is read by Codex, so it is Codex's manifest. Manifests are adapter files. The marketplace clone in a user's cache is the whole repo; only the installed plugin folder is clean, and the spec says so.

## Options
- The choice in D38: replaced by this one

## Decision
Two marketplace files, one per agent, each validated against its own schema. One root plugin.json for Codex. No Claude Code manifest.

## Consequences
Why: each agent reads its own documented path, and CI can run each validator strictly.
Revisit when: either agent reads the other's location without warnings.
Changed in part by D51.
