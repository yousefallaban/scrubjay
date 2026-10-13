---
id: 2026-10-12-d33-changing-course-lives-in-spec-build-and
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Changing course lives in spec-build, and ambiguous claim IDs are written as capability#id

## Context
The five change-course claims sit under spec/build, since that is where a change arrives. Tests and tasks reference a claim by `capability#id` whenever the bare ID is not unique in the spec.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Changing course lives in spec-build, and ambiguous claim IDs are written as capability#id.

## Consequences
Why: a claim no skill owns won't be written. Bare IDs collided across capabilities and broke the task-to-claim link.
Revisit when: a change arrives so often outside building that it needs its own command.
