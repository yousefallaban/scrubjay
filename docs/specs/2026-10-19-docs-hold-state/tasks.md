---
spec: 2026-10-19-docs-hold-state
---
- [x] T1 The tick, case first: a fixture where T2 is open with a note and a handoff line and the session cannot run commands; baseline, then the tick step in spec-build, the tasks reference and template -> commits-at-tick, cleared-at-tick, notes, polish
- [x] T2 The recheck without a line: update the rechecks-after-change graders, then spec-build's recheck step -> rechecks-tasks
- [x] T3 No session line: spec-build's resume step, the block, the resume fixture and the three session-line graders, this repo's AGENTS.md; by-hand resumes check rerun on both agents and transcripts kept -> session-line, block-cases
- [x] T4 The Outcome without counts: spec-ship step 10 and layout, the two Outcome graders -> reports-outcome
- [x] T5 The current-state rule in docs-conventions, version 0.3.0 -> state-not-history, reference-is-state removed, check: both manifests agree at 0.3.0
- [x] T6 Rerun every spec-build and spec-ship case three times with the baseline arm -> check: exit 0
