---
id: 2026-10-14-plugin-onboarding
kind: fix
status: shipped
summary: Complete plugin metadata for supported clients and Codex setup, and schedule reviewed GitHub Actions updates.
request: Open a new PR with all the recommended improvements, including missing metadata and supported icons for Claude Code and other agent clients.
approved: {by: Yousef, via: in session}
---
# Complete plugin presentation and setup metadata

## Why
New users lack a detailed plugin description, support links and starter prompts in the package metadata.
The subtitle exceeds the public listing limit, and the package does not declare its existing setup skill.
Publisher, homepage and discovery metadata differs between clients, and Claude's directory listing has no icon or documentation/support links.
Pinned workflow actions have no scheduled version-update configuration.

## What changes

### Add · repository/presentation
- The plugin metadata provides a concise subtitle, a detailed description, and project and support links {#plugin-listing}
  e.g. a listing consumer reads the package -> the subtitle fits 30 characters and the description explains the workflow and its limits
- The plugin metadata provides three starter prompts for setup, planning and resuming work {#plugin-starters}
  e.g. a user needs an entry point -> the package includes a prompt for each of those tasks
- The Codex package declares the existing docs-init skill as its setup entry point {#plugin-onboarding}
  e.g. a host resolves onboardingSkill -> it points to the packaged docs-init/SKILL.md

### Add · repository/contributions
- The repository schedules weekly GitHub Actions version checks through Dependabot, with updates proposed as pull requests {#action-version-updates}
  e.g. the configuration is on the default branch and an action is outdated -> Dependabot can open an update PR for review

### Add · pack/portability
- The portable and Claude manifests publish matching author, homepage and discovery keywords {#shared-plugin-metadata}
  e.g. a compatible client reads its manifest -> the publisher, project link and discovery terms agree
- Claude's manifest provides a packaged icon and documentation/support links for Anthropic's directory {#claude-listing-metadata}
  e.g. a directory reads the manifest -> the icon path resolves and the documentation and support links are present

## Not doing
Changing skill instructions, existing artwork, version 0.1.2, repository protection rules or merging the PR.
