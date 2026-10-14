---
spec: 2026-10-14-plugin-onboarding
---
Session 2026-10-14: started at T1; first message: "Open a new PR with all your recommendations."
Rechecked 2026-10-14 after: "Include missing icons and metadata for Claude Code and other agent clients." T1 redo for shared manifest fields and Claude directory metadata.

- [x] T1 Complete supported clients' metadata, declare the existing setup skill, add weekly Dependabot updates, and update current docs -> plugin-listing, plugin-starters, plugin-onboarding, shared-plugin-metadata, claude-listing-metadata, action-version-updates; check: metadata limits and shared fields agree, all setup/icon paths resolve, Dependabot YAML parses, sh checks/run.sh passes, independent review passes
  Metadata/shared-field/path checks, YAML parsing, static checks and both strict Claude 2.1.296 validators pass; expanded independent review found no issues.
  Installed-host setup/rendering, Copilot runtime and the first Dependabot PR remain unverified; same-version Claude caches do not update automatically.
