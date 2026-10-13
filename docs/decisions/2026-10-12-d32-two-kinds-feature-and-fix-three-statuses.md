---
id: 2026-10-12-d32-two-kinds-feature-and-fix-three-statuses
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Two kinds, feature and fix. Three statuses, draft, building and shipped. One go rule

## Context
Supersedes the kind table and status list in D6. A feature is grilled and planned and needs the owner's go before planning. A fix takes the fast path, writes a failing test first, and needs the owner's go before ship only when it has claims. A fix with no claims writes "No behavior change." Refactor and chore are fixes. The owner is whoever `index.md` lists for the domain; when that is the user, their OK in session is the go. The go is the `approved` line, never a status.

## Options
- The choice in D6: replaced by this one

## Decision
Two kinds, feature and fix. Three statuses, draft, building and shipped. One go rule.

## Consequences
Why: the bets need one distinction, whether the change alters behavior. Four kinds with four approvers was where a first-time user got lost, refactor's "engineering" go was recorded nowhere, and `status: approved` duplicated the line D8 already made the single source of truth.
Revisit when: a real refactor or chore shows it needs its own steps.
Changed in part by D57.
