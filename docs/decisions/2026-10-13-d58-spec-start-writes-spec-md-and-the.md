---
id: 2026-10-13-d58-spec-start-writes-spec-md-and-the
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-13
---
# spec-start writes spec.md and the index.md row only; tasks.md is written at planning. A required section not yet settled keeps its heading alone

## Context
Found in the Codex dogfood: the block's "every session adds its line to tasks.md" made spec-start create a `tasks.md` with a session line and two invented tasks, one of them "create the branch", and write "awaiting Sanne's answer" under Why before the first round. A spec-start session has nothing to resume, and a pending-answer sentence is "TBD" in more words. The rule is a red flag in spec-start and a line in the conventions; the block keeps its line, since every session on a planned spec does add one.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
spec-start writes spec.md and the index.md row only; tasks.md is written at planning. A required section not yet settled keeps its heading alone.

## Consequences
Why: `tasks.md`'s job is where the work stands, and the work starts at the plan's OK.
Revisit when: the block line causes it again on another agent; then the block says "once the spec has a tasks.md".
