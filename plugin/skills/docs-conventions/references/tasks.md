Purpose: rules for `specs/<id>/tasks.md`. Template: `assets/tasks.md`.

Frontmatter: `spec`, the spec id. Nothing above the tasks: no session lines, no recheck lines. The file describes the plan as it stands; git holds every earlier state, since each tick and each OK'd recheck is a commit.

Tasks: `- [ ] T<n> <imperative task> -> <claim IDs, or "check: <command or observable result>">`. Each task fits in one session. Tasks cover the build only; shipping is spec-ship's and is never a task. Numbers are never reused. A claim is written as `capability#id` when its bare ID is not unique in the spec. A task is ticked only when the claims it names are proven, and the tick commits the task's files with the task line as the message.

Under an open task, at most two lines of `- note: <blocked, tried, why>` or `- redo: <what changed>`, the task unticked again and a new redo line replacing the old one, and one `- handoff: done: <what exists>; red: <what fails or is unfinished>; next: <the first step>` line, written when a session stops before the tick. Every line under a task goes at the tick; a ticked task carries nothing. Anything lasting in a note moves to plan.md or a decision record before it goes.

A recheck after a change to spec.md or to the plan's Files rewrites the list in place: a redo is unticked with its `redo:` line, a dropped task is removed, a new task gets a fresh number. A polish, a request that changes no claim and adds no file to the plan, unticks its task with a `redo:` line and rechecks nothing.

Nothing else: no design discussion, no why.
