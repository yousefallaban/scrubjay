---
name: spec-plan
description: Decide how a spec gets built and break it into tasks. Refuses to plan a feature without the owner's recorded go, writes plan.md, first the part the owner reads, the approach in plain words, a diagram when a picture helps and the contracts that are new or change shape as code, then the places the change may land and the architecture files to update at ship, writes tasks.md where each task fits one session and names the claims that prove it, puts working material under reference/, and waits for an OK before any code. Use when a user asks to plan a spec, break work into tasks, or runs spec-plan.
---

# spec-plan

How, and in what order, with nothing built until the user has seen it.

## Process

1. Load docs-conventions and grilling. `references/plan.md`, `references/tasks.md`, `references/reference.md` and `references/decision.md` apply.
2. Find the active spec from the branch. Read `spec.md`, the domain's `behavior/` files, and `architecture/`.
3. Gate. For a feature, `spec.md` must carry the `approved` line. Without it, say "The go is missing" and stop; nothing is planned. A fix is planned when it takes several steps, or when its build would add or alter a contract or a dependency between modules, and it needs no go to be planned.
4. Settle the how. Read the code the change touches, to find the contracts it adds or alters across a boundary and the modules that start or stop depending on each other. Where there is a real choice, grill on it in rounds with a recommended answer. What you decide without asking still has to show: a decision that changes what a user sees or can do, crosses a boundary, or removes something is a line in the Approach. A choice that outlives the spec becomes a decision record the moment it settles. Sketches, drafts and research go under `reference/`, each file opening with `Purpose: ...`.
5. Write `plan.md` from the template, in two parts. First what the owner reads to say OK, written by the rule for text the owner reads to decide: Approach, what will be built, as a list with one complete fact per line, holding every decision that changes what a user sees or can do, crosses a boundary or removes something, with the reason in the same line where the route is not the obvious one, and **Not checked:** at the end of a line that rests on something you could not read from the code; How it works, one diagram, only when a picture explains the change faster than text, of the kind that fits the case, with numbered steps where there is an order and a plain label on every arrow; Contracts, only what is new or changes shape and crosses a boundary, between modules, between the product and the outside, or shared and already used, as one small code block per boundary under a plain label, changed members only. No list of choices. Nothing the owner has to agree to stays only in `reference/`. Then what the build works from: Scope as a tree, one path per line with `+`, `~` or `-` and a reason of a few words, a folder covering everything under it, which is where spec-build may write and what the review checks the diff against; Architecture to update at ship, each area file with the plan section or the reference file it comes from; Rollout and Risks only when real. Delete the sections that would be empty.
6. Write `tasks.md` from the template: tasks in dependency order, each small enough for one session, each ending in `-> <claim IDs>` for the claims whose tests prove it, or `-> check: <command or observable result>`. Every claim in the spec is named by at least one task. Numbers are never reused.
7. Show the plan, its owner's part in full, and the tasks, and wait for an OK. Change what the user asks, show again. Write no code and no test.
8. Report the next step: spec-build.

## Verification

- A feature has an `approved` line, or nothing was written.
- `plan.md` has Approach and Scope, and every path the tasks will touch is under it.
- Every contract that is new or changes shape across a boundary is under Contracts, as code under a plain label, and every decision that changes what a user sees or can do, crosses a boundary or removes something is a line in the Approach.
- No line of the owner's part needs a code name to be understood, everything you could not read from the code is marked Not checked, and a diagram, when there is one, has a label on every arrow.
- Every claim ID in `spec.md` appears in at least one task, and every task has a `->`.
- `git status` shows no code or test file changed.
- Every `reference/` file starts with `Purpose:`.

## Rationalizations and red flags

| Excuse | Rule |
| --- | --- |
| "The go will surely come, let me plan ahead." | No `approved` line, no plan. |
| "I'll make one task: build it all." | A task fits one session and names its claims. |
| "I'll start the first task since it's obvious." | The plan is shown, then OK'd, then built. |
| "The data model sketch can live in plan.md." | The sketch goes to `reference/`, with a Purpose line. The types that change go under Contracts, as code. |
| "The types are in the sketch under reference/, the owner can read them there." | What the owner agrees to is in the plan. The OK never depends on a `reference/` file. |
| "The Approach names the functions, that shows the design." | A signature in prose is not a contract. Contracts is code, changed members only. |
| "It's my call, the owner doesn't need to see it." | If it changes what a user sees or can do, crosses a boundary or removes something, it is a line in the Approach. |
| "I'll add a section for the choices I made and the options I dropped." | No list of choices. What matters is a line in the Approach, and a real choice is a question before the plan is written. |
| "The helper only moves to another folder, I'll show its signature." | A move or a removal is one line in the Approach, with no code. |
| "I'll draw which module imports which, that is the architecture." | That picture tells the owner nothing. Draw how the change works, with a label on every arrow, or draw nothing. |
| "Every plan gets a diagram, pictures are clearer." | Only when a picture explains it faster than text. A change inside one module gets none. |
| "\"The catalogue view reuses the list read\" is accurate." | Accurate for someone who knows the code. Say it in product words: the page that lists all products loads the full list. |
| "I could not read the server's fields, I'll write what they probably are." | What you could not read is marked where it appears: **Not checked:** at the end of the Approach line, `// not checked` on the field. |
| "Every component this module exports is a contract, I'll list them all." | Only what crosses a boundary: offered to another module, exchanged with the outside, or shared and already used. |
| "The owner's part is three screens, the change is just big." | Past about two screens, cut what the OK does not need or split the spec. |
| "I'll add a last task for shipping, so nothing is forgotten." | Tasks end with the last claim or check. Shipping is spec-ship's, never a task, and the docs the flow writes are not in the Scope. |

## Fallbacks

- No question tool: grill and show the plan in plain text, and wait for the reply.
