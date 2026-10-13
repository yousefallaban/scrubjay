---
spec: "{{spec id}}"
---
<!-- One line per session, above the tasks, newest last. Facts only, never a verdict:
Session {{YYYY-MM-DD}}: resumed at {{Tn}}; first message: "{{gist of the user's first message}}".
After a change mid-way, add one more line:
Rechecked {{YYYY-MM-DD}} after: {{the change}}. {{T2 redo, T4 new, T5 dropped}}. -->

- [ ] T1 {{imperative task}} -> {{claim IDs, or "check: <command or observable result>"}}

<!-- Rules:
- Each task fits in one session. Numbers are never reused.
- A claim is written as capability#id when its bare ID is not unique in the spec.
- Under a task, at most two lines of note or redo, and one handoff line while the task is open:
    - note: blocked, tried, why
    - redo: what changed (the task is unticked again)
    - handoff: done: <what exists>; red: <what fails or is unfinished>; next: <the first step>, written when a session stops before the tick and removed at the tick
- A dropped task is removed and named in the recheck line.
- Anything lasting in a note moves into plan.md or a decision record. -->
