---
id: 2026-10-13-d55-index-md-carries-a-one-line-behavior
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-13
---
# index.md carries a one-line Behavior section pointing at behavior/

## Context
Extends D44. The by-hand check on Codex showed the gap: with the Behavior column gone and the path rule living in a template comment that is removed on write, the written `index.md` pointed at nothing under `behavior/`, and an agent following the block's "load only what they link to" answered from the code without ever opening the behavior file. One real line fixes it without bringing back a per-row column that drifts.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
index.md carries a one-line Behavior section pointing at behavior/.

## Consequences
Why: the block only works if the first file it names leads to the claims.
Revisit when: never.
