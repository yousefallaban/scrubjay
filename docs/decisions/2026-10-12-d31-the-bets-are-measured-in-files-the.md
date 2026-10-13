---
id: 2026-10-12-d31-the-bets-are-measured-in-files-the
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The bets are measured in files the flow already writes

## Context
`spec.md` records what the spec started from as `request:`. Every session writes one line above the tasks in `tasks.md`: date, where it resumed, whether it needed re-explaining. spec-ship puts the session count, the re-explain count and what changed between the request and the shipped claims into the PR description.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
The bets are measured in files the flow already writes.

## Consequences
Why: v0.1 exists to test the bets, and nothing recorded whether they held. The kill-or-rethink rule in ROADMAP needs numbers, not an impression.
Revisit when: the measures are never read, or a measure is needed that these lines can't give.
Changed in part by D48.
