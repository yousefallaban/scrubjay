---
id: 2026-10-12-d17-templates-hold-frontmatter-and-fixed-headings-only
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Templates hold frontmatter and fixed headings only. Guidance comments are removed when a file is written, optional sections are deleted when empty, and index.md records the docs-format version

## Context


## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Templates hold frontmatter and fixed headings only. Guidance comments are removed when a file is written, optional sections are deleted when empty, and index.md records the docs-format version.

## Consequences
Why: placeholder text gets treated as real content by later agents, and agents find content by heading.
Revisit when: a template change needs to migrate existing files.
Changed in part by D54.
