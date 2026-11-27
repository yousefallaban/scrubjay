---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/plan.md
pattern: '```mermaid\n(?:(?!```)[\s\S])*?^(?![^\n]*--\s*[^\n>|-][^\n]*-->)[^\n]*-->(?![|>])'
flags: m
match: not_contains
---
