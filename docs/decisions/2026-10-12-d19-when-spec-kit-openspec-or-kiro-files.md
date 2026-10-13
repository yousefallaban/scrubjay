---
id: 2026-10-12-d19-when-spec-kit-openspec-or-kiro-files
status: superseded by D34
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# When Spec Kit, OpenSpec or Kiro files exist, docs-init asks whether to archive them (the default) or leave them in place

## Context
Archiving moves the content to `docs/archive/<tool>/` with a README. Either way their folders join the never-write list, the choice is recorded in `index.md`, and docs-map reads them on touch. The tools' setup files are listed for the user to remove, never touched.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
When Spec Kit, OpenSpec or Kiro files exist, docs-init asks whether to archive them (the default) or leave them in place.

## Consequences
Why: bulk conversion turns stale specs into "truth." Work already in flight in the old tool can finish there.
Revisit when: users ask for a guided migration.
