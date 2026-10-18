<!-- project-memory:start · managed by docs-init; edit outside these markers -->
## Project memory
- Start every task at {{docs-path}}/index.md, or at the active spec's tasks.md on a spec
  branch, and load only what they link to. Load glossary.md when naming things and
  decisions/ before changing a lasting choice.
- Answer what the product does from {{docs-path}}/behavior/; open the code only to change it.
- Every code change belongs to a spec in {{docs-path}}/specs/. None yet: start one (spec-start).
- One branch per spec, named after its slug. The active spec is the one matching the current branch.
- Every session adds its line to tasks.md. If spec.md or the plan's Files change mid-way, update
  them, then recheck every task; a change that touches no claim and no file in the plan reopens
  one task with a redo line instead.
- Write specs, plans, tasks, glossary terms and decisions into {{docs-path}}/,
  never into SPEC.md, tasks/, CONTEXT.md or docs/superpowers/{{extra-never-write}}.
- Before opening a pull request, ship the spec (spec-ship), which writes the PR title and description.
<!-- project-memory:end -->
