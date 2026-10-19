---
id: 2026-10-18-a-reference-file-is-state
status: accepted
spec: 2026-10-18-mid-build-changes
date: 2026-10-18
---
# A reference file describes the current state, and decisions.md is the one append-only file

## Context
D14 made reference/ free working material with a Purpose line and no other shape. In the first spec built in daily use, a verification file grew to about nine appended runs in 250 lines, and nobody could read it before the pull request. The repository convention that decisions are appended and never edited had to survive any new rule.

## Options
- Leave reference/ free and cap its size: lost, a cap does not say what to drop.
- Move verification evidence out of reference/: lost, the proof of a task is its tests, and the browser evidence still belongs to the spec.
- A reference file is state: a new run, draft or measurement replaces the paragraph it supersedes, what was never done stays as one Limits section, git holds the history, and `reference/decisions.md` alone is appended: won.

## Decision
A reference file describes the current state of its subject and is replaced, not appended, with `reference/decisions.md` as the one append-only file.

## Consequences
A verification file stays the size of one run. The record of earlier runs lives in git, not in the file. D14 stands: the file is still not edited at ship and the architecture files are still promoted from it.
