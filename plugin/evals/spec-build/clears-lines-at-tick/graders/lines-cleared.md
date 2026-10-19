---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/tasks.md
pattern: '^\s+- (note|handoff|redo):'
flags: mi
match: not_contains
---
