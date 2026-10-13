---
id: 2026-10-12-d37-docs-init-adds-the-claude-md-import
status: superseded by D42
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# docs-init adds the CLAUDE.md import only when a CLAUDE.md exists

## Context
Claude Code 2.1.277 and later reads AGENTS.md when no CLAUDE.md exists in the folder or above it. With a CLAUDE.md present it reads only CLAUDE.md, unless that file imports AGENTS.md. Bedrock, Vertex, Foundry and older versions still need the import; the README says so.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
docs-init adds the CLAUDE.md import only when a CLAUDE.md exists.

## Consequences
Why: the earlier claim targeted the case that now needs nothing and missed the case that silently drops the block.
Revisit when: Claude Code reads both files by default.
