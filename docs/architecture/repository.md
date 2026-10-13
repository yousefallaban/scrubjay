---
area: repository
---
# Repository settings

| Setting | Current value |
| --- | --- |
| Visibility and default branch | Public; master |
| Merge methods | Squash only; title and body from the PR |
| Auto-merge and branch cleanup | Auto-merge disabled; merged head branches deleted |
| Default branch rules | PR, one approving review, resolved threads, stale reviews dismissed, linear history; deletion and force pushes blocked |
| Review bypass | Repository administrator, through a PR only |
| Required check | static, GitHub Actions app 15368, strict base freshness; no bypass |
| Release tags | v-prefixed tags cannot be updated or deleted |
| Releases | Immutable releases enabled |
| Reviews | Approving and blocking reviews limited to explicitly granted repository access |
| Outside fork workflows | Every external contributor requires maintainer approval; no secrets or write tokens |
| Actions publishers | Repository-owner actions and GitHub-owned actions only |
| Workflow token | Read-only; cannot create or approve PRs |
| Secret protection | Secret scanning and push protection enabled |
| Vulnerability reports | Private vulnerability reporting enabled |
| Dependency security | Dependabot alerts and security updates enabled |
| Community | Issues and PRs open; wiki and discussions disabled |
| Plugin presentation | Square SVG under plugin/assets, embedded original JPEG; logo and composerIcon paths relative to plugin root |

Ruleset IDs: 25033497 for owner review and history, 25033501 for checks, 25034063 for release tags. These rules use GitHub rulesets, so legacy branch-protection fields can be empty while master reports protected. The current settings were verified through GitHub's API and UI; the source workflow and icon files reach master with the launch PR.
