---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/plan.md
pattern: '^## Contracts\n(?:(?!^## )[\s\S])*?\bMap<'
flags: m
match: not_contains
---
