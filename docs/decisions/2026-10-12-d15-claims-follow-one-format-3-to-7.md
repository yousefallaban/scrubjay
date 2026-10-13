---
id: 2026-10-12-d15-claims-follow-one-format-3-to-7
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Claims follow one format, 3 to 7 per capability, and test names carry the claim reference

## Context
```
- <Actor> <does or sees something observable, present tense> {#claim-id}
  e.g. <a concrete situation> -> <the observable result>
```

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Claims follow one format, 3 to 7 per capability, and test names carry the claim reference.

## Consequences
Why: one testable sentence per claim, readable by owners. The claim ID in the test name lets anyone find the test behind a claim.
Revisit when: owners can't read the claims, or tests can't be linked to them.
