---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-fix-refund-rounding/spec.md
pattern: '^kind: "?fix[\s\S]*(### Change . returns/submit-return[\s\S]*\{#partial-refund\}[\s\S]*was:|No behavior change\.[\s\S]*partial-refund)'
flags: m
---
