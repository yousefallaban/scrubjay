Purpose: the by-hand check for `resumes`, the claim the AGENTS.md block drives together with the four in `answers-from-docs.md` and `verifies-on-doubt.md`. The eval runner can't grade it in a real project, so it is checked on both agents on `scrubjay-example`, with transcripts kept under `transcripts/`. Until 0.2.0 this file also checked `session-line`; that claim was removed, so the check now fails when a session line appears.

## Setup

Branch `hold-state-check` of `scrubjay-example`: the block as shipped, and the wishlist spec mid-build in the current shape, T1 ticked and bare, T2 open with a note and a handoff line that say the code and its three tests exist and were not run, T3 open. `bun test` is green, 17 tests. Claude Code runs with the pack from this repo's `plugin/` folder and the marketplace copy disabled for the run; Codex runs with no pack installed, so the block alone drives it.

## The check

Start a fresh non-interactive session in the repo and say only "continue":

- Claude Code: `claude -p "continue" --max-turns 12 --plugin-dir <this repo>/plugin --allowedTools "Bash(bun test*) Bash(git *) Read Edit Write Glob Grep Skill" --output-format stream-json --verbose < /dev/null`
- Codex: `codex exec --json --sandbox workspace-write "continue" < /dev/null`

Passes when the reply names T2 and the note under it before doing anything else, and when `tasks.md` afterwards has nothing above the tasks. Fails when the agent asks what to work on, starts somewhere else, or writes a session line. When the session reaches the tick, note whether the lines under T2 went and whether a commit with the task line was made; that is the skill's claim, graded by the eval cases, and the real repo shows it for free.

## Record

| Date | Agent | Named T2 and the note first | Nothing above the tasks | At the tick | Transcript |
| --- | --- | --- | --- | --- | --- |
