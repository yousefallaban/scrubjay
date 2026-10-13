---
id: 2026-10-13-public-history
status: accepted
spec: 2026-10-13-public-launch
date: 2026-10-13
---
# Preserve private development history when publishing

## Context
The owner requested publication and removal of a client name found in old task notes. Deleting the current text would still expose historical commits. Rewriting normal branch refs would leave GitHub's retained old PR records.

## Options
- Publish the original: exposes client material.
- Rewrite the original's branches: does not remove retained PR history.
- Preserve the original privately and import sanitized branches into a new repository at the same address: separates private records from public distribution.

## Decision
The original stays private as scrubjay-private-history; the public repository at the original address contains sanitized branches without the original PR refs.

## Consequences
The install address remains the same. Old PRs remain in the private original, and affected commit IDs change. Repository settings must be reapplied to the clean replacement. The owner can deliberately bypass review through a PR, but the separate required-check rule has no bypass.
