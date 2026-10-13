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
- OLD BLOCK LINE from an earlier pack version.
<!-- project-memory:end -->
MD
printf '@AGENTS.md\n' > CLAUDE.md
git init -q && git add -A && git -c user.name=fixture -c user.email=fixture@example.com commit -q -m fixture
