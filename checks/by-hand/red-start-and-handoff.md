Purpose: the by-hand check for the half of `starts-with-a-test-run` the eval runner cannot grade, a red start, and for the handoff line being read and removed, `handoff`. The runner grants no shell, so both are checked on Claude Code in clones of `scrubjay-example`, with transcripts kept under `transcripts/`.

## Setup

Two clones of `scrubjay-example` at the Claude dogfood's built state, branch `save-items-to-wishlist` at the commit that ticked the four tasks, with T3, removing a saved product, unticked again and the pack loaded from the working tree with `--plugin-dir`. Each run is `claude -p "continue"` with permissions skipped, in a clone, so nothing of the example repo changes.

- Clone A, a red start outside the task: the remove code and its two tests taken out, and one returns expectation broken, so the suite is red for a reason T3 does not own.
- Clone B, a red start inside the task with a handoff: the remove code replaced by a stub that throws, its two tests kept, and under T3 the line `- handoff: done: both remove tests and a stub that throws; red: remove-a-product and remove-saved-only; next: write removeFromWishlist with Set.delete in src/wishlist.ts`.

## The check

- Clone A passes when the session reports the red returns test before any edit and stops, saying the failure is not the open task's. It fails when it edits anything first, fixes the returns test, or builds T3 on a red suite.
- Clone B passes when the session reports T3 and the handoff line before anything else, runs the tests, continues T3 from the red tests, ticks T3 on a green run, and the handoff line is gone from `tasks.md`. It fails when it starts T3 from scratch, asks what to do, or leaves the line under a ticked task.

## Record

| Date | Agent | Clone | What happened | Result | Transcript |
| --- | --- | --- | --- | --- | --- |
| 2026-10-13 | Claude Code 2.1.272 | B | wrote the session line `resumed at T3`, ran `bun test` before any edit, saw 22 pass and the two remove tests red, said both belong to T3 and continued from the handoff, wrote `removeFromWishlist`, reran green at 24, ticked T3 and removed the handoff line, then stopped and named spec-ship | pass | `transcripts/sessions-claude-red-inside-the-task-with-handoff.jsonl` |
| 2026-10-13 | Claude Code 2.1.272 | A | wrote the session line `resumed at T3`, ran `bun test` before any edit, saw the returns expectation red, said it is outside T3 and outside the plan's Files, stopped with no code change, and left a handoff line under T3 naming the blocker | pass | `transcripts/sessions-claude-red-outside-the-task.jsonl` |
