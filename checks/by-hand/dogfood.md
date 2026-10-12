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
| 2026-10-13 | Claude Code 2.1.272 | steps 1 to 3 done: docs-init, docs-map (15 claims), spec-start grilled in 2 rounds to 10 claims with the go recorded; step 4 stopped by the usage limit | pending, step 5 | pending | `transcripts/dogfood-claude-*.jsonl` |
| 2026-10-13 | Codex 0.154.0 | step 1 done in a worktree `.wt-codex`; step 2 running when the session ended | pending | pending | `transcripts/dogfood-codex-*.jsonl` |
