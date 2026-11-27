Purpose: section rules for `specs/<id>/plan.md`. Template: `assets/plan.md`.

Frontmatter: `spec`, the spec id.

Two parts. Every line above Scope is what the owner reads to say OK: Approach, Contracts, Dependencies and Picks, in about 40 lines at most. Scope and what follows it is what the build works from. Nothing the owner has to agree to is left only in `reference/`.

Approach: required. The shape of the solution in 3 to 8 lines. Don't restate the why. Shape only: a size or value that arrives mid-build goes to `reference/`, not here.

Contracts: when the change adds or alters a contract, which is what another module or system calls or reads: exported types and function signatures, component props, endpoints, events, schema. Code in the project's language, with the names the code uses. Changed members only: a type that gains a field shows that field under a comment saying the rest stays. Never a module's internal helpers, an unchanged type, or a function body.

Dependencies: when the change adds or alters a dependency between modules. One mermaid flowchart, about ten nodes at most, with an arrow from the module that depends to the one it depends on. The arrows the change adds or alters and the modules they connect, not the whole system.

Picks: when a choice was made for the owner without asking. One line each: the choice over the alternative, because the reason. A choice the owner stated is not a pick. A choice that outlives the spec links to its decision record. Not every idea mentioned in passing. A plan written with a Trade-offs heading is read the same way.

Scope: required. The folders or files the change may land in: path, new or changed or deleted, one-line reason. A folder covers everything under it, so a module that gets several files is one line. Code, test and config paths only: the docs the flow itself writes, the spec folder, `behavior/`, `architecture/` and `decisions/`, are never listed. This is where spec-build writes without asking and what the review checks the diff against. Not line-level edits. A plan written with a Files heading is read the same way.

Architecture to update at ship: optional, when an architecture area changes. Each area file and the plan section or the reference file it comes from. spec-ship updates exactly these. Not the content itself.

Rollout: optional, only when order matters. Migrations, flags, deploy order, backfills. Not standard deploy steps.

Risks: optional. What could break and which claim or test covers it. Not generic risks.

An owner's part past about 40 lines means the change is too big, or it holds detail the OK does not need, which belongs in `reference/`.
