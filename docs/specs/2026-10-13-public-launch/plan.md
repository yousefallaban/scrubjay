---
spec: 2026-10-13-public-launch
---
## Approach
Inspect current settings, all local Git history and the existing artwork before publication. Apply compatible repository settings while private. Add a root CODEOWNERS file, a short PR template and security reporting instructions; restrict the existing workflow token and pin checkout. Use the existing JPEG for GitHub and a square SVG frame containing that unchanged JPEG for Codex. Keep both versions at 0.1.2 as requested. Prepare a PR and never merge it. After publication, enable public-only protections and verify each setting.

## Trade-offs
Require one owner review for outside PRs. Permit the repository administrator to bypass that review through a PR, because a sole owner cannot approve their own PR. Keep required checks in a separate ruleset without bypass. Keep issues and contributions open rather than shutting out potential contributors.

## Files
```
.github/CODEOWNERS                 new: route all reviews to the owner
.github/pull_request_template.md   new: ask for the change, evidence and scope
.github/workflows/checks.yml       changed: explicit read-only permission and pinned checkout
SECURITY.md                       new: direct vulnerability reports to GitHub's private reporting
plugin/assets/icon.svg            new: square framing of the unchanged bird artwork
plugin/plugin.json                changed: logo and composerIcon paths, version stays 0.1.2
```

## Architecture to update at ship
- repository.md, from reference/github-settings-verified.json
- boundaries.md: add plugin/assets as self-contained presentation files

## Rollout
Yousef approved the plan and requested client-name removal in this session. Preserve the original repository privately under scrubjay-private-history, including its old PR records. Import sanitized branch history into a new private repository at the original address. Disable Actions before publication; then configure public fork approval, both rulesets, private vulnerability reporting and secret scanning before restoring Actions. Upload the existing preview. Source changes are proposed in a PR and need the owner's merge before the icon and CODEOWNERS apply on master.

## Risks
Publishing the current history exposes the client name. A later deletion commit does not fix old commits or old PR views. History cleanup must include reachable refs and GitHub's retained PR material, or the owner must explicitly choose another publication strategy. Check names must match actual CI runs. A protection that requires the sole owner to approve their own PR would block maintenance; the review bypass handles that case.
