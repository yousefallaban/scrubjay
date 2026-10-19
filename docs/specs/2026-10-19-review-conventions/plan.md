---
spec: 2026-10-19-review-conventions
---
## Approach
Two claims, proven by one eval case written before the rule. spec-ship's review prompt in step 5 gains `architecture/conventions.md` and `architecture/invariants.md` as inputs and one item to report, a break of a rule in them; the finding joins the Review section beside the claim findings, and the code stays as it is, as a weak test does. The PR layout's Review placeholder, the Verification and two red flags say the same. The READMEs say the review compares the diff with the spec and the project's conventions. The version stays 0.2.0 (D1).

## Files
```
plugin/skills/spec-ship/SKILL.md                          changed: step 5 reads the two rule files and reports a break; Review placeholder; verification; two red flags
plugin/evals/spec-ship/reports-a-convention-break/        new: a built wishlist whose save throws a bare Error against a conventions.md rule naming ShopError and stores an unchecked id against an invariants.md rule; graded on the Review naming both beside the wishlist and on src/wishlist.ts unchanged
README.md, plugin/README.md                               changed: the review compares the diff with the spec and the project's conventions
```

## Risks
- The case may pass in the baseline arm when the agent reads conventions.md on its own through index.md and reports the bare Error; it then stays as the guard. An agent that repairs the Error instead fails the unchanged-file grader, which is the claim's point.
- The reviewer may call the throw behavior no claim covers and remove it, which would fail the unchanged-file grader for the wrong reason; the fixture spec carries a claim and a test for the refused save, so the throw is covered code with a convention break.
