---
name: spec-build
description: Build the active spec one task at a time. Reads tasks.md first and reports the next task, runs the project's tests before touching the task, writes a failing test named with the claim before the code when a task changes behavior, ticks a task only when its claims are proven, writes a handoff line under the task when a session stops before the tick, asks before touching a file the plan doesn't list, handles a change of course mid-spec by updating the right file and rechecking every task, reopens one task with a redo line for a polish, and records a change the user defers in reference/follow-ups.md. Use when a user asks to build, implement, continue, resume or pick up work on a spec, runs spec-build, says they are back on it, says to stop for now mid-build, or asks where the work stands or what is next. Also use when the user changes their mind about a spec that is being built, asks for a small change to work already done, or says a change is for later, after this spec, or must not be lost.
---

# spec-build

One task at a time, test first, in scope, and resumable by anyone.

## Process

1. Load docs-conventions. `references/tasks.md`, `references/plan.md`, `references/spec.md` and `references/reference.md` apply.
2. Find the active spec: the folder under the docs path's `specs/` whose slug matches the current branch. With no match, say so and ask which spec to build, or whether to start one.
3. Read `tasks.md` first. If it doesn't exist, the kind skipped planning: create it from the template with one task per claim in the spec; for a fix that restores a claim, one task naming that claim; for a fix with no claim at all, one task with a `check:`. Add this session's line above the tasks, in this form: `Session <date>: resumed at T<n>; first message: "<gist of the user's first message>".`, never a verdict. Then report where the work stands before doing anything else, so nobody has to re-explain: the next unticked task with any note, redo or handoff under it, and the notes under the ticked tasks, since they hold choices the next task builds on.
4. If `spec.md` says `status: draft`, set it to `building`.
5. Run the project's test command from `architecture/stack.md` before touching the task, so the session knows the state it inherited. Green: start the task. Red: report what fails before any edit; when the failure belongs to the open task, continue the task from there; when it does not, stop and say so.
6. Work the next unticked task only. When it names claims, write the failing test first, named with the claim reference such as `keeps one entry [wishlist/save-item#no-duplicates]`, run it and see it fail, then write the code and run it again. When it names a `check:`, do the check. Run the project's test command from `architecture/stack.md`.
7. Stay in scope. Touch only files `plan.md` lists under Files, or, with no plan, the files the task names. Before touching any other file, stop and ask: "This file isn't in the plan. Add it?" When the user says yes, add it to `plan.md` with its one-line reason. That changes the plan's Files, so recheck the tasks as in step 9, with the yes as the OK.
8. Tick the task only when every claim it names has a passing test, or its check holds. Under the task, at most two lines of `- note:`, for what blocked, what was tried and dropped, and why, or `- redo:`, when a task is reopened, and one `- handoff:` line while the task is open; a new redo line replaces the old one. Then move to the next task, or stop when the user stops. When the session stops before the tick, for any reason, write the handoff line under the task: `- handoff: done: <what exists>; red: <what fails or is unfinished>; next: <the first step>`. The line goes when the task is ticked. When every task is ticked, say so, name spec-ship as the next step, and stop: shipping is asked for by name, never inferred from "continue".
9. When the user changes course mid-spec, don't restart. Update the file the change belongs to: `spec.md` for why or what, `plan.md` for how, `reference/` for details. A claim stays one testable sentence with one example. When the change adds to what a claim says, write a new claim, or replace the claim with one that says the new thing; don't make the claim longer. If Why or What changes changed, remove the `approved` line; the owner's new go writes it back. A change to `spec.md` or to the Files in `plan.md` rechecks every task against the updated files. Say in chat what each task becomes, keep, redo, new or drop, with a one-line reason. Write one line above the tasks that names only the tasks whose status changed: `Rechecked <date> after: <the change>. T2 redo, T4 new, T5 dropped.`, ending `No task changed.` when none did. The kept tasks and the reasons are said, not written. Untick a redo with a `redo:` line; remove a dropped task; add new ones with fresh numbers. Wait for an OK. Build no affected task before that OK, nor, when `spec.md` changed, before the owner's new go.
10. A polish is a request that changes no claim and adds no file to the plan: a size, a label, a renamed function. Don't recheck. Untick the task it belongs to, write `- redo: <what changed>` under it, and build it. A task holds one redo line, so a second polish on the same task replaces it. A size or value the polish brings goes to the `reference/` file that holds that detail, and the redo line names the file: `- redo: footer padding 12px, in reference/layout.md`. With no such file, create one with a `Purpose:` line. plan.md's Approach stays the shape of the solution. The polish adds no line above the tasks.
11. When a change contradicts Not doing or grows the scope, don't absorb it. Propose a follow-up spec: "That's outside this spec. Start a separate spec for it?" Any change the user defers, that one or an in-scope one they want later, goes as one line into `reference/follow-ups.md`: `- <the change>, raised while building T<n>`. When the file is missing, create it with the first line `Purpose: changes deferred while building this spec, one line each, settled at ship.` spec-ship asks about every line there.

## Verification

- `tasks.md` has this session's line, and a ticked task has a passing test per claim it names.
- The test command ran, or its run was asked for, before the task's first edit.
- A session that stopped before the tick left a `- handoff:` line under the open task, and a ticked task has none.
- A claim's test carries the claim reference in its name; a test of an internal detail of code a claim covers is named for what it checks and carries none.
- `git status` shows no changed file outside `plan.md`'s Files list, other than ones the user added to it.
- After a change of course, `tasks.md` has a Rechecked line that names no kept task, and `spec.md` has no `approved` line if Why or What changes changed.
- After a polish, one task is unticked with a `redo:` line, no line was added above the tasks for it, and plan.md's Approach is unchanged.
- A change the user deferred is one line in `reference/follow-ups.md`.

## Rationalizations and red flags

| Excuse | Rule |
| --- | --- |
| "The test would be trivial, I'll write the code first." | The failing test is the proof the task asks for. Write it first, watch it fail. |
| "Every test needs a claim reference, I'll put one on the helper test." | A reference says the test proves that claim. A helper test is named for what it checks and carries none. |
| "It's one line in a helper, no need to ask." | A file outside the plan is asked about, every time. |
| "The tests pass locally, mostly. Tick it." | Tick only on a clean run of the project's test command. |
| "The change is small, no need to touch spec.md." | A change to what gets built is a change to the spec, and the owner says go again. |
| "I'll just add the extra feature while I'm here." | Scope growth becomes a follow-up spec. |
| "I remember where we were, no need to read tasks.md." | Read it first. The next session may not be you. |
| "The last session surely left it green, I'll start." | Run the tests first. The last session may have stopped mid-task. |
| "We're stopping, the diff shows where I was." | The next session reads `tasks.md`, not the diff. Write the handoff line. |
| "Everything is ticked and they said continue, so they mean ship." | Report that the build is done and that spec-ship is next, then stop. |
| "They asked for 12px of padding, that's a change of course, I'll recheck every task." | A request that changes no claim and adds no file is polish: untick its task, write the redo line, build it. The recheck is for changes to the spec or to the plan's Files. |
| "A second tweak to the same task, I'll add another redo line." | A task holds one redo line, the newest. Replace it. |
| "I'll put the new size in Approach so it isn't lost." | Approach is the shape of the solution. The size goes to `reference/`, and the redo line names the file. |
| "The recheck line should say why each task is kept." | The reasons are said in the session. The line names only the tasks that changed. |
| "I'll add the new detail to the existing claim." | A claim is one sentence. Write a new claim or replace the one there; a claim with five subjects is five claims. |
| "I'll append this run's results under the last one." | A reference file is state, not a log. Replace the paragraph it supersedes; git keeps the history. |
| "They said later, so it's out of scope and I move on." | Later means one line in `reference/follow-ups.md`, so spec-ship can ask about it. |

## Fallbacks

- No question tool: ask in plain text and wait.
- No shell in this session: before the task, ask the user to run the test command and report the result, and wait; after a change, say which command to run and ask for the result; tick only on a reported green run.
- No test runner for the project: the check in the task names the observable result instead of a test, and it is confirmed by hand before the tick.
