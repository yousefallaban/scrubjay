---
id: 2026-10-13-a-session-starts-with-a-test-run-and-ends-with-a-handoff
status: accepted
spec: 2026-10-13-sessions
date: 2026-10-13
---
# A build session runs the tests before its task and leaves a handoff line when it stops early

## Context
A session that runs out of context mid-task leaves half-written code and a red test, and the next session finds them halfway through its own work; it happened twice while shipping no-slop. Anthropic's notes on long-running agents name the same two failures, work abandoned mid-feature with nothing written down and a session that starts on a state it did not check, and answer them with a check at the start and a progress note at the end. Two cases measured the gap: a session without a shell told "continue" wrote the test file before asking for a test run, and a session told to stop before the code left nothing under the open task; 0.75 each, with the plugin and without it.

## Options
- Trust the last session to have left the branch green: lost, the last session may have been cut off.
- A commit after every task as the memory: lost, when to commit is the repo's rule, and a commit does not say what is red or what comes next.
- A test run before the task and one `- handoff:` line under an open task, removed at the tick: won, 3 of 3 runs at 1.00 for each case, and the next session reads it where it already looks, `tasks.md`.

## Decision
spec-build runs the project's test command before touching the task and reports a red start before any edit, and a session that stops before the tick writes `- handoff: done: <what exists>; red: <what fails or is unfinished>; next: <the first step>` under the task.

## Consequences
Why: the next session may not be the same agent, and a diff does not say what was meant.
Revisit when: a handoff line turns out to need more than one line; then it becomes a short section under the task, not a third file.
