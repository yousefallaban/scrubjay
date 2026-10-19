Purpose: the by-hand check for `resumes`, the claim the AGENTS.md block drives together with the four in `answers-from-docs.md` and `verifies-on-doubt.md`. The eval runner can't grade it in a real project, so it is checked on both agents on `scrubjay-example`, with transcripts kept under `transcripts/`. This file once checked `session-line` too; the docs-hold-state spec removed that claim, so the check now fails when a session line appears.

## Setup

Branch `add-wishlist` of `scrubjay-example`, named after the spec slug as the block requires: the block as shipped, and the wishlist spec mid-build in the current shape, T1 ticked and bare, T2 open with a note and a handoff line that say the code and its three tests exist and were not run, T3 open. `bun test` is green, 17 tests. Claude Code runs with the pack from this repo's `plugin/` folder and the marketplace copy disabled for the run; Codex runs with no pack installed, so the block alone drives it.

## The check

Start a fresh non-interactive session in the repo and say only "continue":

- Claude Code: `claude -p "continue" --max-turns 12 --plugin-dir <this repo>/plugin --allowedTools "Bash(bun test*) Bash(git *) Read Edit Write Glob Grep Skill" --output-format stream-json --verbose < /dev/null`
- Codex: `codex exec --json --sandbox workspace-write "continue" < /dev/null`

Passes when the reply names T2 and the note under it before doing anything else, and when `tasks.md` afterwards has nothing above the tasks. Fails when the agent asks what to work on, starts somewhere else, or writes a session line. When the session reaches the tick, note whether the lines under T2 went and whether a commit with the task line was made; that is the skill's claim; the eval cases grade the commit the agent says it would make, and the real repo shows the commit itself.

## Record

| Date | Agent | Named T2 and the note first | Nothing above the tasks | At the tick | Transcript |
| --- | --- | --- | --- | --- | --- |
| 2026-10-19 | Claude Code 2.1.296, pack from `plugin/` | no: it read tasks.md first and ran the tests without saying where the work stood | yes | T2 ticked with the note and handoff gone, then `feat: T2 Save and list, with duplicates kept to one entry [saves-item, no-duplicates, lists-saved]` committed with the task's files; T3 ticked, run ended at the turn budget before its commit | `transcripts/2026-10-19-resumes-claude.jsonl` |
| 2026-10-19 | Claude Code 2.1.296, pack from `plugin/`, second run | no: same as above, one line about loading the skill and the task list, then the tests | yes | T2 and T3 ticked, lines gone, two commits with the task lines, clean tree; the run ended at the turn budget after the second commit | `transcripts/2026-10-19-resumes-claude-2.jsonl` |
| 2026-10-19 | Codex 0.162.1, no pack installed | partly: "The wishlist spec is mid-build: save and list are written, but their tests haven't been run. I'll verify those, then finish the module export." before any edit, naming the handoff's content but not T2 or the note | yes | T2 and T3 ticked, but the note stayed and it added its own `check:` lines under both, which fails `cleared-at-tick`, a rule the block does not carry and no installed skill told it; no commit, since no skill asked and its sandbox keeps `.git` read-only | `transcripts/2026-10-19-resumes-codex.jsonl` |

A first pass ran on a branch named `hold-state-check`: Claude Code read tasks.md, wrote no session line, and refused to continue because no branch carried the spec's slug, which is the block's branch rule working; Codex ignored the mismatch. Both agents first looked for `docs/specs/add-wishlist/` before finding the dated folder. `transcripts/2026-10-19-resumes-claude-wrong-branch.jsonl` and `transcripts/2026-10-19-resumes-codex-wrong-branch.jsonl` hold those runs.

Verdict so far: Claude Code passes everything but the spoken report, Codex without the pack passes the block's part only. The spoken report is the one part of `resumes` these runs did not show: with the bare word "continue" in a non-interactive session, Claude Code read the file and acted on it without saying so, while the eval case, which asks "where were we?", passes in every run. Resuming without re-explaining held; the sentence for the human did not appear.
