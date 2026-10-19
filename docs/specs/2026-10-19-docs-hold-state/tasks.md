---
spec: 2026-10-19-docs-hold-state
---
- [ ] T1 The tick, case first: a fixture where T2 is open with a note and a handoff line and the session cannot run commands; baseline, then the tick step in spec-build, the tasks reference and template -> commits-at-tick, notes, polish
- [ ] T2 The recheck without a line: update the rechecks-after-change graders, then spec-build's recheck step -> rechecks-tasks
- [ ] T3 No session line: spec-build's resume step, the block, the resume fixture and graders, this repo's AGENTS.md; by-hand resumes check rerun on both agents and transcripts kept -> session-line, block-cases
- [ ] T4 The Outcome without counts: spec-ship step 10 and layout, the two Outcome graders -> reports-outcome
- [ ] T5 The current-state rule in docs-conventions, the README lines, version 0.3.0 -> state-not-history, check: both manifests agree at 0.3.0
- [ ] T6 Rerun every spec-build and spec-ship case three times with the baseline arm -> check: exit 0
