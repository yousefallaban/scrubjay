#!/usr/bin/env sh
# A small Bun webshop with no project memory yet.
set -eu
mkdir -p src
cat > package.json <<'JSON'
{ "name": "webshop", "private": true, "type": "module", "scripts": { "test": "bun test" } }
JSON
cat > README.md <<'MD'
# Webshop

A small webshop where customers buy outdoor gear and send items back when they don't fit. Support handles returns and refunds.

Run the tests: `bun test`
MD
cat > src/returns.ts <<'TS'
export const RETURN_WINDOW_DAYS = 30;
TS
mkdir -p docs/architecture
cat > docs/index.md <<'MD'
---
product: Webshop
docs-format: 1
---
# Webshop

## What it is
A small webshop where customers buy outdoor gear and send items back when they don't fit. Support handles returns. SENTINEL-INDEX

## Domains
| Domain | Covers | Owner |
| --- | --- | --- |
| returns | sending items back, refunds | Sanne |

## Behavior
See [behavior/](behavior/): one folder per domain, one file per capability, each a short list of claims with IDs.

## Architecture
See [architecture/](architecture/): one file per area, `stack.md` first.
MD
printf -- '---\narea: stack\n---\n# Stack\n\n## Commands\n| Task | Command |\n| --- | --- |\n| Test | bun test |\n' > docs/architecture/stack.md
cat > AGENTS.md <<'MD'
# Webshop

- Client rule: all dates are UTC.

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
printf '@AGENTS.md\n' > CLAUDE.md
git init -q && git add -A && git -c user.name=fixture -c user.email=fixture@example.com commit -q -m fixture
