---
id: 2026-10-12-d29-this-repo-uses-its-own-flow-by
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# This repo uses its own flow by hand until the skills exist

## Context
The building agent writes `plan.md` and `tasks.md` for this spec and works task by task. At ship, `behavior/`, `architecture/` and `decisions/` are created from what proved true.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
This repo uses its own flow by hand until the skills exist.

## Consequences
Why: building the pack with the pack gives daily friction feedback, and it avoids mapping everything up front, which the design itself forbids.
Revisit when: v0.1 ships. From then on, the pack's own commands run here.
