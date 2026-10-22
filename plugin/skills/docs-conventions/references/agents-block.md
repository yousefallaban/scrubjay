Purpose: rules for the project-memory block in the root AGENTS.md. Template: `assets/agents-block.md`.

The block sits between `<!-- project-memory:start -->` and `<!-- project-memory:end -->` markers, written and refreshed by docs-init only. Everything outside the markers is the project's own and is never touched. The block is root-only; nested AGENTS.md files are named by docs-init, not written.

Slots: `{{docs-path}}` is `docs`, or the subfolder chosen when docs/ already serves a documentation site. `{{extra-never-write}}` lists the folders of any Spec Kit, OpenSpec or Kiro setup found, written as `, openspec/ or .kiro/specs/`, and is empty when there are none.

The block holds the workflow and where memory lives, never project knowledge; that goes in docs/.

The block also says what a review on a spec branch checks, in one paragraph, so any reviewer that reads AGENTS.md, in the agent or on the code host, runs the same five checks as spec-ship's fresh review: a test per claim whose assertions prove it, no contradiction, nothing outside the Scope, uncovered code removed, conventions and invariants held.
