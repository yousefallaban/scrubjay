---
id: 2026-10-12-d35-skills-instruct-they-don-t-enforce-best
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Skills instruct, they don't enforce. Best-effort claims say so, and each is its skill's behavior case

## Context
Claims such as "leaves everything outside the markers untouched", "only refreshes the block", "asks before touching a file not in the plan", "copies without rewording" and "writes a failing test first" are best-effort. The spec says so once, up front. The `safe-update` claim is dropped: only docs-format 1 exists, so there is no migration to test, and a pack update runs nothing in the project.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Skills instruct, they don't enforce. Best-effort claims say so, and each is its skill's behavior case.

## Consequences
Why: a markdown skill can only change what the agent is told. Ticking an unenforceable claim as done gives false confidence. Enforcement is the backlog checker.
Revisit when: the checker arrives.
