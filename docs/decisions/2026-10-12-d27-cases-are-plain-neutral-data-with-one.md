---
id: 2026-10-12-d27-cases-are-plain-neutral-data-with-one
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Cases are plain, neutral data, with one runner per agent. Static checks need no agent CLI. v0.1 runs the cases on Claude Code and Codex

## Context


## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Cases are plain, neutral data, with one runner per agent. Static checks need no agent CLI. v0.1 runs the cases on Claude Code and Codex.

## Consequences
Why: `claude plugin eval` and `claude plugin validate` only run in Claude Code. Neutral cases plus thin runners keep testing possible from any agent, and adding an agent means adding a runner, never rewriting cases.
Revisit when: a cross-agent eval standard appears.
Changed in part by D30.
