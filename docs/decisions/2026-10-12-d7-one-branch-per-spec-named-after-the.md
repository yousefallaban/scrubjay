---
id: 2026-10-12-d7-one-branch-per-spec-named-after-the
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# One branch per spec, named after the slug. The commit-prefix rule is dropped, and the PR title starts with the slug

## Context


## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
One branch per spec, named after the slug. The commit-prefix rule is dropped, and the PR title starts with the slug.

## Consequences
Why: the branch already ties every commit to the spec while the work is open. Squash merges replace commit messages with the PR title anyway, so `git log --grep <slug>` on main finds the commit, then the PR, then the spec. One less rule for agents to forget.
Revisit when: a team doesn't squash-merge and needs a commit-level link.
Changed in part by D53.
