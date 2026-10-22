---
capability: spec/ship
---
# Ship a spec

- spec-ship runs the project's test command and stops when it fails {#runs-tests}
  e.g. one failing test -> no docs change, and the failure is reported
- spec-ship does not ship a feature, or a fix that changes behavior, without a recorded go {#ships-with-go}
  e.g. a fix with a claim under Change and no `approved` line -> "The owner of returns/submit-return hasn't said go"
- A fresh reviewer that did not write the code compares the diff with `spec.md`, plan.md's Scope and the project's conventions, and reports its findings in the conversation, in the form the agent uses for a review; the pull request carries only the findings still open at the end {#fresh-review}
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
- After the docs commit, spec-ship asks whether to create the pull request or show its title and description to paste, and writes nothing of the pull request before the answer. Creating uses whatever GitHub access the agent has, `gh` or the app's own connection; with neither, it shows them. The title is `type(scope): objective`: the kind as type, `refactor` for a fix with no behavior change, the issue key or else the slug as scope, and the spec's title as objective. spec-ship never merges {#pr-choice}
  e.g. "create" -> the branch is pushed and the pull request is opened with the title and the description, its address as the last line; "show" -> both are printed to paste, and nothing else happens
- The PR description fills the repo's own pull request template when it has one, and otherwise holds the why in two lines, one line per claim added, changed or removed, the ticket link when the spec has an issue key, the spec as a link that opens on GitHub, the open findings with each removal in one line, the changes outside plan.md's Scope, and the release impact derived from the kind and the claims {#pr-template}
- spec-ship removes code the diff has that no claim covers, unless the owner adds a claim for it and says go, and the pull request names what was removed or claimed {#no-uncovered-code}
  e.g. an exported `clearWishlist` with a test that carries no claim reference -> deleted before any docs change, and listed under Review as removed
- A claim the diff contradicts, or a claim with no test carrying its reference, stops the ship before any docs change, naming the claim and the two ways on: fix, which reopens the task that built it, or a change to the claim with a new go {#stops-on-contract-break}
- After the review, spec-ship says which findings block and which are optional, suggests fix or leave for each optional one, and asks one question, fix, naming them, go on to the pull request, or stop; no code and no docs change before the answer {#asks-after-review}
- Saying fix on a finding reopens the task that built the code through spec-build, with a `redo:` line naming the finding, and the ship runs again after the tick {#fix-reopens-task}
- The docs the ship writes land in one commit, `docs: ship <slug>`, after any removal of uncovered code, which lands as its own commit, and the ship writes no file outside the repository {#ships-in-one-commit}
- Code from any source meets the same contract at ship: a change another review or tool made is covered by the claim whose code it serves or removed as uncovered, and that review's findings do not stand in for the fresh review {#any-source-same-contract}
