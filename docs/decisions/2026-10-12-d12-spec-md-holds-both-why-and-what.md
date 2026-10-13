---
id: 2026-10-12-d12-spec-md-holds-both-why-and-what
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# spec.md holds both why and what. There is no separate intent.md

## Context


## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
spec.md holds both why and what. There is no separate intent.md.

## Consequences
Why: a separate intent file adds a gate and a file for a split most specs don't need. Why stays short (2 to 5 lines), and the owner approves both together.
Revisit when: owners want the why agreed before any exact behavior is written. A separate intent file with its own gate is in the backlog.
