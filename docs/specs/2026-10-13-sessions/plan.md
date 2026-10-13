---
spec: 2026-10-13-sessions
---
## Approach
Three rules, each proven before it is written. spec-build runs the test command before the task, so a session knows the state it inherited, and writes a handoff line under the task when it stops before the tick; the tasks rules and template name that line next to note and redo. spec-ship's no-sub-agent fallback names a separate read-only session of the agent, started from the shell, before the stop-and-hand-over; it stays a stated fallback, since both tested agents have sub-agents, and the by-hand run on Codex 0.162 records the spawned reviewer. The regression reruns move to the runner's default of three runs with `--threshold 1`, so a case has to pass every run. The version goes to 0.1.2 in both manifests.

## Files
```
plugin/skills/spec-build/SKILL.md                      changed: the test run before the task, the handoff line, reported on resume; a red flag each
plugin/skills/spec-ship/SKILL.md                       changed: the no-sub-agent fallback names a separate read-only session from the shell, stated only; the slug named as the id without its date
plugin/evals/spec-ship/*/fixture.sh, prompt.md          changed: the built code holds only claimed behavior; the prompts pre-confirm the green run after a removal
plugin/evals/spec-build/writes-failing-test-first/     changed: the prompt reports the green run the new rule asks for
plugin/skills/docs-conventions/references/tasks.md     changed: the handoff line under an open task
plugin/skills/docs-conventions/assets/tasks.md         changed: the handoff line in the rules comment
plugin/evals/spec-build/asks-for-the-test-run-first/   new: a session without a shell says "continue"; graded on the ask coming before any edit
plugin/evals/spec-build/writes-a-handoff/              new: a session told to stop before the code; graded on the handoff line under T2
plugin/evals/README.md                                 changed: reruns at three runs with --threshold 1
plugin/CREDITS.md                                      changed: Anthropic's harness notes
checks/by-hand/fresh-review-on-codex.md                new: the Codex 0.162 ship run, a spawned reviewer with a fresh context, transcript kept
plugin/plugin.json, plugin/.claude-plugin/plugin.json  changed: version 0.1.2
```

## Architecture to update at ship
- conventions.md, from this plan: a regression rerun after a skill change uses three runs and `--threshold 1`, so a case passes only when every run passes

## Risks
- The test-run case may pass without the rule if the agent asks for a run first on its own. The baseline arm decides, as with writes-plain; a case that passes in both arms is kept as the guard and the decision says so.
- A nested Codex session is blocked inside the sandbox, with or without network, and answers outside it; the fallback says to ask for escalated permissions, and no tested agent reaches it.
