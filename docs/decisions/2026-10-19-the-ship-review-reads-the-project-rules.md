---
id: 2026-10-19-the-ship-review-reads-the-project-rules
status: accepted
spec: 2026-10-19-review-conventions
date: 2026-10-19
---
# The fresh review at ship reads conventions.md and invariants.md and reports a break without repairing it

## Context
The fresh reviewer at ship was told what to report, and every item was about the spec and the plan: claims without a test, weak tests, uncovered behavior, files outside the plan, contradictions. A change could meet every claim and still throw a bare `Error` where `architecture/conventions.md` names the project's error class, or store an unchecked id where `architecture/invariants.md` requires the check, and nothing at ship said so. A reviewer outside the project named the gap on 2026-10-19. The baseline case showed the fresh reviewer noticing the bare `Error` on its own in one run of two, and without the pack every run repaired it during the ship instead of reporting it.

## Options
- Leave it to the build: lost, since the builder wrote the code, and the review is the one step where a context that did not write it reads the diff.
- A second reviewer for standards: lost, because that split exists to keep each reviewer's context clean, and a fresh sub-agent already is one, so it reads two more files.
- Stop the ship on a break, or repair it there: lost, since shipping builds nothing and the owner decides, as for a weak test.
- Have the fresh reviewer read the two rule files beside the spec and the plan, report a break in the Review section and leave the code as it is: won.

## Decision
The fresh reviewer reads `architecture/conventions.md` and `architecture/invariants.md` when they exist, reports anything in the diff that breaks a rule in them, and the code the finding names is left unchanged at ship for the owner to fix before the merge. The other architecture areas describe the current state and are not read for this.

## Consequences
A convention break reaches the owner in the pull request text instead of merging unseen, at the cost of two short file reads per review. A project without the two files gets nothing extra, and a break inside behavior no claim covers is removed with that behavior by the uncovered-code rule. Watch for the reviewer reporting preferences the files do not state; the Review names the rule, so the owner can check it against the file.
