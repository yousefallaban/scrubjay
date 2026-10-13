---
id: 2026-10-13-d60-spec-build-stops-when-every-task-is
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-13
---
# spec-build stops when every task is ticked and names spec-ship as the next step; "continue" never ships

## Context
Found in the Claude Code dogfood: a fresh session told "continue" with all four tasks ticked went on to ship, by the book, tests, a fresh review, `behavior/`, `architecture/`, `status: shipped`, and ran out of turns in the PR text. Nothing in it was wrong except that nobody asked. Shipping asks two questions and offers a choice; it is a command the user runs, not the next turn of a loop.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
spec-build stops when every task is ticked and names spec-ship as the next step; "continue" never ships.

## Consequences
Why: a step with gates and questions is asked for by name, so the user is there to answer them.
Revisit when: never.
