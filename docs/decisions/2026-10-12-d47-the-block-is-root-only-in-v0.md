---
id: 2026-10-12-d47-the-block-is-root-only-in-v0
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The block is root-only in v0.1. docs-init names nested AGENTS.md files it finds, and monorepos with nested files are under Not doing

## Context
The AGENTS.md convention says the closest file to the edited file wins. Claude Code concatenates; whether Codex and others drop the root file inside a package is unverified.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
The block is root-only in v0.1. docs-init names nested AGENTS.md files it finds, and monorepos with nested files are under Not doing.

## Consequences
Why: the design cited the nearest-wins rule as the reason for one root block without noticing it cuts the other way.
Revisit when: a monorepo user arrives. The fix is the same block, same markers, in each nested file, which `rerun-safe` already covers.
