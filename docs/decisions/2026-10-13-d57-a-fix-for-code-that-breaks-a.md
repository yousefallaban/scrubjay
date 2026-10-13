---
id: 2026-10-13-d57-a-fix-for-code-that-breaks-a
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-13
---
# A fix for code that breaks a claim behavior/ already states changes no claim. It writes "No behavior change.", names the claim it restores, and needs no new go

## Context
Extends D32. Found while testing spec-start on "partial refunds are one cent off" against a behavior file that already stated the half-up rule: the agent wrote no Change claim, since the documented behavior was right and the code was wrong. That is the model working as designed. The spec carries `restores: returns/submit-return#partial-refund`, spec-build's one task names that claim, and the failing test carries its reference. The owner approved the claim when it was written, so the fix needs no second go.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
A fix for code that breaks a claim behavior/ already states changes no claim. It writes "No behavior change.", names the claim it restores, and needs no new go.

## Consequences
Why: a Change with a `was:` line equal to the new text says nothing, and a go for restoring what the owner already approved is ceremony.
Revisit when: a fix changes what a claim says as well; that is a Change, with a go.
