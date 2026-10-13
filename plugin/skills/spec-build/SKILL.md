---
name: spec-build
description: Build the active spec one task at a time. Reads tasks.md first and reports the next task, writes a failing test named with the claim before the code when a task changes behavior, ticks a task only when its claims are proven, asks before touching a file the plan doesn't list, and handles a change of course mid-spec by updating the right file and rechecking every task. Use when a user asks to build, implement, continue, resume or pick up work on a spec, runs spec-build, says they are back on it, or asks where the work stands or what is next. Also use when the user changes their mind about a spec that is being built.
---

# spec-build

One task at a time, test first, in scope, and resumable by anyone.

## Process

1. Load docs-conventions. `references/tasks.md`, `references/plan.md` and `references/spec.md` apply.
2. Find the active spec: the folder under the docs path's `specs/` whose slug matches the current branch. With no match, say so and ask which spec to build, or whether to start one.
3. Read `tasks.md` first. If it doesn't exist, the kind skipped planning: create it from the template with one task per claim in the spec; for a fix that restores a claim, one task naming that claim; for a fix with no claim at all, one task with a `check:`. Add this session's line above the tasks: the date, the next unticked task, and the gist of the user's first message, never a verdict. Then report the next unticked task and any note or redo under it, before doing anything else, so nobody has to re-explain.
4. If `spec.md` says `status: draft`, set it to `building`.
5. Work the next unticked task only. When it names claims, write the failing test first, named with the claim reference such as `keeps one entry [wishlist/save-item#no-duplicates]`, run it and see it fail, then write the code and run it again. When it names a `check:`, do the check. Run the project's test command from `architecture/stack.md`.
6. Stay in scope. Touch only files `plan.md` lists under Files, or, with no plan, the files the task names. Before touching any other file, stop and ask: "This file isn't in the plan. Add it?" When the user says yes, add it to `plan.md` with its one-line reason, then continue.
7. Tick the task only when every claim it names has a passing test, or its check holds. Under the task, at most two lines: `- note:` for what blocked, what was tried and dropped, and why; `- redo:` when a task is reopened. Then move to the next task, or stop when the user stops. When every task is ticked, say so, name spec-ship as the next step, and stop: shipping is asked for by name, never inferred from "continue".
8. When the user changes course mid-spec, don't restart. Update the file the change belongs to: `spec.md` for why or what, `plan.md` for how, `reference/` for details. If Why or What changes changed, remove the `approved` line; the owner's new go writes it back. Then recheck every task against the updated files and mark each keep, redo, new or drop with a one-line reason; write one line above the tasks, `Rechecked <date> after: <the change>. T2 redo, T4 new, T5 dropped.`; untick a redo with a `redo:` line; remove a dropped task; add new ones with fresh numbers. Show the list and wait for an OK. Build no affected task before that OK, nor, when `spec.md` changed, before the owner's new go.
9. When a change contradicts Not doing or grows the scope, don't absorb it. Propose a follow-up spec: "That's outside this spec. Start a separate spec for it?"

## Verification

- `tasks.md` has this session's line, and a ticked task has a passing test per claim it names.
- Every test added carries a claim reference in its name.
- `git status` shows no changed file outside `plan.md`'s Files list, other than ones the user added to it.
- After a change of course, `tasks.md` has a Rechecked line and `spec.md` has no `approved` line if Why or What changes changed.

## Rationalizations and red flags

| Excuse | Rule |
| --- | --- |
| "The test would be trivial, I'll write the code first." | The failing test is the proof the task asks for. Write it first, watch it fail. |
| "It's one line in a helper, no need to ask." | A file outside the plan is asked about, every time. |
| "The tests pass locally, mostly. Tick it." | Tick only on a clean run of the project's test command. |
| "The change is small, no need to touch spec.md." | A change to what gets built is a change to the spec, and the owner says go again. |
| "I'll just add the extra feature while I'm here." | Scope growth becomes a follow-up spec. |
| "I remember where we were, no need to read tasks.md." | Read it first. The next session may not be you. |
| "Everything is ticked and they said continue, so they mean ship." | Report that the build is done and that spec-ship is next, then stop. |

## Fallbacks

- No question tool: ask in plain text and wait.
- No shell in this session: say which command to run, ask for the result, and tick only on a reported green run.
- No test runner for the project: the check in the task names the observable result instead of a test, and it is confirmed by hand before the tick.
