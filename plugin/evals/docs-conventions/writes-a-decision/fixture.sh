#!/usr/bin/env sh
# Builds a small webshop project with a docs/ memory already in place.
set -eu
mkdir -p docs/behavior docs/decisions docs/specs docs/architecture src
cat > AGENTS.md <<'MD'
# Webshop

<!-- project-memory:start · managed by docs-init; edit outside these markers -->
## Project memory
- Start every task at docs/index.md, or at the active spec's tasks.md on a spec
  branch, and load only what they link to. Load glossary.md when naming things and
  decisions/ before changing a lasting choice.
- Answer what the product does from docs/behavior/. Open the code only to change it, or
  when the user asks what the code does now, doubts a line in behavior/ or reports something that
  differs from it; then quote that line beside what the code does. When the code and behavior/
  disagree, state both, then name the spec that fixes it or offer to start one.
- Every code change belongs to a spec in docs/specs/. None yet: start one (spec-start).
- One branch per spec, named after its slug. The active spec is the one matching the current branch.
- If spec.md or the plan's Files change mid-way, update them, then recheck every task and
  rewrite the list in place; a change that touches no claim and no file in the plan reopens
  one task with a redo line instead.
- Write specs, plans, tasks, glossary terms and decisions into docs/,
  never into SPEC.md, tasks/, CONTEXT.md or docs/superpowers/.
- Before opening a pull request, ship the spec (spec-ship), which writes the PR title and description.
<!-- project-memory:end -->
MD
cat > docs/index.md <<'MD'
---
product: Webshop
docs-format: 1
---
# Webshop

## What it is
A small webshop where customers buy outdoor gear and send items back when they don't fit. Support handles returns and refunds.

## Domains
| Domain | Covers | Owner |
| --- | --- | --- |
| returns | sending items back, refunds | Sanne |

## Behavior
See [behavior/](behavior/): one folder per domain, one file per capability, each a short list of claims with IDs.

## Architecture
See [architecture/](architecture/): one file per area, `stack.md` first.
MD
cat > docs/architecture/stack.md <<'MD'
---
area: stack
---
# Stack

## Commands
| Task | Command |
| --- | --- |
| Test | bun test |
MD
cat > src/returns.ts <<'TS'
export const RETURN_WINDOW_DAYS = 30;
TS
git init -q && git add -A && git -c user.name=fixture -c user.email=fixture@example.com commit -q -m "fixture"
