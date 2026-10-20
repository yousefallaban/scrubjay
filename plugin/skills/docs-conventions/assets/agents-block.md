<!-- project-memory:start · managed by docs-init; edit outside these markers -->
## Project memory
- Start every task at {{docs-path}}/index.md, or at the active spec's tasks.md on a spec
  branch, and load only what they link to. Load glossary.md when naming things and
  decisions/ before changing a lasting choice.
- Answer what the product does from {{docs-path}}/behavior/. Open the code only to change it, or
  when the user asks what the code does now, doubts a line in behavior/ or reports something that
  differs from it; then quote that line beside what the code does. When the code and behavior/
  disagree, state both, then name the spec that fixes it or offer to start one.
- Every code change belongs to a spec in {{docs-path}}/specs/. None yet: start one (spec-start).
- One branch per spec, named after its slug. The active spec is the one matching the current branch.
- If spec.md or the plan's Scope change mid-way, update them, then recheck every task and
  rewrite the list in place; a change that touches no claim and no Scope reopens
  one task with a redo line instead.
- Write specs, plans, tasks, glossary terms and decisions into {{docs-path}}/,
  never into SPEC.md, tasks/, CONTEXT.md or docs/superpowers/{{extra-never-write}}.
- Before opening a pull request, ship the spec (spec-ship), which writes the PR title and description.
<!-- project-memory:end -->
