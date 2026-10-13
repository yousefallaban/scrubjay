---
id: 2026-10-12-d36-docs-init-writes-index-md-and-architecture
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# docs-init writes index.md and architecture/stack.md. There is no architecture/index.md, folders are created on first write, and index.md has no company-knowledge section in v0.1

## Context
Supersedes the skeleton in D11 and defers D18 to the roadmap as direction. stack.md holds the project's commands from the start, so spec-ship can run the tests on a repo that never ran docs-map. The architecture folder listing is its own index.

## Options
- The choice in D11: replaced by this one

## Decision
docs-init writes index.md and architecture/stack.md. There is no architecture/index.md, folders are created on first write, and index.md has no company-knowledge section in v0.1.

## Consequences
Why: every file three skills must keep in sync is a place for docs/ to go stale, which is bet A's failure mode. Empty folders don't survive a commit. The test command had no source on the quickstart path.
Revisit when: an architecture folder grows past what a listing explains.
