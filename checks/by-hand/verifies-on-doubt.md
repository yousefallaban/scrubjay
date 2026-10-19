Purpose: the by-hand check for two claims the AGENTS.md block drives, verifies-on-doubt and names-the-mismatch, which the eval runner can't grade because its runs load no project instructions. Run on both agents before a release; keep each transcript under `transcripts/`.

## Setup, on scrubjay-example

1. `git checkout by-hand-block`: the fixture from answers-from-docs, with its block, `docs/index.md`, `docs/architecture/stack.md` and `docs/behavior/returns/submit-return.md` in place. There `{#partial-refund}` states half-up rounding while `src/returns.ts` rounds a floating-point product. A trail map at 8.50 on an order with 33% off gives 569 cents, one short of the 570 the claim promises.
2. The block carries the current text of `assets/agents-block.md`, refreshed by hand when the template changed. The parent folder of the example holds a `CLAUDE.md`, which is the case the import exists for.

## The checks

Start a fresh non-interactive session in the repo for each question. Codex reads stdin when it is not a terminal, so a scripted run passes `< /dev/null`.

**Doubt**, for verifies-on-doubt. The question states a doubt and asks for nothing else: "The docs say a partial refund is rounded half up to the cent. I'm not sure that is what the code does." Claude Code: `claude -p "<the question>" --max-turns 8 --output-format stream-json --verbose`. Codex: `codex exec --json --sandbox read-only "<the question>" < /dev/null`. Passes when the transcript shows a read of `src/returns.ts` or its test, and the answer cites or quotes `returns/submit-return#partial-refund` beside what the code does. Fails when the answer comes from the behavior file alone.

**Mismatch**, for names-the-mismatch. The question: "A customer with 33% off returned a trail map priced 8.50 and was refunded 5.69, not 5.70. What does the product do here?" Passes when the answer states the claim as the documented requirement, states what the code does instead, and names a fix spec or offers to start one. Fails when it answers 5.70 from the docs alone, or treats the code as right without naming the claim.

**Control**, for answers-from-docs under the same block: the question from `answers-from-docs.md`, "How is the refund for a partial return calculated?", still passes there, with no source file read. Its rows live in that file's record.

## Record

| Date | Agent | Check | Block | Read the code | Cited the claim | Named the mismatch and a fix | Transcript |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-10-19 | Claude Code 2.1.296 | mismatch | before | no: "the project memory rules say to answer from the behavior docs" | yes: quoted `partial-refund` | no: said the live product does not follow the claim, named no fix | `transcripts/2026-10-19-claude-mismatch-before.jsonl` |
| 2026-10-19 | Codex 0.162.1 | mismatch | before | no: read the behavior file only | yes | no: "refunding 5.69 contradicts the documented rule", nothing more | `transcripts/2026-10-19-codex-mismatch-before.jsonl` |
| 2026-10-19 | Claude Code 2.1.296 | doubt | before | yes: `src/returns.ts`, its test, a sweep | yes: `submit-return.md:10` | n/a | `transcripts/2026-10-19-claude-doubt-before.jsonl` |
| 2026-10-19 | Codex 0.162.1 | doubt | before | yes: `src/returns.ts:24`, `orders.ts`, reproduced 5.69 | yes: `submit-return.md:10` | n/a | `transcripts/2026-10-19-codex-doubt-before.jsonl` |
| 2026-10-19 | Claude Code 2.1.296 | doubt | after | yes: `src/returns.ts:24`, its test, ran the example | yes: quoted the claim and its example | n/a | `transcripts/2026-10-19-claude-doubt-after.jsonl` |
| 2026-10-19 | Codex 0.162.1 | doubt | after | yes: `src/returns.ts:24`, reproduced 5.69 | yes: `submit-return.md:10` | n/a; offered a spec unprompted | `transcripts/2026-10-19-codex-doubt-after.jsonl` |
| 2026-10-19 | Claude Code 2.1.296 | mismatch | after | yes: `src/returns.ts:24`, its test | yes: quoted the claim and its example | yes: "the docs and the code disagree, and the customer got the code's answer", "No spec covers this yet. I can start a fix spec on its own branch" | `transcripts/2026-10-19-claude-mismatch-after.jsonl` |
| 2026-10-19 | Codex 0.162.1 | mismatch | after | yes: `src/returns.ts:24`, reproduced 569 cents | yes: `submit-return.md:10` with its example | yes: "under-refunds the customer by 0.01. No fix spec exists yet; I can start one." | `transcripts/2026-10-19-codex-mismatch-after.jsonl` |

The "after" rows ran against the block text as shipped, with a report that differs from the docs as the third trigger (D6 in the claim-evidence spec). An earlier wording without that trigger made Codex answer the mismatch report from the docs alone. The doubt check passed before the change on both agents: a plain doubt already made them read the code, whatever the block said. The block change is proven by the mismatch rows, where both agents answered from the docs alone before and read the code after, and by the control rows in `answers-from-docs.md`, where the default still holds.
