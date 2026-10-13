---
capability: spec/build
---
# Build a spec

- spec-build works one task at a time and ticks a task only when the claims it names are proven {#task-by-task}
  e.g. T1's tests pass -> T1 is ticked, and the build moves to T2
- When a task changes behavior, spec-build writes a failing test, named with the claim reference, before the code {#test-first}
  e.g. `keeps one entry [wishlist/save-item#no-duplicates]` fails, then passes
- spec-build sets the status to building, and creates `tasks.md` first when the kind skipped planning {#sets-building}
  e.g. a one-step fix -> `tasks.md` with one task, and status building
- A new session on the spec's branch reads `tasks.md` first and reports the next task and any notes, without the user re-explaining {#resumes}
  e.g. a colleague checks out `add-wishlist` -> "T3 is next; T2 deviated because guests now save in the browser"
- Every session writes one line above the tasks in `tasks.md` with the date, where it resumed, and the gist of the user's first message, never a verdict {#session-line}
  e.g. `Session 2026-10-14: resumed at T3; first message: "continue".`
- What blocked a task, or what was tried and dropped, is kept as a note of at most two lines under that task {#notes}
  e.g. `- note: tried a client-side cache first; dropped, it went stale across devices`
- spec-build asks before touching a file that is not listed in plan.md {#stays-in-scope}
  e.g. a fix needs a shared helper changed -> "This file isn't in the plan. Add it?"
- When the user changes course mid-spec, the agent updates the file the change belongs to: `spec.md` for why or what, `plan.md` for how, `reference/` for details {#updates-owner-file}
  e.g. "guests should be able to save too" -> a new claim in `spec.md`
- The agent rechecks every task, marks each keep, redo, new or drop with a one-line reason, and records one recheck line in `tasks.md` {#rechecks-tasks}
  e.g. `Rechecked 2026-10-14 after: guests can save. T2 redo, T4 new.`
- No affected task is built until the user OKs the recheck {#waits-for-recheck-ok}
  e.g. the user drops T4 -> the list is updated, then the build continues
- When Why or What changes changes, the agent removes the `approved` line, and affected tasks wait until the owner's new go writes it back {#renews-go}
  e.g. the guest claim added -> `approved` is removed; Sanne's new go restores it, and the build continues
- When a change contradicts Not doing or grows the scope, the agent proposes a follow-up spec instead {#follow-up-spec}
  e.g. "also share wishlists" while sharing is under Not doing -> "Start a separate spec for sharing?"
