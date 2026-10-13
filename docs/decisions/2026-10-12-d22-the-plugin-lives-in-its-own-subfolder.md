---
id: 2026-10-12-d22-the-plugin-lives-in-its-own-subfolder
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The plugin lives in its own subfolder of the repo

## Context


## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
The plugin lives in its own subfolder of the repo.

## Consequences
Why: Claude Code copies the whole plugin source into each user's cache. A subfolder keeps this repo's docs, tests and CI out of users' installs.
Revisit when: never, unless the agents change how they install plugins.
