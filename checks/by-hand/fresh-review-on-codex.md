Purpose: the by-hand check of `fresh-review` on Codex 0.162, which has sub-agents, and of what a shipping session can and cannot start from its shell. It replaces the dogfood finding behind D61, where Codex 0.154 reviewed its own diff. Transcripts are under `transcripts/`.

## Setup

`scrubjay-example` at the Codex dogfood's built, unshipped state: branch `customer-wishlist` reset to the commit that ticked the four tasks, `status: building`, Sanne's go recorded, all tests green. The pack's skills copied into the repo's `.agents/skills/` so Codex loads the text under test. Each run is `codex exec --json "ship it" < /dev/null` with full access, so that a nested session, if the skill starts one, is not blocked by the sandbox.

## The check

Passes when the review comes from a context that did not write the code, a spawned agent or a separate session, and its findings reach the pull request text. Fails when the shipping session reviews its own diff and calls it fresh.

## Record

| Date | Agent | How the review ran | Outcome | Transcript |
| --- | --- | --- | --- | --- |
| 2026-10-13 | Codex 0.162.1, multi-agent on, the default | `spawn_agent` with `fork_turns: none` and task `ship_review`, three `wait_agent` calls, one `send_message`; the child thread read the code, tests and spec on its own | findings taken, claims copied, four architecture files updated, `status: shipped`; stopped at the outcome question, as a non-interactive run does | `transcripts/sessions-codex-ship-multiagent-on.jsonl` |
| 2026-10-13 | Codex 0.162.1 with `-c features.multi_agent=false` | the override did not take: `spawn_agent` again, and a probe shows the collaboration tools still listed with `--disable multi_agent` as well | same as above | not kept, a repeat |

## What a shipping session can start

Probed with one Codex session asking its shell to run another: inside the default sandbox, with and without network, both `codex exec --sandbox read-only "<prompt>"` and `codex review "<prompt>"` fail with "failed to initialize in-process app-server client: Operation not permitted"; outside the sandbox the nested read-only session answers. `codex review --base <branch>` takes no custom prompt. So the stated fallback in spec-ship, a separate read-only session started from the shell, needs the one approval the app asks for, and no tested agent reaches it: Claude Code and Codex 0.162 both spawn a fresh reviewer.
