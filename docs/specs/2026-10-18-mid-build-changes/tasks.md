---
spec: 2026-10-18-mid-build-changes
---
Session 2026-10-18: resumed at T1; first message: "Go with all 5".
Session 2026-10-19: resumed at T6; first message: "ok run".

- [x] T1 Polish door, case first: T2 ticked and "footer padding 12px" leaves a redo line under T2, no Rechecked line and an unchanged Approach; then step 9 in spec-build, the tasks rules and template, and the recheck graders tightened to changed tasks only -> polish, rechecks-tasks
  - note: polish case 0.67 before the rule, a Rechecked line written and the value put into Approach; 1.00 with it. Recheck case 0.86 before, "keep" in the line; 1.00 with it.
- [x] T2 One-sentence claims on a change of course: a grader on rechecks-after-change for a fourth claim, then the rule and its red flag in spec-build -> one-sentence-claims
  - note: the fourth-claim grader passed before the rule as well; kept as the guard, as the sessions spec did with writes-plain.
- [x] T3 Reference files are state, case first: a second browser-check run replaces the first run's paragraph; then the reference rules and a red flag in spec-build -> reference-is-state
  - note: 0.83 before the rule, the first run's sentence kept under the one heading; 1.00 with it.
- [x] T4 Approach is shape only: the plan rules and a red flag in spec-build -> check: the polish case's approach-unchanged grader passes with the rule
  - note: that grader failed before the rule and passes with it.
- [x] T5 Deferred follow-ups, cases first: "share by link, later" writes one line to reference/follow-ups.md, and the ship case names both follow-ups in the Outcome; then step 10 in spec-build and spec-ship -> follow-up-spec, reports-outcome
  - note: build case 0.40 before, spec-build did not fire on "for later"; the description now names it; 1.00 with it. Ship case 0.67 before, no Follow-ups line; 1.00 with it.
- [x] T6 Rerun every spec-build and spec-ship case three times with the baseline arm, version 0.2.0 -> check: exit 0
  - note: spec-ship 9 of 9, spec-build 13 of 13 in the latest batch, about $45 of eval runs over five batches; three cases were rerun on 2026-10-19 after a session limit.
  - note: resumes-from-tasks needed step 3 widened to the resumes claim (D7), 1 of 3 before, 3 of 3 after; writes-a-handoff 2 of 3, then 3 of 3 after the step 8 tidy.
