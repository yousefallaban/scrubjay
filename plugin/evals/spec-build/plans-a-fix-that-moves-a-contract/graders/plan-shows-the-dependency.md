---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-move-price-lookup/plan.md
pattern: '^## Dependencies\n(?:(?!^## )[\s\S])*?```mermaid\n(?=(?:(?!```)[\s\S])*?-->)(?:(?!```)[\s\S])*?pricing'
flags: mi
---
