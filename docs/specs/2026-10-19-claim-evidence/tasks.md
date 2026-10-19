---
spec: 2026-10-19-claim-evidence
---
Session 2026-10-19: resumed at T1; first message: "go".
Rechecked 2026-10-19 after: the fresh review; fresh-review split into tests-prove-claims and weak-test-stays, covered-helpers and a block-cases Change added. T1 redo, T2 redo, T3 redo.
Session 2026-10-19: resumed at T4; first message: "continue".

- [x] T1 Ship review checks assertions, case first: a built wishlist whose no-duplicates test only asserts that the second save does not throw; baseline, then the review prompt's question, the verification line and a red flag in spec-ship -> tests-prove-claims, weak-test-stays, covered-helpers
  - note: baseline 2 runs: the reviewer noticed the weak assertion in both, and one run rewrote the test at ship (0.8); with the rule 2 of 2 at 1.00, test untouched (D3).
  - redo: claims split and covered-helpers added; the fixture gains a keyFor helper with an unlabeled test, the weak-test graders require a negation and the exact test line, and step 6 says a helper of covered code stays. After the second review the helper moved to its own case, keeps-a-covered-helper, and the weak-test graders compare the whole test file.
- [x] T2 Supporting tests carry no reference, case first: build T2 and a test of the Map helper; baseline, then the verification line and a red flag in spec-build, and the README sentences -> supporting-tests
  - note: first baseline run stopped and quoted "every test needs a claim reference" as the obstacle; with an internal-only helper the baseline passed 2 of 2, so the case is the guard. With the rule 2 of 2 at 1.00.
  - redo: graders anchored to test names, and the claim-format line in docs-conventions/SKILL.md says a claim's test carries the reference. 2 of 2 at 1.00.
- [x] T3 The block's two exceptions, by-hand first: on scrubjay-example, ask the doubt question and the mismatch question without the change on Claude Code; then the block line; rerun on Claude Code and Codex and record the transcripts -> verifies-on-doubt, names-the-mismatch
  - note: before, both agents read the code on the doubt question but answered the mismatch from the docs alone, Claude citing the block rule; after, both pass both checks and offer a fix spec. Codex exec needs stdin closed when run from a script.
  - redo: the doubt question states a doubt without "check", rerun before and after on both agents; answers-from-docs rerun against the new block as the control; the protocol drops the no-edit fail condition and notes Codex stdin. Doubt passed before and after on both agents; mismatch and control pass after. A wording without the report trigger lost Codex on the mismatch (D6); the final text passes all six.
- [x] T4 Rerun every spec-ship and spec-build case three times with the baseline arm -> check: exit 0
  - note: 14 of 14 build and 11 of 11 ship cases at 1.00 after the final text; nine cases errored on a session limit and were rerun the same day at exit 0. About $55 of eval runs over two review rounds.
