---
id: 2026-10-22-ship-ends-clean
kind: feature
status: draft
summary: "spec-ship ends in the conversation: the review findings appear in the agent's own form, a contradicted or untested claim stops the ship, the docs land in one commit, and the pull request is created or shown only when asked, after one decision point on the findings"
approved: {by: yousef, via: in session}
request: "Yousef, on 2026-10-22, after shipping a real spec with canon: the review and the PR text were saved as files in a temp folder, the next step after the review was unclear, the PR description carried verification and workflow text a merger does not need, and he will keep running the agents' native reviews beside spec-ship"
---
# End the ship in the conversation

## Why
A real ship with the pack ended in two files in a temporary folder, the review report and the PR body, which the owner had to open to learn what the review found and what came next. The skill never asks for those files; it is silent on where findings go, and the agent's harness fills the silence. The PR description then carried the grilling story, the follow-ups settlement and the review's resolved findings, which the spec folder and git already hold. And a claim the diff contradicts is today a finding that the ship reports and then copies into `behavior/` as true, so the memory can assert what the code does not do.

## What changes

### Change · spec/ship
- A fresh reviewer that did not write the code compares the diff with `spec.md`, plan.md's Scope and the project's conventions, and reports its findings in the conversation, in the form the agent uses for a review; the pull request carries only the findings still open at the end {#fresh-review}
  was: A fresh reviewer that did not write the code compares the diff with `spec.md` and with plan.md's Scope, and its findings go into the PR description
  e.g. a weak test and an import reordered outside the Scope -> both appear in chat when the review ends, the PR names them under its open findings, and no report file is written anywhere
- The PR description fills the repo's own pull request template when it has one, and otherwise holds the why in two lines, one line per claim added, changed or removed, the ticket link when the spec has an issue key, the spec as a link that opens on GitHub, the open findings with each removal in one line, the changes outside plan.md's Scope, and the release impact derived from the kind and the claims {#pr-template}
  was: The PR description fills the repo's own pull request template when it has one, and otherwise spec-ship's: Links, the ticket and the spec; Description, the why and the claims added, changed or removed; Unrelated changes, the changes outside plan.md's Scope or `None.`; Release impact, derived from the kind and the claims and confirmed by the user; Review, the fresh reviewer's findings; Outcome
  e.g. the wishlist with a weak test left open -> `Open: test/wishlist.test.ts:22 asserts only that save does not throw`, `Removed at ship: clearWishlist, no claim`, `Release impact: MINOR`, and no Outcome section and no question about the impact
- After the docs commit, spec-ship asks whether to create the pull request with `gh` or show its title and description to paste, and writes nothing of the pull request before the answer. Without `gh` it shows them. The title is `type(scope): objective`: the kind as type, `refactor` for a fix with no behavior change, the issue key or else the slug as scope, and the spec's title as objective. spec-ship never merges {#pr-choice}
  was: spec-ship asks whether to create the PR or show its title and description to paste. Without `gh` it shows them. The title is `type(scope): objective`: the kind as type, `refactor` for a fix with no behavior change, the issue key or else the slug as scope, and the spec's title as objective. spec-ship never merges
  e.g. "create" -> the branch is pushed, `gh pr create` runs with the title and the description, and the PR address is the last line; "show" -> both are printed to paste, and nothing else happens

### Add · spec/ship
- A claim the diff contradicts, or a claim with no test carrying its reference, stops the ship before any docs change, naming the claim and the two ways on: fix, which reopens the task that built it, or a change to the claim with a new go {#stops-on-contract-break}
  e.g. `save()` writes to one shared list while `#per-customer` promises a list per customer -> "`#per-customer` is contradicted at src/wishlist.ts:41. No docs changed. Say fix to reopen T3, or change the claim in spec.md", and `status` and `behavior/` are unchanged
- After the review, spec-ship says which findings block and which are optional, suggests fix or leave for each optional one, and asks one question, fix, naming them, go on to the pull request, or stop; no docs change before the answer {#asks-after-review}
  e.g. a weak test and an import reordered outside the Scope -> "Nothing blocks. Optional: the weak no-duplicates test, suggest fix; the orders.ts import order, suggest leave. Fix which, go on to the PR, or stop?", and `behavior/` is untouched until the answer
- Saying fix on a finding reopens the task that built the code through spec-build, with a `redo:` line naming the finding, and the ship runs again after the tick {#fix-reopens-task}
  e.g. "fix the weak test" -> T2 is unticked with `redo: the no-duplicates test asserts one entry`, the test is rewritten, run red then green and ticked, and the ship starts over from the tests
- The docs the ship writes land in one commit, `docs: ship <slug>`, before the pull request, and the ship writes no file outside the repository {#ships-in-one-commit}
  e.g. `behavior/wishlist/save-item.md`, `architecture/data-model.md` and the shipped status -> one commit `docs: ship add-wishlist`, and no report or body file in any temp folder
- Code from any source meets the same contract at ship: a change another review or tool made is covered by the claim whose code it serves or removed as uncovered, and that review's findings do not stand in for the fresh review {#any-source-same-contract}
  e.g. a native code review added input validation to `save()` that no claim names -> it is removed at ship and named under Removed, and the fresh review still runs

### Remove · spec/ship
- The PR description states what changed between the request and the shipped claims, and what became of each line in `reference/follow-ups.md`: kept for a spec or dropped {#reports-outcome}
  reason: the spec folder holds the request and the claims, `follow-ups.md` holds its lines as deferred work, and the pull request repeats neither

### Add · docs/init
- The block tells a reviewer what a review on a spec branch checks: every claim has a test carrying its reference whose assertions prove it, nothing in the diff contradicts a claim, nothing lands outside plan.md's Scope, code no claim covers is removed at ship, and the rules in `architecture/conventions.md` and `invariants.md` hold {#block-names-review-checks}
  e.g. a rerun of docs-init after the update -> the block holds a Review paragraph with those five checks, where any reviewer that reads AGENTS.md finds them

## Not doing
- No format of the pack's own for findings: no labels, no numbering protocol, no confidence scores. The agent shows a review the way it always does.
- No call to a native review command such as `codex review` or `/code-review` from spec-ship. Parked until a by-hand run shows the contract checks survive inside one.
- No question per finding. The findings are shown once; fix is said in words.
- No screenshot handling. A repo template with a Screenshots section gets "attach by hand" and the local paths; no image is committed or uploaded.
- No question about release impact and none about follow-ups. The impact is derived; the follow-ups stay in their file.
