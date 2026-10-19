---
id: 2026-10-19-claim-evidence
kind: feature
status: shipped
summary: "The ship review checks that each claim's test proves it, a supporting test needs no claim label, and a session says so when the code disagrees with a claim"
request: "A second reviewer's findings, relayed by Yousef on 2026-10-19: a claim ID in a test name is not evidence unless the assertions exercise the claim; tests of internal helpers should not need a forced label; doubt, contradictions and questions about runtime behavior need an explicit path instead of a confident answer from the docs"
approved: {by: yousef, via: in session}
---
# Make the evidence behind a claim honest

## Why
The claims in `behavior/` are the contract and the tests carrying their IDs are the evidence, but nothing checks that a test's assertions prove the claim it names: a test that only checks that saving does not throw passes as proof of `no-duplicates`. One verification line says every test added carries a claim reference, so a test of an internal helper is either forced under a claim or left unwritten. And the block says to answer from `behavior/` and open the code only to change it, so a session can state a claim the code no longer meets, with full confidence and no word about a fix. A reviewer found all three on 2026-10-19 and nothing in the pack catches them.

## What changes

### Add · spec/ship
- The fresh reviewer reads the assertions of each test carrying a claim reference and reports one whose assertions do not prove its claim {#tests-prove-claims}
  e.g. `keeps one entry [wishlist/save-item#no-duplicates]` only asserts that the second save does not throw -> listed as a finding: the test does not prove no-duplicates
- A test the review reports as weak is left unchanged at ship, for the owner to fix before the merge {#weak-test-stays}
  e.g. the weak no-duplicates test -> the test file is the same after spec-ship, and the Review says what the test lacks
- A helper that the code of a covered claim calls is covered by that claim, and neither it nor an unlabeled test of it is removed at ship {#covered-helpers}
  e.g. `keyFor`, called by `save`, with a test named `keyFor prefixes the customer id` -> both stay, and the Review lists no removal

### Add · spec/build
- A test of an internal detail of code a claim covers is named for what it checks and carries no claim reference {#supporting-tests}
  e.g. a test of the `keyFor` helper behind `save` -> named `keyFor prefixes the customer id`, with no claim reference

### Add · docs/init
- A question about what the code does now, or a doubt about a claim, is answered from the code and the tests that cover it, with the claim quoted beside the finding {#verifies-on-doubt}
  e.g. "I'm not sure the code rounds half up the way the docs say" -> the session reads `src/returns.ts` and its test, and answers with `returns/submit-return#partial-refund` and what the code does
- When the code disagrees with a claim, the session states the documented requirement and what the code does instead, and names the fix spec or offers to start one {#names-the-mismatch}
  e.g. the claim says half-up rounding and the code rounds with floating point -> "Documented: half-up (returns/submit-return#partial-refund). Code: one cent short on some inputs. No fix spec yet; start one?"

### Change · pack/quality
- The claims the block drives, answers-from-docs, resumes, session-line, verifies-on-doubt and names-the-mismatch, are checked by hand on `scrubjay-example` on both agents before release, and the transcripts are kept, since eval runs load no project instructions {#block-cases}
  was: The claims the block drives, answers-from-docs, resumes and session-line, are checked by hand on `scrubjay-example` on both agents before release, and the transcripts are kept, since eval runs load no project instructions
  e.g. a fresh Codex session on `add-wishlist` reports "T3 is next" unprompted -> the transcript is saved under the case

## Not doing
- A verified-on date or a status field on claims: the claim's test runs on every pull request, which is the verification.
- Required, Observed or Status lines inside behavior files: they hold claims and nothing else, and a mismatch lives in the fix spec that restores the claim.
- Weakening the removal of uncovered code at ship, or the "Add it?" stop: both are recorded trade-offs that wait for real-use evidence; covered-helpers says what the removal never meant.
- Comparing the code on every documented question: `answers-from-docs` stands; the code is read on a question about the code or on doubt.
- A Codex eval runner, a token measurement of lookups, or un-parking docs-check.
- A version bump: this ships inside 0.2.0 with the mid-build-changes pull request, by Yousef's call.
