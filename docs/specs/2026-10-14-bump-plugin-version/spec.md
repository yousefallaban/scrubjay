---
id: 2026-10-14-bump-plugin-version
kind: fix
status: shipped
summary: Release the merged plugin metadata under version 0.1.3 so version-based updates can detect it.
request: Bump scrubjay after clarifying why the merged metadata changes still used version 0.1.2.
---
# Bump the plugin patch version

## Why
The merged metadata and onboarding changes retained the previous package version.
Claude Code's version-based updater cannot distinguish that package from an existing 0.1.2 installation.

## What changes
No behavior change.

## Not doing
Changing skill instructions, artwork, repository settings, GitHub release tags or merging the PR.
