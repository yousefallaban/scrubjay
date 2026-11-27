---
capability: spec/design
---
# Show the design in the plan

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
