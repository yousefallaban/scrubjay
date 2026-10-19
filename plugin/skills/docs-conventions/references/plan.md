Purpose: section rules for `specs/<id>/plan.md`. Template: `assets/plan.md`.

Frontmatter: `spec`, the spec id.

Approach: required. The shape of the solution in 3 to 8 lines. Don't restate the why. Shape only: a size or value that arrives mid-build goes to `reference/`, not here.

Trade-offs: optional, when there was a real choice. The options considered and why this one won. A choice that outlives the spec links to its decision record. Not every idea mentioned in passing.

Scope: required. The folders or files the change may land in: path, new or changed or deleted, one-line reason. A folder covers everything under it, so a module that gets several files is one line. Code, test and config paths only: the docs the flow itself writes, the spec folder, `behavior/`, `architecture/` and `decisions/`, are never listed. This is where spec-build writes without asking and what the review checks the diff against. Not line-level edits. A plan written with a Files heading is read the same way.

Architecture to update at ship: optional, when an architecture area changes. Each area file and the reference file it comes from. spec-ship updates exactly these. Not the content itself.

Rollout: optional, only when order matters. Migrations, flags, deploy order, backfills. Not standard deploy steps.

Risks: optional. What could break and which claim or test covers it. Not generic risks.

A plan past about 60 lines means the change is too big, or design detail belongs in reference/.
