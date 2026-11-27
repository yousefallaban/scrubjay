---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-shorter-return-window/plan.md
pattern: '^## Scope\n+```[a-z]*\n(?:(?!```)[\s\S])*?^\s*\S+\s+~ \S'
flags: m
---
