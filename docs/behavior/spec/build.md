---
capability: spec/build
---
# Build a spec

- spec-build works one task at a time and ticks a task only when the claims it names are proven {#task-by-task}
  e.g. T1's tests pass -> T1 is ticked, and the build moves to T2
- When a task changes behavior, spec-build writes a failing test, named with the claim reference, before the code {#test-first}
  e.g. `keeps one entry [wishlist/save-item#no-duplicates]` fails, then passes
- A test of an internal detail of code a claim covers is named for what it checks and carries no claim reference {#supporting-tests}
  e.g. a test of the `keyFor` helper behind `save` -> named `keyFor prefixes the customer id`, with no claim reference
- spec-build sets the status to building, and creates `tasks.md` first when the kind skipped planning {#sets-building}
  e.g. a one-step fix -> `tasks.md` with one task, and status building
- A new session on the spec's branch reads `tasks.md` first and reports the next task and any notes, without the user re-explaining {#resumes}
  e.g. the next session on `add-wishlist` opens with "continue" -> "T3 is next; under it: handoff: done: export added; red: one test imports the old path; next: fix the import"
- What blocked a task, or what was tried and dropped, is kept as a note of at most two lines under that task while it is open {#notes}
  e.g. a detour through a Set while T2 is open -> one note line under T2, and nothing under the ticked T1
- spec-build asks before touching a path outside plan.md's Scope {#stays-in-scope}
  e.g. T3 needs a line in `src/orders.ts`, which no Scope entry covers -> "This is outside the plan's Scope. Add it?"
- When the user changes course mid-spec, the agent updates the file the change belongs to: `spec.md` for why or what, `plan.md` for how, `reference/` for details {#updates-owner-file}
  e.g. "guests should be able to save too" -> a new claim in `spec.md`
- After a change to `spec.md` or to plan.md's Scope, the agent rechecks every task, shows each as keep, redo, new or drop with a one-line reason, and rewrites the task list in place without a recheck line {#rechecks-tasks}
  e.g. a fourth claim is added -> the session shows T1 to T3 as keep and T4 as new, and tasks.md gains T4 and nothing else
- No affected task is built until the user OKs the recheck {#waits-for-recheck-ok}
  e.g. the user drops T4 -> the list is updated, then the build continues
- When Why or What changes changes, the agent removes the `approved` line, and affected tasks wait until the owner's new go writes it back {#renews-go}
  e.g. the guest claim added -> `approved` is removed; Sanne's new go restores it, and the build continues
- When a change contradicts Not doing or grows the scope, the agent proposes a follow-up spec instead, and a change the user defers becomes one line in `reference/follow-ups.md` {#follow-up-spec}
  e.g. "also share wishlists" while sharing is under Not doing -> "Start a separate spec for sharing?"; "later" -> `- Share a wishlist by link, raised while building T2`
- spec-build runs the project's test command before it touches the next task, and a red start is reported before any file the task touches changes {#starts-with-a-test-run}
  e.g. a session that cannot run commands says "continue" -> "Run `bun test` and tell me the result" comes before any edit to `src/` or `test/`
- When a session stops before its task is ticked, spec-build writes one handoff line under the task: what exists, what is red or unfinished, and the next step; the line goes when the task is ticked {#handoff}
  e.g. `- handoff: done: failing test for no-duplicates; red: save not written; next: write save in src/wishlist.ts`
- A mid-build request that changes no claim and no Scope reopens its task with a `redo:` line, and a size or value it brings goes to `reference/`, never into plan.md's Approach {#polish}
  e.g. "make the icon bigger" after T2 is ticked -> T2 is unticked with `redo: icon size`, the size goes to `reference/layout.md`, and the redo line goes at the tick
- A change of course that adds to what a claim says writes a new claim or replaces the claim, so each claim stays one testable sentence with one example {#one-sentence-claims}
  e.g. "also show how many items are saved" arrives while `lists-saved` exists -> a new claim with its own ID, not a longer `lists-saved`
- Every line under a task goes at the tick, so a ticked task carries nothing {#cleared-at-tick}
  e.g. T2 ticked after a detour through a Set -> the note and the handoff line are gone, and the choice, if lasting, is in `reference/decisions.md`
- spec-build commits the files a task touched when it ticks the task, with the task line as the message {#commits-at-tick}
  e.g. T2 ticked -> `feat: T2 save and list, with duplicates kept to one entry [saves-item, no-duplicates, lists-saved]` on the branch, holding the task's files and nothing else
- A request that changes work a ticked task did reopens that task with a `redo:` line instead of adding a task {#reopens-not-appends}
  e.g. "keep the entries in a Set of product ids" after T2 built an array -> T2 is unticked with `redo: Set of product ids`, and the task count is unchanged
- A file added inside a folder the Scope lists is written without a question {#writes-inside-scope}
  e.g. the Scope lists `src/wishlist/` and T2 needs `src/wishlist/keys.ts` -> the file is written, and plan.md is unchanged
