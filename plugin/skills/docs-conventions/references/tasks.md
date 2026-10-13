Purpose: rules for `specs/<id>/tasks.md`. Template: `assets/tasks.md`.

Frontmatter: `spec`, the spec id.

Above the tasks, one line per session, newest last, facts only and never a verdict: `Session YYYY-MM-DD: resumed at Tn; first message: "<gist of the user's first message>".` After a change mid-way, one more line: `Rechecked YYYY-MM-DD after: <the change>. T2 redo, T4 new, T5 dropped.`

Tasks: `- [ ] T<n> <imperative task> -> <claim IDs, or "check: <command or observable result>">`. Each task fits in one session. Tasks cover the build only; shipping is spec-ship's and is never a task. Numbers are never reused. A claim is written as `capability#id` when its bare ID is not unique in the spec. A task is ticked only when the claims it names are proven.

Under a task, at most two lines of `- note: <blocked, tried, why>` or `- redo: <what changed>`, the task unticked again, and one `- handoff: done: <what exists>; red: <what fails or is unfinished>; next: <the first step>` line while the task is open, written when a session stops before the tick and removed at the tick. A dropped task is removed and named in the recheck line. Anything lasting in a note moves to plan.md or a decision record.

Nothing else: no design discussion, no why.
