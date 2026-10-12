---
type: regex
target:
  source: file
  path: docs/specs/2026-10-12-add-wishlist/plan.md
pattern: '^## Rollout|^## Risks|<!--|\bTBD\b|^\s*None\s*$'
match: not_contains
flags: m
---
