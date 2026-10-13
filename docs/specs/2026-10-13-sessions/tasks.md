---
spec: 2026-10-13-sessions
---
Session 2026-10-13: resumed at T1; first message: "go".

- [ ] T1 Test run before the task in spec-build, case first: a session without a shell says "continue" and is asked for `bun test` before any edit -> starts-with-a-test-run
- [ ] T2 Handoff line in spec-build, the tasks rules and the template, case first: a session told to stop before the code leaves a handoff line under T2 -> handoff
- [ ] T3 Separate-session review in spec-ship, checked by hand on Codex: a ship on scrubjay-example starts a read-only session with the review prompt, transcript kept -> review-in-a-separate-session
- [ ] T4 Reruns at three runs: the evals README line, then every spec-build and spec-ship case with `--runs 3 --threshold 1` -> check: exit 0
