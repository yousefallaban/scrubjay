---
spec: 2026-10-19-plan-keeps-size
---
- [x] T1 Reopen, not append, case first: T2 ticked and a request to do its list differently; baseline, then the rule in spec-build's recheck and polish steps with a red flag -> reopens-not-appends
- [x] T2 Scope in the plan: the template, reference and charter row; spec-plan step 5; spec-build step 7 and verification; spec-ship step 5 and layout; the inside-scope case and the asks case; the plan-shape grader; the fixture pass; AGENTS.md; the outside-Scope ship case -> writes-plan, stays-in-scope, writes-inside-scope, polish, rechecks-tasks, fresh-review, pr-template
- [x] T3 Version 0.4.0 -> check: both manifests agree at 0.4.0
- [ ] T4 Rerun every spec-build, spec-plan, spec-ship and docs-conventions case three times with the baseline arm on the default model -> check: exit 0
  - handoff: done: the first nine spec-build cases passed at 1.00 in three runs; red: a Claude session limit errored every later run, so spec-build from rechecks-after-change on, spec-plan, spec-ship and docs-conventions have no result; next: rerun the four suites with `--runs 3 --concurrency 3`, then ship with the scratchpad script apply-ship-plan-keeps-size.py, the decision draft and the PR body draft
