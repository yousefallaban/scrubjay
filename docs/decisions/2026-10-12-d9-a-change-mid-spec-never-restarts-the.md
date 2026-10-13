---
id: 2026-10-12-d9-a-change-mid-spec-never-restarts-the
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# A change mid-spec never restarts the flow

## Context
The agent updates the file the change belongs to, rechecks every task (keep, redo, new or drop), and waits for an OK. If Why or What changes changed, the `approved` line is removed until the owner says go again. A change that grows the scope becomes a follow-up spec.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
A change mid-spec never restarts the flow.

## Consequences
Why: people change their minds. Restarting wastes work, and silent edits break the link between the spec and the code.
Revisit when: rechecks become noisy in practice.
