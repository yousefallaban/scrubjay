---
id: 2026-10-12-d42-docs-init-always-makes-a-root-claude
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# docs-init always makes a root CLAUDE.md import AGENTS.md, and ends by confirming the block loads

## Context
Supersedes D37. Claude Code counts a `CLAUDE.md`, `.claude/CLAUDE.md` or `CLAUDE.local.md` in the working directory or any directory above it, so a parent folder's file, an older version, or Bedrock, Vertex and Foundry hide AGENTS.md with no error. docs-init writes the import into an existing CLAUDE.md or creates a one-line one, an adapter file the neutrality rule allows, and its last step is to start a session and confirm the block is in context.

## Options
- The choice in D37: replaced by this one

## Decision
docs-init always makes a root CLAUDE.md import AGENTS.md, and ends by confirming the block loads.

## Consequences
Why: the block is the only thing that sends an unprompted session to `docs/`. If it isn't loaded, bet A fails for a reason that has nothing to do with the bet, and the measures in D31 mean nothing.
Revisit when: Claude Code reads AGENTS.md regardless of CLAUDE.md files above the repo.
