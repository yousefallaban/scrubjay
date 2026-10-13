---
id: 2026-10-13-d59-tasks-cover-the-build-only-and-a
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-13
---
# Tasks cover the build only, and a plan's Files lists code, test and config files only. The docs the flow itself writes, the block and the import included, are never in Files and never unrelated

## Context
Found in both dogfood runs: Codex's spec-plan added a fifth task "ship with spec-ship" and listed the behavior, architecture and spec files under Files; Claude Code's fresh reviewer counted `AGENTS.md` and `CLAUDE.md` from the docs-init commit as code outside the plan. A ship task would make spec-build ship on its last tick, and docs under Files or under Unrelated changes would make the review report the flow's own writes.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Tasks cover the build only, and a plan's Files lists code, test and config files only. The docs the flow itself writes, the block and the import included, are never in Files and never unrelated.

## Consequences
Why: spec-build's "stay inside Files" and spec-ship's "unrelated changes" both read Files, so it holds only what the build touches.
Revisit when: never.
