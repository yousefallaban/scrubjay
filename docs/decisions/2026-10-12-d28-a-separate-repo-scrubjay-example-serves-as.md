---
id: 2026-10-12-d28-a-separate-repo-scrubjay-example-serves-as
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# A separate repo, scrubjay-example, serves as the sandbox now and as the public example and eval fixtures later

## Context
It is a small app with its starting state tagged `baseline`. Experiments run on branches, and a messy branch is deleted and restarted from `baseline`.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
A separate repo, scrubjay-example, serves as the sandbox now and as the public example and eval fixtures later.

## Consequences
Why: one repo does three jobs (sandbox, fixtures, documentation by example) without putting experiments in this repo.
Revisit when: fixtures need more than one app shape.
