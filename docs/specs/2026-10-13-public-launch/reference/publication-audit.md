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
