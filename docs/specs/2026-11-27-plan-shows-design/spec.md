---
id: 2026-11-27-plan-shows-design
kind: feature
status: shipped
summary: "The plan opens with the part the owner reads to judge the design: the approach in plain words, the contracts that are new or change shape as code, and a diagram when a picture helps"
request: "Yousef, on 2026-11-27, after reading the specs of a real project built with the pack and another team's design guide: the plan gets his OK without showing the architecture; he wants the contracts, the diagram and the architecture in view before any code, and no big file to read without a real benefit"
approved: {by: yousef, via: in session}
---
# Show the design in the plan

## Why
In a project built with the pack, every feature had a plan and the owner's OK, and no plan showed a contract or a dependency. A plan was a few lines of approach and a table of up to 25 paths, so the OK covered a file list. The design, who owns what, which module depends on which and which types change, went to free-format `reference/` files, 494 lines in one spec and 13 in another, or was written only when the request asked for it. The owner found the architecture in the code, after it was built, and corrected it there.

## What changes

### Change · spec/plan
- spec-plan writes `plan.md` in two parts: first what the owner reads to say OK, then what the agent builds from, which is the Scope and the architecture files spec-ship updates, each with the plan section or the reference file it comes from {#writes-plan}
  was: spec-plan writes `plan.md` with the approach, the Scope as the folders or files the change may land in, each with a one-line reason, and the architecture files spec-ship updates, each with the reference file it comes from
  e.g. the wishlist plan -> Approach and Contracts first, then the Scope and `data-model.md, from Contracts`

### Add · spec/plan
- The Scope is a tree with one path per line: a shared folder is written once, and each line has a mark for new, changed or deleted and a reason of a few words {#scope-as-tree}
  e.g. `src/` on the first line, then under it `wishlist/   + the module and its tests` and `index.ts   ~ export the module`

### Add · spec/design
- The owner's part of the plan holds the approach, a diagram when one helps, and the contracts {#owner-part}
  e.g. the wishlist plan -> Approach, How it works and Contracts above the Scope; a change inside one module with no new contract -> Approach only
- A decision that changes what a user sees or can do, crosses a boundary, or removes something is a line in the Approach {#approach-is-complete}
  e.g. the wishlist is for signed-in customers only, and the old "favourites" page is deleted -> each is its own line in the Approach; the name of an internal helper is not
- The plan shows a contract as code, under a plain label, only when it is new or its shape changes and it crosses a boundary: between modules, between the product and the outside, or something shared that other code already uses {#shows-contracts}
  e.g. the wishlist offers `saveItem(customerId, productId)` to the checkout -> shown under "What the wishlist offers to the checkout"; its own `keyFor` helper, the unchanged `Product` type and a helper that only moves to another folder are not shown as code
- Where the plan rests on something the agent could not read from the code or the docs, it says so at that place, with the words "Not checked" {#marks-guesses}
  e.g. "The wishlist reads prices from the catalogue's existing request. **Not checked:** that it returns the sale price." and, in a contract, `price: number  // not checked: in cents`
- The plan holds a diagram only when a picture explains the change faster than text: its kind fits the case, steps are numbered where there is an order, and every arrow has a plain label {#draws-when-it-helps}
  e.g. the checkout, the wishlist and the catalogue work together to save an item -> a sequence of four numbered steps; a change inside one module -> no diagram
- Nothing the owner has to agree to is only in `reference/` {#agreed-design-in-plan}
  e.g. a 200-line data model sketch in `reference/data-model.md` -> the two types that change are under Contracts, and the OK does not depend on reading the sketch

### Add · practice/docs-conventions
- Text the owner has to read to decide is written so they can judge it: one complete fact per line, in product words, with a code name only where it is needed to find the thing {#written-to-judge}
  e.g. "The page that lists all products loads the full list and sorts it by name", not "The catalogue view reuses the list read"

### Add · spec/build
- A fix whose build would add or alter a contract or a dependency between modules is planned first, and no code is written before the owner's OK {#fix-with-design-gets-plan}
  e.g. `spec-start move the price lookup into a pricing module` as a fix -> `plan.md` with Contracts is shown, and no code is written before the OK; a typo fix -> one pass and no plan

### Change · spec/ship
- spec-ship updates the architecture files plan.md lists, from the plan section or the reference file each entry names, and adds a domain row to `index.md` only when one is still missing {#updates-architecture}
  was: spec-ship updates the architecture files plan.md lists, from the reference files it names, and adds a domain row to `index.md` only when one is still missing
  e.g. plan.md lists `contracts.md, from Contracts` -> `architecture/contracts.md` holds `saveItem`, and plan.md is unchanged

## Not doing
- No new document and no new skill. The design is part of `plan.md`.
- No list of the choices the agent made. The Approach says what will be built, a real choice is asked before the plan is written, and a lasting one gets a decision record.
- No line limit as a test. An owner's part that does not fit on about two screens means the spec is too big.
- No fixed kind of diagram, and no diagram that only shows which module imports which.
- No stop in the build and no check at ship for code that leaves the agreed design. Both wait in `reference/follow-ups.md` until real use shows a build leaving it.
- The cases of this spec test the writing rule on `plan.md` only. `spec.md` and the questions the agent asks get their cases in `2026-11-27-ask-before-assuming`.
- No observability table, no critical-code section, no second grilling skill and no fixed summary after a grill.
- No new line in the AGENTS.md block, so no project has to rerun docs-init for this.
