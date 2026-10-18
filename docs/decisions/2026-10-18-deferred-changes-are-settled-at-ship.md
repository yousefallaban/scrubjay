---
id: 2026-10-18-deferred-changes-are-settled-at-ship
status: accepted
spec: 2026-10-18-mid-build-changes
date: 2026-10-18
---
# A change the user defers goes into the spec's reference/follow-ups.md and is settled at ship

## Context
spec-build proposes a follow-up spec when a change grows the scope, and the repository keeps no backlog by decision. A change the user answered with "later" had no home: in the first spec built in daily use, six observations for later work ended a reference file and nothing would have picked them up at ship. spec-build also did not fire on "for later, not in this spec" until its description named that phrasing.

## Options
- A backlog document: lost, rejected by the repository-workflow decision and it grows forever.
- A Not doing line: lost, Not doing records what is deliberately out, not what is wanted later.
- One line per deferred change in the spec's own `reference/follow-ups.md`, and spec-ship asks in its outcome question whether each is kept for a spec or dropped, writing the answer into the PR Outcome: won.

## Decision
A deferred change is one line in `reference/follow-ups.md`, and spec-ship settles every line at ship as kept for a spec or dropped.

## Consequences
Nothing deferred is silently lost, and nothing accumulates: the file belongs to one spec and is settled when that spec ships. A kept follow-up still needs someone to run spec-start after the merge; the PR Outcome is the reminder.
