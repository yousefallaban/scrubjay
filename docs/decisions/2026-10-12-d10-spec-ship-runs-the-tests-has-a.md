---
id: 2026-10-12-d10-spec-ship-runs-the-tests-has-a
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# spec-ship runs the tests, has a fresh reviewer compare the diff with the spec, updates behavior/ and architecture/, and sets shipped inside the PR. It asks whether to create the PR or show the text to paste, and it never merges

## Context


## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
spec-ship runs the tests, has a fresh reviewer compare the diff with the spec, updates behavior/ and architecture/, and sets shipped inside the PR. It asks whether to create the PR or show the text to paste, and it never merges.

## Consequences
Why: shipped becomes true on main exactly when the code merges. Merging is the team's decision, and without `gh`, showing the text is the only option.
Revisit when: a team wants spec-ship to open draft PRs automatically.
