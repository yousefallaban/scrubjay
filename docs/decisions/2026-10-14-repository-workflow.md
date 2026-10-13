---
id: 2026-10-14-repository-workflow
status: accepted
spec: 2026-10-14-public-repo-setup
date: 2026-10-14
---
# Use manifest versions and typed purpose branches

## Context
The owner requested removal of the initial-build wording, version-based branch naming and the standalone roadmap. The existing instructions forced new work onto the original branch even after that build was complete. The owner also excluded agent names from branch prefixes.

## Options
- Keep the bootstrap instructions: later work still appears to be the first release.
- Use an agent prefix: the owner rejected it.
- Use a change type and purpose, with manifest versions and specs as the sources: keeps current work separate from release history.

## Decision
Repository branches use `<type>/<purpose>` with feature, fix, docs, chore or refactor. The purpose matches the active spec slug. The current version is read from the two plugin manifests. Agreed future work gets a spec; the standalone roadmap is removed.

## Consequences
This supersedes the bootstrap branch, PR-title and manual-build instructions for this repository, including the repository-specific parts of D7 and D29. It does not change the shipped skills' behavior. Historical specs and decisions keep their original text. The PR being prepared moves to chore/public-repo-setup; GitHub closes the old PR when its head is renamed, so a replacement PR carries the same commits and links to the old discussion.
