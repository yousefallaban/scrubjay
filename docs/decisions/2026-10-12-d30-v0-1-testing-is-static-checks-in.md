---
id: 2026-10-12-d30-v0-1-testing-is-static-checks-in
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# v0.1 testing is static checks in CI, cases as plain files, Claude Code as the eval runner, and Codex by hand

## Context
Supersedes the neutral case format, per-agent runners, fixture projects and the Codex release gate in D26 and D27. Static checks (frontmatter, manifests, templates, name, links) run on every PR. Cases are the plain prompt and criteria files that `claude plugin eval init` writes, so any agent or person can read them. Before release, every case passes on Claude Code and each command is run once by hand on Codex.

## Options
- The choice in D26: replaced by this one

## Decision
v0.1 testing is static checks in CI, cases as plain files, Claude Code as the eval runner, and Codex by hand.

## Consequences
Why: a case format, two runners and fixtures test the pack, not the bets, and they were the largest block of work in the spec. Codex plugin installs are UI-driven, so a Codex runner can't be scripted anyway.
Revisit when: a second contributor arrives, or skills regress after a model change.
