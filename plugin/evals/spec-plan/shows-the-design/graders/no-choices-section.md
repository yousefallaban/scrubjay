---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/plan.md
pattern: '^## (?:Trade-offs|Picks|Choices|Dependencies)'
flags: m
match: not_contains
---
