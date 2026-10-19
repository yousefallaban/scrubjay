---
id: 2026-10-19-a-weak-claim-test-is-a-finding-at-ship
status: accepted
spec: 2026-10-19-claim-evidence
date: 2026-10-19
---
# A test that carries a claim reference but does not prove the claim is a review finding, not a repair at ship

## Context
A claim reference in a test name is the link between a claim and its evidence, and the fresh review at ship checked that every claim had a test carrying its reference. It did not read the assertions. A test named for `no-duplicates` that only asserts the second save does not throw passed as proof. A reviewer outside the project named this on 2026-10-19, and the baseline case confirmed that the fresh reviewer notices such a test on its own but, in one run of two, rewrote it during the ship.

## Options
- Keep the check as it was: lost, since the label stood in for the proof.
- Have spec-ship rewrite a weak test: lost, because shipping builds nothing, and a test written at ship has no failing run behind it.
- Have the reviewer read the assertions and report a weak test in the Review section, leaving the test as it is: won; the owner decides whether it is fixed before the merge.

## Decision
The fresh reviewer checks that the assertions of each test carrying a claim reference prove that claim, a weak test is named in the Review section, and the test file is left unchanged at ship.

## Consequences
A claim's proof is read, not assumed, and a weak test reaches the owner in the pull request text. A pull request can carry a known weak test, which the owner may accept or fix before merging. Watch for the reviewer calling a terse but sufficient assertion weak; the Review names what the test lacks, so the owner can disagree.
