---
id: 2026-10-12-d34-existing-spec-kit-openspec-or-kiro-folders
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Existing Spec Kit, OpenSpec or Kiro folders are only marked never-write

## Context
Supersedes the archive option in D19. docs-init lists the folders it finds in the block's never-write slot and says so. Nothing is moved, imported or recorded in `index.md`. docs-map still reads them as input on touch.

## Options
- The choice in D19: replaced by this one

## Decision
Existing Spec Kit, OpenSpec or Kiro folders are only marked never-write.

## Consequences
Why: the archive flow was four artifacts for users of other tools, on a release that tests the bets on our own work, and the riskiest file operation docs-init did.
Revisit when: users arrive from those tools and ask for a guided migration.
