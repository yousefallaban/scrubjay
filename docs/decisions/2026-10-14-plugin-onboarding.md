---
id: 2026-10-14-plugin-onboarding
status: accepted
spec: 2026-10-14-plugin-onboarding
date: 2026-10-14
---
# Reuse setup and review action updates

## Context
The owner approved listing metadata, starter prompts, the existing setup skill and weekly GitHub Actions dependency updates, then included missing metadata and supported icons for Claude Code and other agent clients in the same PR.

## Decision
Keep OpenAI listing fields in the portable manifest's interface and declare the packaged docs-init skill as onboardingSkill alongside it. Keep the existing artwork and both manifests at the owner's requested 0.1.2. Use Dependabot's github-actions ecosystem at directory / with a weekly schedule.

Publish matching author, homepage and keywords in the portable and Claude manifests. Add Claude's documented directory icon and documentation/support links only in its manifest; no supported portable or Copilot icon field exists in the current format.

## Consequences
No skill instructions or new assets are needed. Dependabot proposes updates after the configuration reaches the default branch; existing PR review and required-check rules apply. Metadata limits and packaged paths can be checked locally, while actual installed-host onboarding and rendering remain unverified. Claude's directory fields do not control CLI icons and require Claude Code 2.1.281 or newer for warning-free strict validation. This version retention is a session-specific exception to the normal released-plugin version-bump rule, and existing Claude installations do not receive same-version metadata updates automatically.
