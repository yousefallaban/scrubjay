---
capability: setup/install
---
# Install the pack

- A developer installs the pack in Claude Code from the GitHub repo with two commands {#claude-code}
  e.g. `/plugin marketplace add yousefallaban/scrubjay` then `/plugin install scrubjay@yousefallaban` -> `/scrubjay:spec-start` is available
- A developer installs the pack in Codex with two commands, adding the repo as a plugin marketplace and installing the plugin from it {#codex}
  e.g. `codex plugin marketplace add yousefallaban/scrubjay` then `codex plugin add scrubjay@yousefallaban` -> `$scrubjay:spec-start` is available
- Installing from a private copy works with the developer's existing git credentials, and the README gives the steps and known catches for each tested agent {#private-repo}
  e.g. after `gh auth login && gh auth setup-git`, the same two Claude Code commands install it from a private repo
- The pack needs only git on the user's machine. `gh` is optional and used only to open pull requests {#git-only}
  e.g. on a machine without `gh`, every command works, and spec-ship shows the PR text to paste
