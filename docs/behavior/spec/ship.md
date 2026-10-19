---
capability: spec/ship
---
# Ship a spec

- spec-ship runs the project's test command and stops when it fails {#runs-tests}
  e.g. one failing test -> no docs change, and the failure is reported
- spec-ship does not ship a feature, or a fix that changes behavior, without a recorded go {#ships-with-go}
  e.g. a fix with a claim under Change and no `approved` line -> "The owner of returns/submit-return hasn't said go"
- A fresh reviewer that did not write the code compares the diff with `spec.md` and with plan.md's file list, and its findings go into the PR description {#fresh-review}
  e.g. a file changed outside the plan -> listed as a finding
- The fresh reviewer reads the assertions of each test carrying a claim reference and reports one whose assertions do not prove its claim {#tests-prove-claims}
  e.g. `keeps one entry [wishlist/save-item#no-duplicates]` only asserts that the second save does not throw -> listed as a finding: the test does not prove no-duplicates
- A test the review reports as weak is left unchanged at ship, for the owner to fix before the merge {#weak-test-stays}
  e.g. the weak no-duplicates test -> the test file is the same after spec-ship, and the Review says what the test lacks
- A helper that the code of a covered claim calls is covered by that claim, and neither it nor an unlabeled test of it is removed at ship {#covered-helpers}
  e.g. `keyFor`, called by `save`, with a test named `keyFor prefixes the customer id` -> both stay, and the Review lists no removal
- The fresh reviewer reads `architecture/conventions.md` and `architecture/invariants.md` beside the spec and the plan, and reports anything in the diff that breaks a rule in them {#reviews-against-conventions}
  e.g. conventions.md says errors thrown from `src/` are `ShopError`, and the new `save` throws a bare `Error` -> listed in the Review as a convention finding, naming the rule and the line
- Code the review reports as breaking a convention is left unchanged at ship, for the owner to fix before the merge {#convention-finding-stays}
  e.g. the bare `Error` in `save` -> `src/wishlist.ts` is the same after spec-ship, and the Review says which rule it breaks
- spec-ship copies the claims in `spec.md` into `behavior/` without rewording, applying each Add, Change and Remove {#updates-behavior}
  e.g. the wishlist ships -> `behavior/wishlist/save-item.md` holds exactly the three claims from the spec
- spec-ship updates the architecture files plan.md lists, from the reference files it names, and adds a domain row to `index.md` only when one is still missing {#updates-architecture}
  e.g. plan.md lists `data-model.md, from reference/data-model.md` -> `architecture/data-model.md` holds the wishlist table, and the reference file is unchanged
- spec-ship sets the status to shipped inside the same pull request {#sets-shipped}
  e.g. the PR merges -> code, docs and `status: shipped` land on main together
- spec-ship asks whether to create the PR or show its title and description to paste. Without `gh` it shows them. The title is `type(scope): objective`: the kind as type, `refactor` for a fix with no behavior change, the issue key or else the slug as scope, and the spec's title as objective. spec-ship never merges {#pr-choice}
  e.g. "show" chosen -> `feature(HUB-123): Add wishlist`, or `feature(add-wishlist): Add wishlist` without a ticket, and the description, ready to paste
- The PR description fills the repo's own pull request template when it has one, and otherwise spec-ship's: Links, the ticket and the spec; Description, the why and the claims added, changed or removed; Unrelated changes, the files changed outside plan.md or `None.`; Release impact, derived from the kind and the claims and confirmed by the user; Review, the fresh reviewer's findings; Outcome {#pr-template}
  e.g. a feature with `issue: HUB-123` -> `- **Jira:** [HUB-123: Add wishlist](https://example.atlassian.net/browse/HUB-123)`, `**Release impact:** MINOR`, and `None.` under Unrelated changes
- The PR description states how many sessions the spec took, how many the user says needed re-explaining, what changed between the request and the shipped claims, and what became of each line in `reference/follow-ups.md`: kept for a spec or dropped {#reports-outcome}
  e.g. spec-ship asks "Which of the 4 sessions needed re-explaining, and which follow-ups get a spec?" -> `Sessions: 4, re-explained: 0. Grilling added guest saving and kept sharing out. Follow-ups: share by link, kept for a spec; price alerts, dropped.`
- spec-ship removes code the diff has that no claim covers, unless the owner adds a claim for it and says go, and the pull request names what was removed or claimed {#no-uncovered-code}
  e.g. an exported `clearWishlist` with a test that carries no claim reference -> deleted before any docs change, and listed under Review as removed
