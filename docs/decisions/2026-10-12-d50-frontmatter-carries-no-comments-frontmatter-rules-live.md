---
id: 2026-10-12-d50-frontmatter-carries-no-comments-frontmatter-rules-live
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Frontmatter carries no comments. Frontmatter rules live in docs-conventions, and the templates README until then

## Context
Extends D17. The removal rule covered `<!-- -->` comments only, so a skill following it literally would leave YAML `#` guidance in every project file.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Frontmatter carries no comments. Frontmatter rules live in docs-conventions, and the templates README until then.

## Consequences
Why: placeholder text gets treated as real content by later agents, and the no-placeholders claim forbids it.
Revisit when: never.
