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
mkdir -p docs
printf 'site_name: Webshop docs\nnav:\n  - Home: index.md\n' > mkdocs.yml
printf '# Welcome to the Webshop docs site\n\nSENTINEL-SITE\n' > docs/index.md
git init -q && git add -A && git -c user.name=fixture -c user.email=fixture@example.com commit -q -m fixture
