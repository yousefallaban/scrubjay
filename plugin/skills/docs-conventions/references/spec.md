Purpose: section rules for `specs/<id>/spec.md`. Template: `assets/spec.md`.

Frontmatter: `id` as YYYY-MM-DD-slug; `kind`, feature or fix; `status`, draft, building or shipped; `summary`, one user-facing line reused in release notes; `request`, the sentence, issue or commits it started from; `issue`, optional, delete the line when there is none. The owner's go is `approved: {by: <owner>, via: <in session, a message link, or a PR>}`, added only when the user reports it, never inferred; git dates it. After a change to Why or What changes, remove the line; the owner's new go writes it back. The go is never a status.

Why: required. The problem, who has it, and what it costs to leave it, in 2 to 5 lines. No solution.

What changes: required. Claims under `### Add · <domain>/<capability>`, `### Change · ...` and `### Remove · ...`, only the headings that apply, one per capability. A Change claim carries a `was:` line with the current text on main. A Remove claim carries a `reason:` line. A fix that changes no behavior writes "No behavior change." and nothing else here. Claims read exactly as they will in behavior/.

Not doing: required for a feature, optional for a fix. What is deliberately out, so scope can't creep silently. Not future ideas with no decision behind them.

Open questions: while drafting, only questions the owner can answer. Delete the section when empty; the owner can't say go before that. Questions the agent can answer from the code never go here.

A spec past about 80 lines is two specs.
