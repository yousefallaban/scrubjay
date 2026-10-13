---
id: 2026-10-13-public-launch
kind: feature
status: shipped
summary: Publish the repository with contribution protections and the existing bird artwork in GitHub and Codex.
request: Make the private GitHub repository public, protect contributions, and use the Downloads preview image; retain version 0.1.2.
approved: {by: yousef, via: in session}
---
# Publish the repository with contribution protections

## Why
People need to install the pack without private-repository access. The owner needs to control what reaches the default branch and which outside contributions can run workflows. The listing should use the project's existing artwork.

## What changes

### Add · repository/contributions
- Contributors can propose changes; merging requires a passing static check, and the normal merge path requires the owner's review {#reviewed-contributions}
  e.g. an outside pull request -> the owner reviews it and the `static` check passes; the administrator can deliberately bypass the review through a PR
- Outside contributors need maintainer approval before their fork workflows run, and those workflows receive no secrets or write token {#fork-approval}
  e.g. a fork pull request -> its workflow waits for approval
- The default branch rejects force pushes and deletion {#protected-history}
  e.g. a force push to master -> GitHub rejects it

### Add · repository/presentation
- People can read and install the public repository without being invited {#public-repository}
  e.g. an unauthenticated visitor -> the repository is readable
- Shared GitHub links use the owner's existing preview image {#social-preview}
  e.g. the repository link is shared -> the blue bird image appears
- Codex loads the bird artwork from the plugin's own assets, and both manifests retain version 0.1.2 {#plugin-artwork}
  e.g. the plugin is loaded -> its interface has a logo and composer icon

## Not doing
Changing the skills, regenerating the owner's artwork, adding collaborators, merging a pull request, publishing client details, or rewriting remote history without separate approval.
