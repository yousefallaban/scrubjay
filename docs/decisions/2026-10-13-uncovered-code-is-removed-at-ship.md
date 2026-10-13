---
id: 2026-10-13-uncovered-code-is-removed-at-ship
status: accepted
spec: 2026-10-13-no-slop
date: 2026-10-13
---
# Code no claim covers is removed at ship, or gets a claim with a new go

## Context
The fresh review at ship reports behavior in the diff that no claim covers, and in both dogfood runs it found some: a return value nobody asked for, defensive copies, an optional parameter, a tie-break rule. The finding went into the pull request and the code shipped with it. A case with an exported helper and a test carrying no claim reference, shipped with a prompt that said nothing about it, scored 0.4: the helper stayed and the pull request did not name it.

## Options
- Report only, as before: lost, since a reported extra line still becomes precedent.
- Remove, or claim with the owner's go: won, because the spec is the contract and anything outside it is either a mistake or a claim that was never written.
- Ask the owner before removing: lost, and it was tried first. Worded "unless the owner adds a claim", the agent stopped to ask on every uncovered helper, and a non-interactive ship ended before anything shipped; the case stayed at 0.4 and an existing ship case fell to 0.12.

## Decision
spec-ship removes code the diff has that no claim covers, together with the tests that exercise it, without asking; a test-only helper nothing outside the tests calls stays; the tests run again; the pull request names each removal. An owner who wants the code back adds a claim, a change to the spec with a new go, and only an owner saying so in the session turns the removal into a claim.

## Consequences
Why: a codebase rots one unasked-for line at a time, and the review already finds the line.
Revisit when: a kind of uncovered code turns out to be needed by every change, such as a test helper; then it gets a rule of its own rather than a claim.
