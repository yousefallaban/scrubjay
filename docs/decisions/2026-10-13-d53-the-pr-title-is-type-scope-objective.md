---
id: 2026-10-13-d53-the-pr-title-is-type-scope-objective
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-13
---
# The PR title is type(scope): objective, and the description fills the repo's own template when it has one, else spec-ship's with Links, Description, Unrelated changes, Release impact, Review and Outcome

## Context
Supersedes the title half of D7; the branch stays the link to the spec while work is open. Type is the kind, feature or fix, with `refactor` for a fix that changes no behavior. Scope is the ticket key from the spec's `issue:` line, else the slug. Objective is the spec's title. The ticket link joins the `issue-tracker` address in `index.md` to the key. Unrelated changes are the files the fresh review found outside plan.md. Release impact is proposed from the kind and the claims, MINOR for a feature, PATCH for a fix with claims, no release impact for a fix without, MAJOR when a claim is removed, and confirmed by the user in one question. Nothing is asked that the spec folder already holds.

## Options
- The choice in D7: replaced by this one

## Decision
The PR title is type(scope): objective, and the description fills the repo's own template when it has one, else spec-ship's with Links, Description, Unrelated changes, Release impact, Review and Outcome.

## Consequences
Why: this is the shape teams already use for pull requests, so a shipped spec lands in a review queue looking like every other PR, and the ticket key reaches the main branch history. A repo with its own template keeps it.
Revisit when: a team needs commit message conventions from the pack as well; for now a company skill can add them.
