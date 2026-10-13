---
id: 2026-10-12-d8-the-owner-s-go-can-come-from
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The owner's go can come from any channel, and it is recorded as approved: {by, via} only when the user reports it

## Context
When Why or What changes changes, the agent removes the line, and the owner's new go writes it back.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
The owner's go can come from any channel, and it is recorded as approved: {by, via} only when the user reports it.

## Consequences
Why: the owner is often not in the session. `via` (in session, a message link, or a PR) lets anyone check the approval later. The agent never infers a go. There is no date field: git dates the line, and removing the line on change means its presence alone says the go is current, with no date comparison. A date key `on` was dropped, partly because YAML 1.1 parsers read an unquoted `on` as boolean `true`.
Revisit when: a second person must approve. Approval by merge is in the backlog.
Changed in part by D32.
