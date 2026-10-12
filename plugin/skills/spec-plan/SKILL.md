---
name: spec-plan
description: Decide how a spec gets built and break it into tasks. Refuses to plan a feature without the owner's recorded go, writes plan.md with the approach, the files to touch and the architecture files to update at ship, writes tasks.md where each task fits one session and names the claims that prove it, puts working material under reference/, and waits for an OK before any code. Use when a user asks to plan a spec, break work into tasks, or runs spec-plan.
---

# spec-plan

How, and in what order, with nothing built until the user has seen it.

## Process

1. Load docs-conventions and grilling. `references/plan.md`, `references/tasks.md`, `references/reference.md` and `references/decision.md` apply.
2. Find the active spec from the branch. Read `spec.md`, the domain's `behavior/` files, and `architecture/`.
3. Gate. For a feature, `spec.md` must carry the `approved` line. Without it, say "The go is missing" and stop; nothing is planned. A fix is planned only when it takes several steps, and needs no go to be planned.
4. Settle the how. Where there is a real choice, grill on it in rounds with a recommended answer. A choice that outlives the spec becomes a decision record the moment it settles. Sketches, drafts and research go under `reference/`, each file opening with `Purpose: ...`.
5. Write `plan.md` from the template: Approach in 3 to 8 lines; Trade-offs when there was a real choice; Files as an annotated tree, path, new or changed or deleted, one-line reason, which is the scope spec-build stays inside and the review checks; Architecture to update at ship, each area file with the reference file it comes from; Rollout and Risks only when real. Delete the sections that would be empty.
6. Write `tasks.md` from the template: tasks in dependency order, each small enough for one session, each ending in `-> <claim IDs>` for the claims whose tests prove it, or `-> check: <command or observable result>`. Every claim in the spec is named by at least one task. Numbers are never reused.
7. Show the plan and the tasks and wait for an OK. Change what the user asks, show again. Write no code and no test.
8. Report the next step: spec-build.

## Verification

- A feature has an `approved` line, or nothing was written.
- `plan.md` has Approach and Files, and every file the tasks will touch is in Files.
- Every claim ID in `spec.md` appears in at least one task, and every task has a `->`.
- `git status` shows no code or test file changed.
- Every `reference/` file starts with `Purpose:`.

## Rationalizations and red flags

| Excuse | Rule |
| --- | --- |
| "The go will surely come, let me plan ahead." | No `approved` line, no plan. |
| "I'll make one task: build it all." | A task fits one session and names its claims. |
| "I'll start the first task since it's obvious." | The plan is shown, then OK'd, then built. |
| "The data model sketch can live in plan.md." | Detail goes to `reference/`, with a Purpose line. |

## Fallbacks

- No question tool: grill and show the plan in plain text, and wait for the reply.
