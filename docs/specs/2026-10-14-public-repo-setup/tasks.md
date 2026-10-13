---
spec: 2026-10-14-public-repo-setup
---
Session 2026-10-14: started at T1; first message: "Read the version from the manifests, use better branch names with a rule and no agent prefix, and remove ROADMAP.md."

- [x] T1 Update AGENTS.md and README.md, remove ROADMAP.md, and record the current repository conventions -> check: current instructions use manifest versions and type/purpose branches, no active roadmap links remain, sh checks/run.sh passes
  Static and strict manifest checks pass; independent review passed after clarifying the active spec's decision-file path.
- [x] T2 Rename the local and remote branch to chore/public-repo-setup -> check: both names and upstream agree, commits retained, master protections unchanged
  Both branches retained a327b1b; upstream matches. master remains protected at 73433f5; PR #1 closed without merging.
