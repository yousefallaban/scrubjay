---
id: 2026-10-13-d62-every-released-change-to-plugin-bumps-version
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-13
---
# Every released change to plugin/ bumps version in both manifests, because Claude Code updates by version, not by commit

## Context
Verified with a scratch marketplace: a pushed change at the same version left `claude plugin update` reporting "already at the latest version" and the installed copy behind; the same change at 0.1.1 was fetched. Codex refetches on `marketplace upgrade` regardless. The static check already keeps the two manifests' versions equal; a guard that fails CI when `plugin/` changed and the version did not is a backlog idea, not built.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Every released change to plugin/ bumps version in both manifests, because Claude Code updates by version, not by commit.

## Consequences
Why: a fix that users on Claude Code never receive is not a fix.
Revisit when: Claude Code updates by commit, or the pack moves to tagged releases.
