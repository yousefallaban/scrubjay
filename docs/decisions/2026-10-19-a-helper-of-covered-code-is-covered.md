---
id: 2026-10-19-a-helper-of-covered-code-is-covered
status: accepted
spec: 2026-10-19-claim-evidence
date: 2026-10-19
---
# A helper that the code of a covered claim calls is covered by that claim, with or without a test of its own

## Context
spec-ship removes code the diff has that no claim covers, and exempts only a test-only helper that nothing outside the tests calls. The claim-evidence spec let a test of an internal helper carry no claim reference. A fresh review put the two side by side: a helper such as `keyFor`, called by `save` and exported for its test, could be read as behavior no claim covers, and the removal rule would then delete it and its unlabeled test without asking, the very test the new rule allows.

## Options
- Leave it to the reviewer's judgment: lost, since the two rules pointed in opposite directions and nothing in the skill said which wins.
- Require a claim for every helper: lost, because a claim describes observable behavior and a key prefix is not one.
- Say that a helper called by the code of a covered claim is covered by that claim, and stays with any unlabeled test of it: won.

## Decision
A helper that the code of a covered claim calls is covered by that claim, and neither it nor an unlabeled test of it is removed at ship. Extends 2026-10-13-uncovered-code-is-removed-at-ship, which keeps its rule for behavior no claim covers.

## Consequences
The removal rule keeps its edge for behavior nobody asked for, and loses its false positives on implementation detail. A reviewer has to trace a helper to the claim whose code calls it, which the diff makes easy. Watch for a helper that only a removed, uncovered behavior calls: once that behavior goes, the helper is uncovered too.
