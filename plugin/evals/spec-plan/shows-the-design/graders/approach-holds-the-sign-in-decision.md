---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/plan.md
pattern: '^## Approach\n(?:(?!^## )[\s\S])*?^- \*\*[^\n]*\b(?:sign(?:ed)?[- ]in|session)\b'
flags: mi
---
