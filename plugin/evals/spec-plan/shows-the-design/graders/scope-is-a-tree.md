---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/plan.md
pattern: '^## Scope\n+```[a-z]*\n(?:(?!```)[\s\S])*?^[ \t│├└─]+\S+\s+[+~] \S'
flags: m
---
