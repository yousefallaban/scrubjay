---
id: 2026-10-13-sessions
kind: feature
status: draft
summary: A build session runs the tests before its task and leaves a handoff when it stops early; a ship on an agent without sub-agents reviews in a separate session it starts itself
request: do items 1 to 3 from the research, sessions start green and end with a handoff, Codex reviews with its own command, the release check runs three times
approved: {by: yousef, via: in session}
---
# Sessions: start on a test run, end with a handoff, review in a separate session

## Why
A build session that runs out of context mid-task leaves half-written code and a red test, and the next session finds them halfway through its own work. It happened twice while shipping no-slop. Anthropic's notes on long-running agents name the same two failures: work abandoned mid-feature with nothing written down, and a session that starts on a broken state it did not check. On Codex, which has no sub-agents, the fresh review at ship still stops and hands the user a prompt to run elsewhere, although the agent has a shell and can start that session itself.

## What changes

### Add · spec/build
- spec-build runs the project's test command before it touches the next task, and a red start is reported before any file the task touches changes {#starts-with-a-test-run}
  e.g. a session that cannot run commands says "continue" -> "Run `bun test` and tell me the result" comes before any edit to `src/` or `test/`
- When a session stops before its task is ticked, spec-build writes one handoff line under the task: what exists, what is red or unfinished, and the next step; the line goes when the task is ticked {#handoff}
  e.g. `- handoff: done: failing test for no-duplicates; red: save not written; next: write save in src/wishlist.ts`

### Add · spec/ship
- Without a sub-agent, spec-ship starts a separate read-only session of the agent from the shell with the review prompt and takes its findings; it stops to hand over the prompt only when it has no shell either {#review-in-a-separate-session}
  e.g. Codex: `codex exec --sandbox read-only "<the review prompt>"` -> the findings land under Review, and the pull request says the review ran in a separate session

## Not doing
- A commit after each task. When to commit is the repo's rule; the handoff line is what the next session needs.
- A recipe for running spec-build in a loop with nobody present. Terminal only; later, on a signal.
- A bullet in the AGENTS.md block that sends the agent to docs-map. spec-start already offers docs-map when a domain has no behavior folder.
- A target for context use per session. No agent-neutral way to read it.
