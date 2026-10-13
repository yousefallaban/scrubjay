---
id: 2026-10-12-d49-a-skill-body-starts-with-the-process
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# A skill body starts with the process, then verification, then red flags where D41 allows. What and when live in the description. Practices are marked not user-invocable

## Context
Supersedes the section order in D41. The standard puts what and when in `description` and recommends a body of steps, examples and edge cases; Claude Code keeps only the start of a skill after compaction, so an overview at the top spends the lines that survive. Practices carry Claude Code's `user-invocable: false`; if an agent's validator rejects an unknown top-level key, the key moves under `metadata`. Checked at build, and the frontmatter check whitelists the keys each agent reads.

## Options
- The choice in D41: replaced by this one

## Decision
A skill body starts with the process, then verification, then red flags where D41 allows. What and when live in the description. Practices are marked not user-invocable.

## Consequences
Why: no duplicated text at the top of every skill, and the slash menu shows commands only.
Revisit when: the standard adds an invocation field of its own.
