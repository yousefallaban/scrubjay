---
id: 2026-10-19-readme-update-step
kind: fix
status: shipped
summary: "The pack README says a plugin update leaves the block already in a repo's AGENTS.md as it was, and that one docs-init rerun refreshes it"
request: "Yousef, on 2026-10-19, after hearing the update steps for the 0.2.0 release: this should be in the readme somewhere right?"
---
# Say that a pack update needs a docs-init rerun

## Why
The Getting updates paragraph tells a user how a new version reaches each agent, and stops there. The project-memory block the pack wrote into a repo's AGENTS.md is a copy made by docs-init, and an update of the pack leaves it as it was, so a repo keeps running under the old rules until someone reruns docs-init. docs-init already promises that a rerun changes only the text between the markers (`docs/init#rerun-safe`); the README never says to use it for this, and the 0.2.0 block differs from the 0.1.3 one in two rules.

## What changes
No behavior change.

## Not doing
Changing docs-init, the block or the update mechanics; the root README, which points at the pack README for updates; a version bump (D1).
