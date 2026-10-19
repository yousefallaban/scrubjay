---
spec: 2026-10-19-claim-evidence
---
## Approach
Seven claims, each proven by an eval case or a by-hand check written before its rule. spec-ship's review prompt gains one question, whether the assertions of each test carrying a claim reference prove that claim; the answer joins the Review section, the test stays as it is, and step 6 says a helper that covered code calls is covered. spec-build's verification says a claim's test carries its reference and a supporting test carries none, with a red flag for forcing a label onto a helper test. The AGENTS block's answer rule gains its two exceptions: a question about the code or a doubt about a claim is answered from the code with the claim beside it, and a disagreement is stated as documented versus observed with the fix spec named or offered. The two block claims get a by-hand protocol next to answers-from-docs, run on Claude Code and Codex. The READMEs say a claim's test carries its reference. The version stays 0.2.0 (D1).

## Files
```
plugin/skills/spec-ship/SKILL.md                             changed: the review prompt asks whether each claim's test proves it; verification; red flag
plugin/skills/spec-build/SKILL.md                            changed: the verification line on test names; a red flag for a forced label
plugin/skills/docs-conventions/assets/agents-block.md        changed: the answer rule's two exceptions
plugin/evals/spec-ship/flags-a-weak-claim-test/              new: the no-duplicates test only asserts that the second save does not throw; graded on the Review naming it as weak and the test file unchanged
plugin/evals/spec-ship/keeps-a-covered-helper/                new: a keyFor helper behind save with an unlabeled test; graded on the helper and its test kept at ship
plugin/evals/spec-build/leaves-a-helper-test-unlabeled/      new: T2 plus a test of the Map helper; graded on the claim test carrying its reference and the helper test carrying none
checks/by-hand/verifies-on-doubt.md                          new: the protocol and record for verifies-on-doubt and names-the-mismatch
checks/by-hand/transcripts/                                  changed: the transcripts of those runs
README.md, plugin/README.md                                  changed: a claim's test carries its reference
plugin/skills/docs-conventions/SKILL.md                      changed: the claim-format line says a claim's test carries the reference
checks/by-hand/answers-from-docs.md                          changed: Codex stdin note, and a control run against the new block
```

## Risks
- The weak-test ship case may pass in the baseline arm when the reviewer notices the assertion on its own; it then stays as the guard, a case that passes in both arms and catches a regression.
- The helper-test build case may pass in both arms when the agent already leaves helper tests unlabeled; the baseline arm decides whether the rule or the case changes.
- The block claims cannot be graded by the eval runner, which loads no project instructions; the by-hand record, one run per agent, is their evidence, as for answers-from-docs.
