---
id: 2026-10-12-d6-the-kind-decides-the-flow
status: superseded by D32
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The kind decides the flow

## Context
| Kind | Steps | Who says go |
| --- | --- | --- |
| feature | start, plan, build, ship | the owner, after spec-start |
| fix | start, build with a failing test first, ship; a plan only when it takes several steps | the owner of the affected capability, before ship |
| refactor | start, plan, build, ship; the spec says "No behavior change." | engineering |
| chore | start, build, ship | nobody |
The statuses are draft, approved, building, shipped and cancelled.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
The kind decides the flow.

## Consequences
Why: small work needs a fast path, or people skip the flow entirely.
Revisit when: real specs show a kind's overhead is larger than the change itself.
