---
name: spec-build
description: Build the active spec one task at a time, test first and in scope. Reads tasks.md first and reports the next task, writes a failing test before the code when a task changes behavior, ticks a task only when its claims are proven and commits at every tick, writes a handoff line when a session stops early, and rechecks the tasks when the spec or the plan changes mid-way. Use when a user asks to build, implement, continue, resume or pick up work on a spec, runs spec-build, says they are back on it or stopping for now, asks where the work stands or what is next, changes their mind about a spec being built, asks for a small change to work already done, or says a change is for later or must not be lost.
---

# spec-build

One task at a time, test first, in scope, and resumable by anyone.

## Process

1. Load docs-conventions. `references/tasks.md`, `references/plan.md`, `references/spec.md` and `references/reference.md` apply.
2. Find the active spec: the folder under the docs path's `specs/` whose slug matches the current branch. With no match, say so and ask which spec to build, or whether to start one.
3. Read `tasks.md` first. If it doesn't exist, the kind skipped planning: create it from the template with one task per claim in the spec; for a fix that restores a claim, one task naming that claim; for a fix with no claim at all, one task with a `check:`. Before any other step, say in one line which task is next and what is under it, note, redo or handoff, so nobody has to re-explain.
4. If `spec.md` says `status: draft`, set it to `building`.
5. Run the project's test command from `architecture/stack.md` before touching the task, so the session knows the state it inherited. Green: start the task. Red: report what fails before any edit; when the failure belongs to the open task, continue the task from there; when it does not, stop and say so.
6. Work the next unticked task only. When it names claims, write the failing test first, named with the claim reference such as `keeps one entry [wishlist/save-item#no-duplicates]`, run it and see it fail, then write the code and run it again. When it names a `check:`, do the check. Run the project's test command from `architecture/stack.md`.
7. Stay in scope. Touch only paths under the Scope in `plan.md`, a Files section read the same way, or, with no plan, the files the task names. A folder in the Scope covers everything under it, so a file added or renamed inside one asks nothing. Before touching a path outside, stop and ask: "This is outside the plan's Scope. Add it?" When the user says yes, add it to `plan.md` with its one-line reason. That changes the Scope, so recheck the tasks as in step 9, with the yes as the OK.
8. Tick the task only when every claim it names has a passing test, or its check holds. At the tick, remove every line under the task: a ticked task carries nothing, and a choice worth keeping is an entry in `reference/decisions.md`. Then commit the files the task touched, the ones under plan.md's Scope and the spec folder's files, with the task line as the message, `<type>: T<n> <the task> [<claim IDs>]`, `feat` for a feature and `fix` for a fix. Leave every other changed file out of the commit, and never push. Then move to the next task, or stop when the user stops. While a task is open it holds at most two lines of `- note:`, for what blocked, what was tried and dropped, and why, or `- redo:`, when it was reopened, and one `- handoff:` line; a new redo line replaces the old one. When the session stops before the tick, write the handoff line under the task: `- handoff: done: <what exists>; red: <what fails or is unfinished>; next: <the first step>`. When every task is ticked, say so, name spec-ship as the next step, and stop: shipping is asked for by name, never inferred from "continue".
9. When the user changes course mid-spec, don't restart. Update the file the change belongs to: `spec.md` for why or what, `plan.md` for how, `reference/` for details. A claim stays one testable sentence with one example. When the change adds to what a claim says, write a new claim, or replace the claim with one that says the new thing; don't make the claim longer. If Why or What changes changed, remove the `approved` line; the owner's new go writes it back. A change to `spec.md` or to the Scope in `plan.md` rechecks every task against the updated files. Say in chat what each task becomes, keep, redo, new or drop, with a one-line reason; a task whose finished work the change alters is a redo, never a new task, and a new task comes only from a new claim or a check the plan lacks. Rewrite the task list in place: untick a redo with a `redo:` line, remove a dropped task, add new ones with fresh numbers, and write nothing above the tasks. Then wait for an OK; on the OK, commit the recheck with the changed files as one commit, `chore: recheck after <the change>`. Build no affected task before that OK, nor, when `spec.md` changed, before the owner's new go.
10. A polish is a request that changes work a ticked task did without changing a claim or the plan's Scope: a size, a label, a renamed function, the same behavior built another way. Don't recheck and don't add a task. Untick the task it belongs to, write `- redo: <what changed>` under it, and build it. A task holds one redo line, so a second polish on the same task replaces it, and the line goes at the tick. A size or value the polish brings goes to the `reference/` file that holds that detail, and the redo line names the file: `- redo: footer padding 12px, in reference/layout.md`. With no such file, create one with a `Purpose:` line. plan.md's Approach stays the shape of the solution. A finding spec-ship hands over with fix is handled the same way: untick the task that built the code with a `redo:` line naming the finding, build it, tick it, and spec-ship runs again.
11. When a change contradicts Not doing or grows what the spec covers, don't absorb it. Propose a follow-up spec: "That's outside this spec. Start a separate spec for it?" Any change the user defers, that one or an in-scope one they want later, goes as one line into `reference/follow-ups.md`: `- <the change>, raised while building T<n>`. When the file is missing, create it with the first line `Purpose: changes deferred while building this spec, one line each, kept for later specs.` The lines stay there as deferred work for later specs.

## Verification

- A ticked task has a passing test per claim it names, nothing under it, and a commit whose message is its task line.
- The test command ran, or its run was asked for, before the task's first edit.
- A session that stopped before the tick left a `- handoff:` line under the open task.
- A claim's test carries the claim reference in its name; a test of an internal detail of code a claim covers is named for what it checks and carries none.
- `git status` shows no changed file outside `plan.md`'s Scope, other than paths the user added to it, and none of the task's files once it is ticked.
- After a change of course, `tasks.md` holds the task list as the plan stands, with nothing above it, and `spec.md` has no `approved` line if Why or What changes changed.
- After a polish, one task is unticked with a `redo:` line, no task was added, and plan.md's Approach is unchanged.
- A change the user deferred is one line in `reference/follow-ups.md`.

## Rationalizations and red flags

| Excuse | Rule |
| --- | --- |
| "The test would be trivial, I'll write the code first." | The failing test is the proof the task asks for. Write it first, watch it fail. |
| "Every test needs a claim reference, I'll put one on the helper test." | A reference says the test proves that claim. A helper test is named for what it checks and carries none. |
| "It's one line in a helper, no need to ask." | A path outside the plan's Scope is asked about, every time. |
| "The tests pass locally, mostly. Tick it." | Tick only on a clean run of the project's test command. |
| "I'll commit at the end of the session, when it all works." | A tick is a commit, with the task line as the message. Git is the history the files no longer carry. |
| "The note explains the task, I'll leave it after the tick." | A ticked task carries nothing. A choice worth keeping is a decision; the rest is in git. |
| "I'll put the user's other edits in the commit too." | Commit the task's files only. A change outside the plan is asked about, not swept in. |
| "The change is small, no need to touch spec.md." | A change to what gets built is a change to the spec, and the owner says go again. |
| "I'll just add the extra feature while I'm here." | Growth beyond the spec becomes a follow-up spec. |
| "I remember where we were, no need to read tasks.md." | Read it first. The next session may not be you. |
| "The last session surely left it green, I'll start." | Run the tests first. The last session may have stopped mid-task. |
| "We're stopping, the diff shows where I was." | The next session reads `tasks.md`, not the diff. Write the handoff line. |
| "Everything is ticked and they said continue, so they mean ship." | Report that the build is done and that spec-ship is next, then stop. |
| "They want it done differently, so that's a new task." | A request about work a task already did reopens that task with a redo line. New tasks come only from new claims or checks. |
| "They asked for 12px of padding, that's a change of course, I'll recheck every task." | A request that changes no claim and no Scope is polish: untick its task, write the redo line, build it. The recheck is for changes to the spec or to the plan's Scope. |
| "A second tweak to the same task, I'll add another redo line." | A task holds one redo line, the newest. Replace it. |
| "I'll put the new size in Approach so it isn't lost." | Approach is the shape of the solution. The size goes to `reference/`, and the redo line names the file. |
| "I'll add the new detail to the existing claim." | A claim is one sentence. Write a new claim or replace the one there; a claim with five subjects is five claims. |
| "I'll append this run's results under the last one." | A reference file is state, not a log. Replace the paragraph it supersedes; git keeps the history. |
| "They said later, so it's out of scope and I move on." | Later means one line in `reference/follow-ups.md`, where it waits for its own spec. |

## Fallbacks

- No question tool: ask in plain text and wait.
- No shell in this session: before the task, ask the user to run the test command and report the result, and wait; after a change, say which command to run and ask for the result; tick only on a reported green run, and say what the commit would hold and its message.
- No git in the project: the tick stands without a commit, and say so once.
- No test runner for the project: the check in the task names the observable result instead of a test, and it is confirmed by hand before the tick.
