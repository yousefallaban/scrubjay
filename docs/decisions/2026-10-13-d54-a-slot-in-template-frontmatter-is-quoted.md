---
id: 2026-10-13-d54-a-slot-in-template-frontmatter-is-quoted
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-13
---
# A slot in template frontmatter is quoted, so every template is valid YAML before it is filled

## Context
Extends D17 and D50. GitHub renders a markdown file's frontmatter and shows "Error in user YAML" when `{{slot}}` opens a flow mapping. `key: "{{slot}}"` parses, and the filled value is valid with or without the quotes. The static check fails an unquoted slot.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
A slot in template frontmatter is quoted, so every template is valid YAML before it is filled.

## Consequences
Why: a template that errors in the repo browser looks broken, and a parser-valid template is what a later checker needs anyway.
Revisit when: never.
