---
id: 2026-10-14-plugin-patch-version
status: accepted
spec: 2026-10-14-bump-plugin-version
date: 2026-10-14
---
# Version the merged metadata as a patch release

## Context
The metadata PR merged with version 0.1.2. The owner then requested a bump so existing installations can detect the changed package.

## Decision
Set both plugin manifests to 0.1.3. Metadata changes follow the normal released-plugin version rule. This supersedes the version-retention exception in the plugin-onboarding decision; that record remains as history.

## Consequences
Claude Code can detect the newer package through its existing update flow after merge. Skill instructions and artwork are unchanged. No release tag is created and the PR is not merged by the agent.
