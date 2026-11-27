---
id: 2026-11-27-plan-shows-design
kind: feature
status: building
summary: "The plan opens with a short part the owner reads to say OK: the approach, the contracts that change as code, the dependencies that change as one diagram, and each choice the agent made for the owner"
approved: {by: yousef, via: in session}
request: "Yousef, on 2026-11-27, after reading the specs of a real project built with the pack and another team's design guide: the plan gets his OK without showing the architecture; he wants the contracts, the diagram and the architecture in view before any code, and no big file to read without a real benefit"
---
# Show the design in the plan

## Why
In a project built with the pack, every feature had a plan and the owner's OK, and no plan showed a contract or a dependency. A plan was a few lines of approach and a table of up to 25 paths, so the OK covered a file list. The design, who owns what, which module depends on which and which types change, went to free-format `reference/` files, 494 lines in one spec and 13 in another, or was written only when the request asked for it. The owner found the architecture in the code, after it was built, and corrected it there.

## What changes

### Change · spec/plan
- spec-plan writes `plan.md` in two parts, first what the owner reads to say OK, then what the agent builds from: the Scope as the folders or files the change may land in, each with a one-line reason, and the architecture files spec-ship updates, each with the plan section or the reference file it comes from {#writes-plan}
  was: spec-plan writes `plan.md` with the approach, the Scope as the folders or files the change may land in, each with a one-line reason, and the architecture files spec-ship updates, each with the reference file it comes from
  e.g. the wishlist plan -> Approach, Contracts, Dependencies and Picks first, then `src/wishlist/  new: the module and its tests` and `src/index.ts  changed: export the module` under Scope

### Add · spec/design
- The part of the plan the owner reads holds the approach, the contracts, the dependencies and the picks, in about 40 lines at most {#owner-part}
  e.g. the wishlist plan -> 31 lines above the Scope; a change inside one module with no new contract -> Approach and Picks only, 9 lines
- The plan shows every contract the change adds or alters, which is what another module or system calls or reads, as code in the project's language, changed members only {#shows-contracts}
  e.g. the wishlist adds `saveItem(customerId: string, productId: string): Promise<Wishlist>` and a `Wishlist` type -> both are in one code block under Contracts; the unchanged `Product` type and the private `keyFor` helper are not
- When the change adds or alters a dependency between modules, the plan shows the dependencies as one mermaid flowchart of about ten nodes at most {#shows-dependencies}
  e.g. the wishlist starts to read prices from the catalog -> a `flowchart LR` holding `wishlist --> catalog`; a change that adds no dependency -> no Dependencies heading
- The plan lists every choice the agent made for the owner, one line each: the choice, the alternative and the reason {#lists-picks}
  e.g. `A list stored on the server over local storage, because it follows the customer across devices`
- Nothing the owner has to agree to is only in `reference/` {#agreed-design-in-plan}
  e.g. a 200-line data model sketch in `reference/data-model.md` -> the two types that change are under Contracts, and the OK does not depend on reading the sketch
- A fix whose build would add or alter a contract or a dependency between modules gets a plan with the owner's part and waits for the OK before any code {#fix-with-design-gets-plan}
  e.g. `spec-start move the price lookup from the wishlist into the catalog` as a fix -> `plan.md` with Contracts and Dependencies is shown, and no code is written before the OK; a typo fix -> one pass and no plan

### Add · spec/build
- spec-build asks before adding or altering a contract, or a dependency between modules, that the plan does not show {#stays-in-design}
  e.g. T3 needs `removeItem` exported from the wishlist, and Contracts shows only `saveItem` -> "This contract is not in the plan. Add it?", and on yes it is added under Contracts before the code

### Change · spec/ship
- spec-ship updates the architecture files plan.md lists, from the plan section or the reference file each entry names, and adds a domain row to `index.md` only when one is still missing {#updates-architecture}
  was: spec-ship updates the architecture files plan.md lists, from the reference files it names, and adds a domain row to `index.md` only when one is still missing
  e.g. plan.md lists `boundaries.md, from Dependencies` -> `architecture/boundaries.md` holds `wishlist -> catalog`, and plan.md is unchanged

### Add · spec/ship
- The fresh reviewer reports a contract or a dependency between modules that the diff holds and the plan does not show, and one the plan shows that the diff lacks {#reviews-against-design}
  e.g. the diff exports `clearWishlist` and Contracts never shows it -> the finding names `clearWishlist` and the plan section, beside the changes outside the Scope

## Not doing
- No new document and no new skill. The design is part of `plan.md`.
- No sequence diagram, no flowchart of behavior, no observability table and no critical-code section in this version.
- No second grilling skill and no fixed summary after a grill.
- No change to `spec.md`. Its claims stay the record of what the product does.
- No new line in the AGENTS.md block. The design check is spec-ship's, so no project has to rerun docs-init for it.
- A design finding does not stop the ship. Like a change outside the Scope it is reported, and the owner says fix or go on.
