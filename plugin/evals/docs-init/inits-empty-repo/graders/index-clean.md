---
type: regex
target:
  source: file
  path: docs/index.md
pattern: '<!--|\bTBD\b|^\s*None\s*$|issue-tracker'
match: not_contains
flags: m
---
