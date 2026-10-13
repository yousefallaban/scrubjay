---
id: 2026-10-12-d3-six-commands-and-two-practices
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Six commands and two practices

## Context
The commands are `docs-init`, `docs-map`, `spec-start`, `spec-plan`, `spec-build` and `spec-ship`. The practices are `grilling` and `docs-conventions`.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Six commands and two practices.

## Consequences
Why: commands are typed by a person, and practices are loaded by the agent. That split comes from Matt Pocock. Commands start with `spec-` or `docs-` so they don't collide with the commands of the packs we studied.
Revisit when: a step is skipped in most real specs (merge it), or a step keeps growing past one job (split it).
