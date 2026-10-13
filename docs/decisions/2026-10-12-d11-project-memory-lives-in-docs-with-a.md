---
id: 2026-10-12-d11-project-memory-lives-in-docs-with-a
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Project memory lives in docs/, with a file charter: one job per file, and a "never contains" column for each

## Context
The files are `index.md`, `glossary.md`, `behavior/<domain>/<capability>.md`, `architecture/` (an index plus area files created when needed) and `decisions/`, plus one folder per spec.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Project memory lives in docs/, with a file charter: one job per file, and a "never contains" column for each.

## Consequences
Why: small files with one job each stay true and cheap to load. The "never contains" column says where content goes instead.
Revisit when: agents regularly load more than three docs files for an ordinary task.
Changed in part by D36.
