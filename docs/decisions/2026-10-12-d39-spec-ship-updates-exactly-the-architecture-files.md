---
id: 2026-10-12-d39-spec-ship-updates-exactly-the-architecture-files
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# spec-ship updates exactly the architecture files plan.md lists, and reference files are not marked

## Context
Supersedes the promotion mechanics in D14. plan.md's "Architecture to update at ship" names each area file and the reference file it comes from. spec-ship applies that list. The reference file stays as it was.

## Options
- The choice in D14: replaced by this one

## Decision
spec-ship updates exactly the architecture files plan.md lists, and reference files are not marked.

## Consequences
Why: a "stays true" judgment at ship was the step most likely to be skipped or done wrong, and the plan already made the call. Bet A needs architecture/ to be true, not reference files to be annotated.
Revisit when: plans regularly miss an architecture update that ship then has to find.
