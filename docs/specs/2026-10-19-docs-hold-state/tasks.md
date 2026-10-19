---
spec: 2026-10-19-docs-hold-state
---
- [x] T1 The tick, case first: a fixture where T2 is open with a note and a handoff line and the session cannot run commands; baseline, then the tick step in spec-build, the tasks reference and template -> commits-at-tick, cleared-at-tick, notes, polish
- [x] T2 The recheck without a line: update the rechecks-after-change graders, then spec-build's recheck step -> rechecks-tasks
- [x] T3 No session line: spec-build's resume step, the block, the resume fixture and the three session-line graders, this repo's AGENTS.md; by-hand resumes check rerun on both agents and transcripts kept -> session-line, block-cases
- [x] T4 The Outcome without counts: spec-ship step 10 and layout, the two Outcome graders -> reports-outcome
- [x] T5 The current-state rule in docs-conventions, version 0.3.0 -> state-not-history, reference-is-state removed, check: both manifests agree at 0.3.0
- [ ] T6 Rerun every spec-build and spec-ship case three times with the baseline arm -> check: exit 0
  - handoff: done: spec-build suite 15 of 16 at 1.00, writes-a-handoff passed 2 of 3 runs (handoff-line-under-t2 missed once); red: the spec-ship suite errored on a session limit in every case, 3 minutes, no real result; next: rerun `claude plugin eval plugin --eval-dir evals/spec-ship ... --runs 3 --concurrency 3` and `--eval-dir evals/spec-build --case writes-a-handoff`, then ship: claims into behavior/ (one Add practice, one Add and three Changes spec/build incl. cleared-at-tick and resumes, Change ship, Change quality, two Removes), the decision record drafted in the scratchpad, status shipped, the PR body drafted in the scratchpad
