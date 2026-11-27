Purpose: what the pack writes for this spec's cases before and after each change, and what the owner has to read to see the design.

Every case ran by hand on 2026-11-27: the case's fixture scaffolded in an empty folder, one fresh Sonnet sub-agent following the skill on the case's prompt, and the case's file graders applied to the folder afterwards. "0.5.0" is the pack as released before this spec.

| Case | Skills | File graders passing | Lines above Scope | What the plan held |
| --- | --- | --- | --- | --- |
| shows-the-design | 0.5.0 | 6 of 11 | 11 | the function names in prose under Approach, flat Scope lines, the unread sign-in package under Risks |
| shows-the-design | changed, two runs | 11 of 11, 11 of 11 | 41 and 36 | eight or nine Approach lines, a numbered sequence of the wishlist, the sign-in service and the catalogue, two signatures under one label, a Scope tree |
| draws-no-diagram-inside-one-module | 0.5.0 | 5 of 7 | 8 | three Approach lines that open with a code name, flat Scope lines |
| draws-no-diagram-inside-one-module | changed | 7 of 7 | 9 | four Approach lines, no diagram, no Contracts |
| writes-plan-and-tasks | 0.5.0 | 2 of 4 | 10 | signatures in prose only; the run of the first build, graded again with today's graders |
| writes-plan-and-tasks | changed, two runs | 3 of 4, then 4 of 4 | 21 and 20 | signatures under Contracts; the first run put the Scope mark before the path, which led to D22 |
| plans-a-fix-that-moves-a-contract | changed | 4 of 4 | 29 | the planned fix, with the dependency as an Approach line and a four-step sequence |
| updates-architecture-from-a-plan-section | 0.5.0 | 5 of 5 | | `architecture/contracts.md` with a row for `save` and one for `list`, plan.md unchanged |
| updates-architecture-from-a-plan-section | changed | 5 of 5 | | the same |

On 0.5.0, shows-the-design failed approach-is-a-list, contracts-under-a-label, draws-how-it-works, marks-what-it-could-not-read and scope-is-a-tree. The plan was 18 lines and read quickly, and the owner could not see from it what the wishlist offers to other code. It did name the unread package, under Risks and without the words Not checked.

With the changed skills, both runs wrote "**Not checked:** what the sign-in service returns when nobody is signed in" at the end of the Approach line that rests on it, drew the three parts as one numbered sequence with a label on every arrow, and showed `saveToWishlist(productId)` and `listWishlist()` under one line of plain words. Neither showed the catalogue's unchanged `Product` type or the in-memory store. The owner reads 36 to 41 lines against 11.

Both runs also planned something the spec has no claim for: refusing a save when nobody is signed in. Each said so in its Approach line, "the spec has no claim for this, so it is your call", and one asked it again as a question after the plan. Whether that becomes a claim before the plan is written is the subject of `2026-11-27-ask-before-assuming`.

draws-no-diagram-inside-one-module changes one value inside the returns module. The changed skills wrote an Approach of four lines and nothing else above the Scope. On 0.5.0 the case fails only on the shape of the Approach and the Scope: 0.5.0 never drew a diagram, so the two graders that forbid one pass there too. They guard the new rule against drawing too much.

updates-architecture-from-a-plan-section passes on both. With `contracts.md, from Contracts` in the plan, the 0.5.0 skill already wrote the file from the plan section. The step's wording changed and the case is a guard (D23). Both runs had no sub-agent, so the review findings were given to them as the owner's second message.

## A fix that changes the design
plans-a-fix-that-moves-a-contract gives spec-build a refactor filed as a fix, orders reading prices through a new pricing module, and says "Build this fix". Before the rule, 2 of 4 file graders passed: the agent wrote a one-task `tasks.md` and no plan, and named `src/pricing.ts` as the first thing it would create once the tests were reported green. With the rule it said the fix adds a contract and changes a dependency, wrote `plan.md` with the new function under Contracts, and wrote no code. The run in the table above is the same case under the final plan shape.

## A trial on a real project
On 2026-11-27 three shipped specs of a real frontend project built with the pack were planned again, each from the commit before its code existed and with its old plan removed. One fresh Sonnet sub-agent per run, told to take its recommended option where it would have asked. The project's code and names stay out of this repository.

| Spec | Old plan | New plan, lines above Scope | Contracts shown | Exports left out as internal |
| --- | --- | --- | --- | --- |
| a feature of about 30 files, wording before D10 | 50 lines, no code, no diagram | 44 | 5 | about 8 |
| the same feature, wording of D10 | the same | 50 | 6 | about 12 |
| a page redesign | 62 lines, and a 13-line design file under `reference/` | 47 | 3 | 7 |
| a refactor filed as a fix | 48 lines, and a 68-line design file under `reference/` | 51 | 2 | 4 |

The plans named the main design choice the real build made, the public components and the data shapes that were built, and missed two components that later became public. Each listed five to seven choices. The owner reads about as many lines as before; what the lines hold changed. What the trial led to: the diagram of module arrows told the owner nothing (D12), the Scope lines were unreadable (D13), every agent asked whether blank lines count toward the limit (D11), and one agent wrote server field names it could not read as if they were facts, which is why a guess is now listed as one.

## The second trial
The same three specs were planned again under D11 to D13, and one intent was written from a one-sentence request. Every diagram rendered. Each agent chose its kind by the case: grouped boxes where three parts own one page, a numbered sequence where the order of steps was the point, each with a label on every arrow. The wording moved to product words, the Scope was a tree, and guesses were marked. The plans grew to 148, 99 and 68 lines above the Scope, because every contract field took a line and every plan listed seven to nine choices in three lines each. That led to D17 and D18. The intent read in product words and listed six questions the agent would have asked.

## The third trial
The same three specs were planned a third time under D17 to D19. The plans were 86, 63 and 62 lines above the Scope. No plan listed choices. The decisions that matter were lines in the Approach, 13, 10 and 6 of them, often two to four sentences long. Each plan had at most three contract blocks; the helper that only moved was one Approach line and the cache keys were gone. Every diagram rendered: two numbered sequences and one set of grouped boxes. The largest plan carried 14 Not checked marks, most of them because the trial's copy held the frontend only and the agent could not read the server. Each agent reported three to five questions it would have asked. Yousef read the middle plan and gave the go (D20).

## In the runner
The eval runner worked again later on 2026-11-27, and every spec-plan case ran three times on the default model, each with a run without the pack beside it.

| Run | Cases passing all three runs | What failed |
| --- | --- | --- |
| first | 6 of 7 | shows-the-design: no diagram in two runs of three, and one Approach without bold topics |
| second, after D24 | 6 of 7 | draws-no-diagram-inside-one-module: the grader looked for the claim on task T1 only, and two valid task lists named it on T2 |
| third, with that grader reading any task | 7 of 7 | nothing |
| shows-the-design alone, after D25 | all three runs | one run numbered its steps in the labels and not with `autonumber`, which the grader did not accept; with the grader reading both, all three plans pass |

Without the pack, shows-the-design scores 0.09, draws-no-diagram-inside-one-module 0.14 and writes-plan-and-tasks 0.33. After D25 the diagrams kept their labels to a few words, and one drew the signed-out case as an `alt` block. Between the first and second run, shows-the-design ran eight more times on its own: four on the rule as first written, with no diagram in any, and four on the rule of D24, with a numbered sequence in each.

## Limits
- One or two runs per case, on Sonnet, by hand. The `tool_used` graders and the transcript graders are not covered by a by-hand run. The runner's results are in the section above.
- Three of the by-hand agents reported that a Skill tool in their session loaded an older installed copy of docs-conventions before they read the files under test. They said they followed the files under test. Later runs were told not to use a Skill tool.
- The trials covered a frontend only, and their agents could not ask the owner anything.
- No grader checks that a diagram renders or that a line reads well. Both were checked by eye.
