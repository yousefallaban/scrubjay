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
6. spec-ship, with the test result confirmed by the agent itself since this session can run commands, MINOR confirmed, and "show the PR text".

## Passes when

- The run reaches a PR title and description with every section filled, `status: shipped` in the spec, and `docs/behavior/wishlist/` holding the claims word for word.
- Step 5's first session names the next task and the note without being told, and `tasks.md` gains nothing above the tasks; each tick is a commit.
- The shipped claims match what was asked in step 3.

## Record

| Date | Agent | Reached the PR text | Resume named the next task | Session lines | Transcripts |
| --- | --- | --- | --- | --- | --- |
| 2026-10-13 | Claude Code 2.1.272 | yes: six steps, title `feature(save-items-to-wishlist): Save items to a wishlist`, every section filled, `status: shipped`, 10 claims word for word under `behavior/wishlist/` | yes: "continue" named T1 and said no note or redo was under it, before the first test | one per session, three in all | `transcripts/dogfood-claude-*.jsonl` |
| 2026-10-13 | Codex 0.154.0 | yes: six steps, title `feature(customer-wishlist): Save items to a wishlist`, every section filled, `status: shipped`, 12 claims word for word under `behavior/wishlist/`; the review ran as a separate read-only session after Codex first wrote up its own review as fresh | yes: "T1 is next: add the private store and save operation" before any file changed | one per session, three in all, plus a Rechecked line for the plan correction | `transcripts/dogfood-codex-*.jsonl` |

## Findings

Loopholes the run found, each turned into a rule in the pack the same day.

- Claude Code, step 5, second session: with every task ticked, a bare "continue" went on to ship the spec unasked, by the book but without being asked: tests, a fresh review, `behavior/`, `architecture/`, `status: shipped`, then out of turns in the PR text. Fix: spec-build stops when every task is ticked and names spec-ship as the next step. The unasked ship was reverted and step 6 rerun on the fixed pack. Transcript `dogfood-claude-5b-spec-build.jsonl`.
- Claude Code, step 6: the fresh reviewer counted `AGENTS.md` and `CLAUDE.md` from the docs-init commit as code outside the plan. Fix: the files the flow itself writes, the block and the import included, are never unrelated.
- Claude Code, step 5: the machine's own session-start hook injected a summary of the previous session, a confound for the resume check. The agent still read `tasks.md` first and reported from it; the hook is not part of the pack.
- Codex, step 3: created `tasks.md` at spec-start because the block says every session adds its line, and wrote "awaiting Sanne's answer" under Why before the first round. Fixes: a spec-start red flag, and a conventions rule that an unsettled section keeps its heading alone.
- Codex, step 3: two questions were answerable from the code, stock and persistence, and the sandbox could not create the branch inside a worktree; Codex said so and the branch was created by hand. The grilling ended with the go recorded and 12 claims over three capabilities.
- Codex, step 4: a fifth task "ship with spec-ship" and docs files under Files. Fix: tasks cover the build only and Files lists code and tests; the correction went in through the OK and Codex recorded it as a Rechecked line.
- Codex, step 6: with no sub-agent, Codex reviewed its own diff and wrote "fresh independent review" into the PR. Fix: a same-session review is never written up as fresh; without a sub-agent, spec-ship stops and hands over the review prompt (D61). The review was rerun as a separate read-only session, `dogfood-codex-6b-fresh-review.jsonl`, and the findings pasted back; the corrected PR text is in `dogfood-codex-6c-spec-ship.jsonl`.

## Ship check, 0.5.0

The ship alone, on `add-wishlist` built to the end with one weak test planted, tag `by-hand-mid-build` plus two tick commits. One session per agent, the prompt pre-answering the review question with go on and asking for the text at the end: "Ship it. I am Sanne, the owner; the go is recorded in the spec. For the fresh review use a sub-agent (Codex: a reviewer that did not write the code). If the review finds anything optional, my answer is go on to the pull request. At the end, show me the title and description to paste; do not create the pull request." Passes when the findings appear in the conversation and no file is written outside the repository, a weak test is optional and the ship goes on, the docs land in one commit `docs: ship add-wishlist`, and the pull request text comes only at the end with no Outcome.

| Date | Agent | Findings in chat | Docs commit | Files outside the repo | PR text | Transcript |
| --- | --- | --- | --- | --- | --- | --- |
| 2026-10-22 | Claude Code 2.1.296 | yes: one sub-agent review, the weak `no-duplicates` test named optional with its line, nothing blocking, nothing uncovered, nothing outside the plan; went on as pre-answered | yes: `docs: ship add-wishlist`, four docs files, nothing pushed | none: four writes, all under `docs/` | at the end only: title `feature(add-wishlist): Add wishlist`, the why, three claim lines, the spec path since the repo has no remote, Open findings with the weak test, Unrelated changes None, release impact MINOR, no Outcome | `transcripts/2026-10-22-ship-claude-0-5-0.jsonl` |
| 2026-10-22 | Codex 0.162.1 | yes: a fresh reviewer thread through Codex's collab tool, the weak `no-duplicates` test named optional with its line, no blockers, nothing uncovered, nothing outside the plan; went on as pre-answered. The pack loaded from a temporary `.agents/skills` folder in the repo | yes: `docs: ship add-wishlist`, the same four docs files, nothing pushed | none: four file changes, all under `docs/` | at the end only: the same title, the why, three claim lines, the spec as a relative link, Open findings with the weak test, Unrelated changes None, release impact MINOR, no Outcome; one line the layout does not have, "Validation: bun test passed all 17 tests" | `transcripts/2026-10-22-ship-codex-0-5-0.jsonl` |

Seen on both agents: the review's finding was named in the conversation before the docs changed, and the pull request text appeared only at the end. Codex added a Validation line of its own to the body, which the layout's "nothing else" now forbids; that rule came after this run, so the next by-hand ship is its check.

