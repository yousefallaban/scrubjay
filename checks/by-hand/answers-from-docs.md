Purpose: the by-hand check for the claims the AGENTS.md block drives, answers-from-docs and links-claude-md, which the eval runner can't grade because its runs load no project instructions. Run on both agents before a release; keep each transcript under `transcripts/`.

## Setup, on scrubjay-example

1. `git checkout -b by-hand-block baseline`.
2. Write by hand, from the pack's templates with every comment removed: `AGENTS.md` with the block (docs path `docs`), `CLAUDE.md` holding `@AGENTS.md`, `docs/index.md` with the returns domain owned by Sanne, `docs/architecture/stack.md` with the test command, and `docs/behavior/returns/submit-return.md` with four claims, one of them `{#partial-refund}` stating the refund rule with half-up rounding.
3. Commit. The parent folder of the example holds a `CLAUDE.md`, which is the case the import exists for.

## The check

Start a fresh non-interactive session in the repo and ask one question that the behavior file answers and the code answers differently:

- Claude Code: `claude -p "How is the refund for a partial return calculated?" --max-turns 8 --output-format stream-json --verbose`
- Codex: `codex exec --json --sandbox read-only "How is the refund for a partial return calculated?" < /dev/null`, since Codex reads stdin when it is not a terminal

Passes when the answer cites `returns/submit-return#partial-refund` or quotes the claim, and the transcript shows no read of `src/returns.ts`. Fails when the agent reads the code first, or answers from the code, which says one thing the claim does not: the code rounds with floating point and is one cent short on some inputs.

## Record

| Date | Agent | Cited the claim | Read the code | Transcript |
| --- | --- | --- | --- | --- |
| 2026-10-12 | Codex 0.154.0 | no; answered from `src/returns.ts` and never opened the behavior file | yes | `transcripts/2026-10-12-codex-answers-from-docs.jsonl`; cause: index.md pointed at nothing under behavior/, fixed by D55 |
| 2026-10-12 | Codex 0.154.0, after D55 | yes; cited `docs/behavior/returns/submit-return.md:10` and quoted the half-up rule | no; listed `docs/behavior` and read the behavior file and `stack.md` only | `transcripts/2026-10-12-codex-answers-from-docs-2.jsonl` |
| 2026-10-12 | Claude Code 2.1.272, after D55 | yes; quoted `{#partial-refund}` with its line | yes, after the docs: read `src/returns.ts`, `src/orders.ts` and the tests to compare | `transcripts/2026-10-12-claude-code-answers-from-docs-2.jsonl` |
| 2026-10-12 | Claude Code 2.1.272, after D56 | yes; quoted `{#partial-refund}` with its line and said no code was read | no; read `docs/index.md`, listed `docs/`, read the behavior file | `transcripts/2026-10-12-claude-code-answers-from-docs-3.jsonl` |
| 2026-10-19 | Claude Code 2.1.296, block as shipped at 0.2.0 | yes; cited `#partial-refund` at `submit-return.md:10` and said the docs answer it directly | no; read `docs/index.md`, the behavior file and nothing else | `transcripts/2026-10-19-claude-answers-from-docs.jsonl`; control run for verifies-on-doubt |
| 2026-10-19 | Codex 0.162.1, block as shipped at 0.2.0 | yes; cited `submit-return.md:10` and gave the worked example | no; read `docs/index.md` and the behavior file | `transcripts/2026-10-19-codex-answers-from-docs.jsonl`; control run for verifies-on-doubt |
| 2026-10-19 | Claude Code 2.1.296, block at 0.3.0 | yes; cited `#partial-refund` at `submit-return.md:10` and said "The behavior docs answer this directly, so I did not open the code" | no; read `docs/index.md` and the behavior file | `transcripts/2026-10-19-claude-answers-from-docs-0-3-0.jsonl`; control run for the docs-hold-state block |
| 2026-10-19 | Codex 0.162.1, block at 0.3.0 | yes; cited `submit-return.md:11` and gave the worked example | no; read `docs/index.md` and the behavior file | `transcripts/2026-10-19-codex-answers-from-docs-0-3-0.jsonl`; control run for the docs-hold-state block |
