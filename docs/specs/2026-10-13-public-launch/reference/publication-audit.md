Purpose: publication audit and current GitHub state on 2026-10-13, before changes.

- Repository: yousefallaban/scrubjay, private, default branch master; owner is the only collaborator.
- Both plugin manifests: 0.1.2. Retain that version at the owner's explicit request.
- Existing artwork: Downloads/scrubjay-github-preview-1280x640.jpg; visually matches assets/preview.jpg, 1280 by 640, about 61 KiB.
- Checks: latest master GitHub Actions run passed; workflow job name static.
- Workflow token: read-only; cannot approve pull requests. Actions initially allow all publishers. Private fork runs disabled, no write tokens or secrets sent.
- Git history: 60 commits and 704 unique blobs scanned for a known client name and common GitHub, OpenAI, AWS and private-key patterns. No credential-pattern matches; this pattern scan is not a comprehensive secret audit.
- Client-material blocker: docs/specs/2026-10-13-no-slop/tasks.md contains a client name in two historical blobs, 57deef8293ce and 39666fe47ea9. The current file has three occurrences. No remote history rewrite is authorized.
- GitHub Free: ruleset API returns 403 while private. Public fork contributor approval API returns 422 while private. No first social-preview upload control appears while private, consistent with GitHub's documented restriction.
- No open pull requests. GitHub retains closed PR material separately from normal branch refs; a clean working tree alone does not make publication safe.

Sources: [GitHub social previews](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/customizing-your-repositorys-social-media-preview), [rulesets](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/available-rules-for-rulesets), [OpenAI plugin assets](https://developers.openai.com/plugins/build/plugins).

Applied while private:
- Squash merges only; PR title and body form the squash commit. Auto-merge remains disabled, merged branches are deleted, updating PR branches is suggested, wiki remains disabled.
- Actions allow repository-owner actions plus GitHub-owned actions; Marketplace-verified and other publishers are not allowed. Default token remains read-only and cannot approve PRs.
- Private fork runs remain disabled, with write tokens and secrets disabled. GitHub ignores the private approval flag when fork runs are disabled; do not claim it is enabled. Public fork approval is still pending.
- Added eight repository topics for discovery.
- Repository has zero Actions secrets and zero self-hosted runners.
- Required check verified from the latest master commit: name `static`, GitHub Actions app ID 15368. The pinned checkout proposal resolves v4 to commit 11d5960a326750d5838078e36cf38b85af677262.
- Baseline: `sh checks/run.sh` passes static checks and both strict Claude Code validators.

Publication completed:
- Original repository ID 1415641199 remains private at scrubjay-private-history, with its old PR records. Clean repository ID 1418067620 is public at the original address; anonymous requests return 200 for the public repository and 404 for the private original.
- Sanitization removed six occurrences across the two historical blobs. Scanned 61 imported commits and 720 blobs with zero remaining client-name matches. Only sanitized master and v0-1 branches were uploaded; no original PR refs were imported.
- Reapplied merge, publisher, token and topic settings to the replacement. Actions remained disabled during publication, and were restored after both branch rulesets and all-external-contributor fork approval were set. GitHub briefly locked rule changes while visibility transitioned; the retry succeeded.
- master reports protected: true. Ruleset 25033497 requires a PR, one review, resolved threads, dismissed stale reviews and squash merging, and blocks deletion and force pushes. The administrator may bypass through a PR. Ruleset 25033501 independently requires the GitHub Actions static check with no bypass and an up-to-date base.
- Ruleset 25034063 blocks updates and deletion of v-prefixed release tags. Immutable releases, Dependabot alerts and security updates, secret scanning, push protection and private vulnerability reporting are enabled.
- Code review limits saved in GitHub: only users explicitly granted read or higher access can approve or request changes. Everyone may still comment, open issues and propose PRs.
- The owner uploaded the existing JPEG. The bird is visibly present under Social preview; screenshot saved at /private/tmp/scrubjay-public-launch/social-preview-verified.jpg. The original in-app tab could not open its file chooser; a fresh tab supported the upload flow.
- Plugin assets and contributor files are on v0-1 and need the owner's PR merge before they appear on master. Actual installed Codex icon display has not been tested; square dimensions, embedded image identity, relative paths and manifest versions have been verified.
