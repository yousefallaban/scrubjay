---
spec: 2026-10-13-sessions
---
Session 2026-10-13: resumed at T1; first message: "go".
Rechecked 2026-10-13 after: the separate-session review claim dropped, both tested agents spawn a fresh reviewer. T1 keep, T2 keep, T3 dropped, T4 keep.

- [x] T1 Test run before the task in spec-build, case first: a session without a shell says "continue" and is asked for `bun test` before any edit -> starts-with-a-test-run
  - note: 0.75 before the rule in both arms, the test file was written before the run was asked for; with the rule, 3 of 3 runs at 1.00.
- [x] T2 Handoff line in spec-build, the tasks rules and the template, case first: a session told to stop before the code leaves a handoff line under T2 -> handoff
  - note: 0.75 before the rule in both arms, no line under T2; with the rule, 3 of 3 runs at 1.00.
- [x] T4 Reruns at three runs: the evals README line, then every spec-build and spec-ship case with `--runs 3 --threshold 1` -> check: exit 0
  - note: 18 cases, every run at 1.00, results under checks/sessions/. Three runs caught what one hid: the removal step meeting the no-shell fallback in three ship cases, a test-first prompt needing the reported run, the slug read as the dated id once in three.
