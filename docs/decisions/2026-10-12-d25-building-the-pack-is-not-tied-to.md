---
id: 2026-10-12-d25-building-the-pack-is-not-tied-to
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Building the pack is not tied to any agent

## Context
Repo instructions live in AGENTS.md, and CLAUDE.md only imports it. Agent-specific files sit in adapter locations. No skill depends on a feature only one agent has without stating a fallback.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Building the pack is not tied to any agent.

## Consequences
Why: Yousef may build with Codex as easily as with Claude Code, and the pack itself must work in both.
Revisit when: never.
