---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/plan.md
pattern: '^spec: \"?2026-10-13-add-wishlist[\s\S]*^## Approach[\s\S]*^## Scope\n(?:[^\n]+ +(?:new|changed|deleted): [^\n]+\n)+[\s\S]*src/wishlist\.ts'
flags: m
---
