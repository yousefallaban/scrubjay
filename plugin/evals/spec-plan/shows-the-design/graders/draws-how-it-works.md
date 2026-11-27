---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/plan.md
pattern: '^## How it works\n(?:(?!^## )[\s\S])*?```mermaid\n(?:(?!```)[\s\S])*?(?:autonumber|["|\[(]\s*\d+[.)]\s|--\s*\d+[.)]\s)'
flags: m
---
