---
type: regex
target:
  source: file
  path: docs/specs/2026-10-13-add-wishlist/spec.md
pattern: '^kind: feature[\s\S]*^request: [\s\S]*^## Why[\s\S]*### Add . wishlist/[\s\S]*\{#[a-z0-9-]+\}[\s\S]*^## Not doing'
flags: m
---
