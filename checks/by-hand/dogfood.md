Purpose: the end-to-end run of the wishlist feature on `scrubjay-example` with the pack installed, on both agents. It proves the quickstart and gives the resume and session-line checks a real spec to run on. Each step is a fresh non-interactive session, so every step after the first is a resume.

## Setup

- The pack installed from the private repo at the branch under test: Claude Code `claude plugin marketplace add 'yousefallaban/scrubjay#v0-1'` and `claude plugin install scrubjay@yousefallaban`; Codex `codex plugin marketplace add yousefallaban/scrubjay --ref v0-1` and `codex plugin add scrubjay@yousefallaban`.
- `scrubjay-example` at tag `baseline`, on a branch named `dogfood-<agent>`, with no docs yet.
- The fictional owner, Sanne, is played by the person running the check, who says so in every prompt that carries her answers.

## Steps

Each step is one `claude -p "<prompt>"` or `codex exec "<prompt>" < /dev/null` in the repo, with the transcript saved under `transcripts/dogfood-<agent>-<step>.jsonl`.

1. docs-init, with the four answers in the prompt: the product, the returns domain owned by Sanne, no tracker, `bun test`.
2. docs-map returns, with Sanne's confirmation given in advance for drafts that match the code and tests.
3. spec-start, the wishlist sentence, with Sanne's answers to the obvious rounds in the prompt and the go given explicitly at the end.
4. spec-plan, with the design answers in the prompt and the OK given explicitly.
5. spec-build "continue", once per task, each a fresh session. The first of these is the resume check.
6. spec-ship, with the test result confirmed by the agent itself since this session can run commands, the re-explain count, MINOR confirmed, and "show the PR text".

## Passes when

- The run reaches a PR title and description with every section filled, `status: shipped` in the spec, and `docs/behavior/wishlist/` holding the claims word for word.
- Step 5's first session names the next task and the note without being told, and `tasks.md` gains a session line per session.
- The shipped claims match what was asked in step 3.

## Record

| Date | Agent | Reached the PR text | Resume named the next task | Session lines | Transcripts |
| --- | --- | --- | --- | --- | --- |
| 2026-10-13 | Claude Code 2.1.272 | yes: six steps, title `feature(save-items-to-wishlist): Save items to a wishlist`, every section filled, `status: shipped`, 10 claims word for word under `behavior/wishlist/` | yes: "continue" named T1 and said no note or redo was under it, before the first test | one per session, three in all | `transcripts/dogfood-claude-*.jsonl` |
| 2026-10-13 | Codex 0.154.0 | step 1 done in a worktree `.wt-codex`; step 2 done, behavior files written from the code and tests | pending | pending | `transcripts/dogfood-codex-*.jsonl` |

## Findings

Loopholes the run found, each turned into a rule in the pack the same day.

- Claude Code, step 5, second session: with every task ticked, a bare "continue" went on to ship the spec unasked, by the book but without being asked: tests, a fresh review, `behavior/`, `architecture/`, `status: shipped`, then out of turns in the PR text. Fix: spec-build stops when every task is ticked and names spec-ship as the next step. The unasked ship was reverted and step 6 rerun on the fixed pack. Transcript `dogfood-claude-5b-spec-build.jsonl`.
- Claude Code, step 6: the fresh reviewer counted `AGENTS.md` and `CLAUDE.md` from the docs-init commit as code outside the plan. Fix: the files the flow itself writes, the block and the import included, are never unrelated.
- Claude Code, step 5: the machine's own session-start hook injected a summary of the previous session, a confound for the resume check. The agent still read `tasks.md` first and reported from it; the hook is not part of the pack.
- Codex, step 3: created `tasks.md` at spec-start because the block says every session adds its line, and wrote "awaiting Sanne's answer" under Why before the first round. Fixes: a spec-start red flag, and a conventions rule that an unsettled section keeps its heading alone.
- Codex, step 3: two questions were answerable from the code, stock and persistence, and the sandbox could not create the branch inside a worktree; Codex said so and the branch was created by hand. The grilling ended with the go recorded and 12 claims over three capabilities.
- Codex, step 4: a fifth task "ship with spec-ship" and docs files under Files. Fix: tasks cover the build only and Files lists code and tests; the correction went in through the OK and Codex recorded it as a Rechecked line.

