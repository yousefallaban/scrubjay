---
id: 2026-10-12-d43-the-block-driven-claims-are-checked-by
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The block-driven claims are checked by hand on scrubjay-example, on both agents, with transcripts kept. Cases that need a repo state carry a scaffold script

## Context
Extends D30. `claude plugin eval` runs load no project instructions: no CLAUDE.md, no `.claude/` directory, nothing from above or inside the workspace. So `answers-from-docs`, `resumes` and `session-line` can't be graded by the eval runner; a prompt that tells the agent to read tasks.md tests nothing about the block. Each eval run starts in an empty directory, so a behavior case that needs files or git state names a Bash scaffold script in its case folder, run with `--scaffold`.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
The block-driven claims are checked by hand on scrubjay-example, on both agents, with transcripts kept. Cases that need a repo state carry a scaffold script.

## Consequences
Why: these three claims are bet A. The runner gives trigger and behavior coverage for the commands and zero evidence for the block.
Revisit when: the eval runner can load project instructions, or a cross-agent runner appears.
