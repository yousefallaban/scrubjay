Purpose: what the pack writes for this spec's cases before and after each change, and what the owner has to read to see the design.

Every case ran by hand on 2026-11-27, first against the skills before its rule and then against the changed ones: the webshop fixture scaffolded in an empty folder, one fresh Sonnet sub-agent per case following the skill on the case's prompt, and the case's file graders applied to the folder afterwards.

| Case | Skills | File graders passing | plan.md | Lines above Scope | Where the signatures were |
| --- | --- | --- | --- | --- | --- |
| shows-the-design | 0.5.0 | 3 of 7 | 23 lines | 10 | in prose under Approach, and as code in `reference/wishlist-shape.md`, 8 lines |
| shows-the-design | changed | 7 of 7 | 37 lines | 30 | as code under Contracts |
| writes-plan-and-tasks | 0.5.0 | 3 of 4 | 17 lines | 10 | in prose under Approach only |
| writes-plan-and-tasks | changed | 4 of 4 | 40 lines | 29 | as code under Contracts; the sketch stayed in `reference/`, 8 lines |

On 0.5.0, shows-the-design failed contracts-as-code, dependencies-as-one-diagram, picks-one-line-each and no-trade-offs-heading. writes-plan-and-tasks failed agreed-design-in-plan. Neither plan held a code block or a diagram. In both 0.5.0 runs, one choice was written as a paragraph under Trade-offs and again as a 20-line decision record, so the owner read 51 and 45 lines across three files, and the function signatures were in a file the plan only linked to.

With the changed skills, both plans held the signatures as a code block, a three-node flowchart, `wishlist --> products` and `index --> wishlist`, and five or six picks of one line each. Neither wrote a decision record, and the second named `contracts.md, from Contracts` as an architecture source. The owner reads more lines in plan.md than before, 30 against 10, and reads one file instead of three: 30 lines against 51 and 45.

The first prompt told the agent that a product has to exist in the catalogue, and the agent added a claim to `spec.md` for it. The prompt now names how the list is read instead, so the case plans without changing the spec.

## A fix that changes the design
plans-a-fix-that-moves-a-contract gives spec-build a refactor filed as a fix, orders reading prices through a new pricing module, and says "Build this fix". Before the rule, 2 of 4 file graders passed: the agent wrote a one-task `tasks.md` and no plan, and named `src/pricing.ts` as the first thing it would create once the tests were reported green. With the rule, 4 of 4: it said the fix adds a contract and changes a dependency, wrote `plan.md` with `unitPriceCents(productId: string): number` under Contracts and a flowchart of `orders`, `pricing` and `products`, 24 lines above Scope, and wrote no code.

## Limits
- The eval runner did not run: the `claude` command line was not logged in on the machine. The `tool_used` graders and the transcript grader are not covered by a by-hand run.
- One run per case, on Sonnet. The release rerun uses the runner's three runs on the default model.
