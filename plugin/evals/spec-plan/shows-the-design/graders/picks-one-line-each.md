---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/plan.md
pattern: '^## Picks\n(?:(?!^## )[\s\S])*?^- [^\n]+\bover\b[^\n]+\bbecause\b'
flags: mi
---
