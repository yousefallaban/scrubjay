---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/plan.md
pattern: '^spec: \"?2026-10-13-add-wishlist[\s\S]*^## Approach[\s\S]*^## Scope\n[\s\S]{0,300}?src/wishlist\.ts[^\n]*?\b(?:new|changed|deleted): [^\n]+'
flags: m
---
