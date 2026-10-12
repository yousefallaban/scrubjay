---
type: regex
target:
  source: file
  path: docs/decisions/2026-10-12-wishlist-stored-server-side.md
pattern: '<!--|\bTBD\b|^\s*None\s*$'
match: not_contains
flags: m
---
