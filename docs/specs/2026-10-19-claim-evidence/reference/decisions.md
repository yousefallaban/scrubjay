Purpose: lasting choices made while specifying and building claim-evidence, appended as they are made, never edited.

## D1 Stacked on feature/mid-build-changes, ships inside 0.2.0
2026-10-19. Yousef wants the three changes on the same version as the mid-build-changes spec, with no bump. Every released plugin change bumps the version (D62), so the only way to honor both is to land this spec inside the same release: the branch is cut from `feature/mid-build-changes`, and its pull request targets that branch, so pull request 6 carries both at 0.2.0. This departs from the rule to branch from the default branch, on the owner's call, for this spec only.

## D2 One spec for three findings from one review round
2026-10-19. The three changes are small, come from one review round, and two of them touch the same link between a test and its claim. One spec keeps the eval reruns and the stacked pull request together, as D5 of the mid-build-changes spec did for five rules.

## D3 A weak claim test is a finding, not a repair at ship
2026-10-19. When the fresh review finds a test that carries a claim reference but whose assertions do not prove the claim, spec-ship names it in the Review section and leaves the test file as it is. Shipping builds nothing, so the test is not rewritten there; the owner decides whether it is fixed before the merge. The eval case grades both: the Review names the test, and the test file is unchanged.

## D4 The review split fresh-review and added covered-helpers
2026-10-19. The fresh review found that the Change to `fresh-review` made the claim longer, which the pack's own one-sentence rule forbids, and that the test left unchanged at ship was behavior no claim stated. Two new claims replace the Change: `tests-prove-claims` and `weak-test-stays`. The review also found that the uncovered-code rule could remove a helper called by covered code together with its unlabeled test, the very test `supporting-tests` allows; `covered-helpers` says the helper is covered by the claim whose code calls it. The doubt question in the by-hand check said "check", so both agents read the code before the change and the baseline proved nothing; it became a plain doubt and both runs were repeated.

## D5 One rule per case, a whole-file grader, and the block keeps its default
2026-10-19. The second fresh review found the weak-test case carrying three claims, against this repo's rule that a case tests one rule, so `covered-helpers` got its own case. The weak-test graders compared one line and one assertion; they now compare the whole test file, which is what `weak-test-stays` promises. The block had lost the word "only" from its default, so it reads "open the code only to change it, or when" the user asks about the code or doubts a line; it says "a line in behavior/" instead of "claim", a word the block never defined. spec-ship no longer says it writes no code or tests, since step 6 deletes both; it says the weak test is not edited.

## D6 A report that differs from the docs is the third trigger to read the code
2026-10-19. With the default restored to "open the code only to change it" and two exceptions, a question about the code and a doubt, Codex answered the mismatch report from the docs again and did not open the code: a customer refunded 5.69 against a documented 5.70 is neither a question about the code nor a voiced doubt. The block now names a report that differs from behavior/ as the third trigger. Claude Code read the code under both wordings.
