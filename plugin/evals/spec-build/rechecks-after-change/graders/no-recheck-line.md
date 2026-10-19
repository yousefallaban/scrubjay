---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/tasks.md
pattern: '^(Rechecked|Recheck|Session)\b'
match: not_contains
flags: mi
---
