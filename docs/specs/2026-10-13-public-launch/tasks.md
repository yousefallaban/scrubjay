---
spec: 2026-10-13-public-launch
---
Session 2026-10-13: started at T1; first message: "Make the repository public, configure contribution protection, and add a social image."
Plan OK and client-name removal requested by Yousef in this session.
Rechecked after fresh review: T1 keep, T2 keep with explicit icon-path verification, T3 keep with Actions disabled during publication and private vulnerability reporting enabled, T4 keep. These implement the approved protection plan.

- [x] T1 Inspect publication inputs and prepare compatible settings -> check: version 0.1.2, existing artwork, history audit and current settings recorded
  - note: snapshots saved before changes; squash-only merges, read-only tokens, GitHub-owned Actions and discovery topics verified. No repository secrets or self-hosted runners.
- [x] T2 Add contribution files and plugin artwork after plan OK -> reviewed-contributions, plugin-artwork; check: sh checks/run.sh passes and the manifest's square icon resolves inside plugin/
  - note: static checks and both strict validators pass; both versions remain 0.1.2, both icon paths resolve, SVG embeds the original JPEG unchanged. Display on master waits for the owner's PR merge.
- [x] T3 Publish after the client-material decision, apply public-only settings and upload the preview -> public-repository, fork-approval, protected-history, social-preview
  - note: clean public history has zero client-name matches; original remains private. Three active rulesets, protected master, fork approval, secret protection, private reporting and uploaded preview verified.
- [x] T4 Verify settings and prepare the reviewed PR -> check: fresh review recorded, PR open, no merge performed
  - note: PR #1 open with passing static CI and the fresh review in its description. The owner merges; installed Codex icon rendering remains untested.
