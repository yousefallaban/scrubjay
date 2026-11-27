---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/plan.md
pattern: '^## Dependencies\n(?:(?!^## )[\s\S])*?```mermaid\n(?=(?:(?!```)[\s\S])*?-->)(?=(?:(?!```)[\s\S])*?wishlist)(?:(?!```)[\s\S])*?products'
flags: mi
---
