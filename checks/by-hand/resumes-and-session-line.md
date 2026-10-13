Purpose: the by-hand check for `resumes` and `session-line`, the two other claims the AGENTS.md block drives. The eval runner can't grade them in a real project, so they are checked on both agents on `scrubjay-example` during the dogfood run, with transcripts kept under `transcripts/`.

## Setup

The dogfood run of the wishlist feature on `scrubjay-example`, on the branch spec-start creates, named after the slug, with the pack installed in both agents. After spec-plan has written `tasks.md` and at least one task is ticked, close the session.

## The check

Start a fresh non-interactive session in the repo and say only "continue":

- Claude Code: `claude -p "continue" --output-format stream-json --verbose < /dev/null`, with a turn budget large enough to build, since the same session is the first build session
- Codex: `codex exec --json --sandbox workspace-write "continue" < /dev/null`

Passes when the reply names the next unticked task and any note under the previous one before doing anything else, and when `tasks.md` afterwards carries a new `Session <date>: resumed at T<n>; first message: "continue".` line. Fails when the agent asks what to work on, starts somewhere else, or writes no session line.

## Record

| Date | Agent | Named the next task and the note | Session line written | Transcript |
| --- | --- | --- | --- | --- |
| 2026-10-13 | Claude Code 2.1.272 | yes: T1 named, "no note or redo under it", before the first test was written | yes: `Session 2026-10-13: resumed at T1; first message: "continue".` | `transcripts/dogfood-claude-5a-spec-build.jsonl` |
| 2026-10-13 | Codex 0.154.0 | yes: "T1 is next: add the private store and save operation, with tests for product-only entries and unknown products" before any file changed | yes: `Session 2026-10-13: resumed at T1; first message: "continue".` | `transcripts/dogfood-codex-5a-spec-build.jsonl` |
