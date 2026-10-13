---
id: 2026-10-12-d16-what-changes-uses-the-words-add-change
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# What changes uses the words Add, Change and Remove, not +, ~ or - marks

## Context
A Change carries a `was:` line, and a Remove carries a `reason:` line.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
What changes uses the words Add, Change and Remove, not +, ~ or - marks.

## Consequences
Why: plain words are clear to everyone, and the marks were confusing when someone changed their mind within a session. Computing the marks against main is in the backlog.
Revisit when: hand-written change lists go wrong or conflict.
