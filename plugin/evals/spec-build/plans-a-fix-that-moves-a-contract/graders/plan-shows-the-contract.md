---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-move-price-lookup/plan.md
pattern: '^## Contracts\n(?:(?!^## )[\s\S])*?```[a-z]*\n(?:(?!```)[\s\S])*?\b(?:function|type|interface)\b'
flags: m
---
