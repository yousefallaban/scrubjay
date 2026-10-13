---
id: 2026-10-12-d20-the-pack-builds-on-open-formats-agent
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The pack builds on open formats: Agent Skills (SKILL.md), Agent Plugins (plugin.json), the Claude Code plugin and marketplace manifests, and AGENTS.md

## Context


## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
The pack builds on open formats: Agent Skills (SKILL.md), Agent Plugins (plugin.json), the Claude Code plugin and marketplace manifests, and AGENTS.md.

## Consequences
Why: formats, not code dependencies. Agent Skills is supported by Claude Code, Codex, Copilot and VS Code, Cursor, Gemini CLI, Kiro and others. Claude Code isn't on the Agent Plugins client list, so it gets its own manifests.
Revisit when: an agent we test drops one of these formats, or a standard absorbs another.
