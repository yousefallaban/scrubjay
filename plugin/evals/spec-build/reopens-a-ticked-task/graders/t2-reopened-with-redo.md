---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/tasks.md
pattern: '^- \[ \] T2 [^\n]*\n(?:\s+- (?:note|handoff):[^\n]*\n)*\s+- redo:'
flags: m
---
