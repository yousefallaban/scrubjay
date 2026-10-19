---
id: 2026-10-19-plan-keeps-size
kind: feature
status: draft
summary: "A request about finished work reopens its task instead of adding one, and the plan names the folders a change may land in instead of every file, so the plan keeps its planned size through the build"
approved: {by: yousef, via: in session}
request: "Yousef, on 2026-10-19, after the cleanup of his client spec: six planned tasks became 48 because every request to do finished work differently was added as a task, and the plan's file list reached 173 paths that had to be maintained; he agrees with Matt Pocock that path lists go stale"
---
# Keep the plan its planned size

## Why
A real spec planned six tasks and ended with 48: every request to do finished work differently was appended as a new task, so tasks.md became a changelog by another route. Its plan's file list reached 173 paths, kept accurate by hand, where every new file was a question and a recheck round and every rename a maintenance step, while the rule that removes code no claim covers already catches a wrong file. Both are the plan growing with the build instead of describing it.

## What changes

### Add · spec/build
- A request that changes work a ticked task did reopens that task with a `redo:` line instead of adding a task {#reopens-not-appends}
  e.g. "keep the entries in a Set of product ids" after T2 built an array -> T2 is unticked with `redo: Set of product ids`, and the task count is unchanged
- A file added inside a folder the Scope lists is written without a question {#writes-inside-scope}
  e.g. the Scope lists `src/wishlist/` and T2 needs `src/wishlist/keys.ts` -> the file is written, and plan.md is unchanged

### Change · spec/plan
- spec-plan writes `plan.md` with the approach, the Scope as the folders or files the change may land in, each with a one-line reason, and the architecture files spec-ship updates, each with the reference file it comes from {#writes-plan}
  was: spec-plan writes `plan.md` with the approach, the files to touch with a one-line reason each, and the architecture files spec-ship updates, each with the reference file it comes from
  e.g. the wishlist plan -> `src/wishlist/  new: the module and its tests` and `src/index.ts  changed: export the module`, two lines for a module of six files

### Change · spec/build
- spec-build asks before touching a path outside plan.md's Scope {#stays-in-scope}
  was: spec-build asks before touching a file that is not listed in plan.md
  e.g. T3 needs a line in `src/orders.ts`, which no Scope entry covers -> "This is outside the plan's Scope. Add it?"
- A mid-build request that changes no claim and no Scope reopens its task with a `redo:` line, and a size or value it brings goes to `reference/`, never into plan.md's Approach {#polish}
  was: A mid-build request that changes no claim and adds no file to the plan reopens its task with a `redo:` line, and a size or value it brings goes to `reference/`, never into plan.md's Approach
  e.g. "make the icon bigger" after T2 is ticked -> T2 is unticked with `redo: icon size`, the size goes to `reference/layout.md`, and the redo line goes at the tick
- After a change to `spec.md` or to plan.md's Scope, the agent rechecks every task, shows each as keep, redo, new or drop with a one-line reason, and rewrites the task list in place without a recheck line {#rechecks-tasks}
  was: After a change to `spec.md` or to plan.md's Files, the agent rechecks every task, shows each as keep, redo, new or drop with a one-line reason, and rewrites the task list in place without a recheck line
  e.g. a fourth claim is added -> the session shows T1 to T3 as keep and T4 as new, and tasks.md gains T4 and nothing else

### Change · spec/ship
- A fresh reviewer that did not write the code compares the diff with `spec.md` and with plan.md's Scope, and its findings go into the PR description {#fresh-review}
  was: A fresh reviewer that did not write the code compares the diff with `spec.md` and with plan.md's file list, and its findings go into the PR description
  e.g. a file changed outside the Scope -> listed as a finding
- The PR description fills the repo's own pull request template when it has one, and otherwise spec-ship's: Links, the ticket and the spec; Description, the why and the claims added, changed or removed; Unrelated changes, the changes outside plan.md's Scope or `None.`; Release impact, derived from the kind and the claims and confirmed by the user; Review, the fresh reviewer's findings; Outcome {#pr-template}
  was: The PR description fills the repo's own pull request template when it has one, and otherwise spec-ship's: Links, the ticket and the spec; Description, the why and the claims added, changed or removed; Unrelated changes, the files changed outside plan.md or `None.`; Release impact, derived from the kind and the claims and confirmed by the user; Review, the fresh reviewer's findings; Outcome
  e.g. a feature with `issue: HUB-123` -> `- **Jira:** [HUB-123: Add wishlist](https://example.atlassian.net/browse/HUB-123)`, `**Release impact:** MINOR`, and `None.` under Unrelated changes

## Not doing
- Dropping the scope boundary: the plan still says where a change may land, so the owner sees the blast radius before the OK and the review can name a change outside it; the claim-coverage rule stays the boundary for what the code does.
- A cap on the number of tasks: the list is as long as the plan, and the rule above keeps requests from lengthening it.
- A docs-format bump or a rewrite of existing plans: a plan written with a Files heading keeps it, and the skills read a Files section as the Scope of an older plan.
- Line-level entries: a Scope line is a folder or a file with one reason, never an edit.
- A rename inside a listed folder as a claim: the skill says it asks nothing, and no case exercises a rename, so it stays skill text.
