---
capability: spec/start
---
# Start a spec

- spec-start creates `specs/<date>-<slug>/spec.md` and a branch named after the slug, starting from a sentence, a ticket, or commits already made, and records that start as `request:`, plus `issue:` with the ticket key when there is one {#creates-spec}
  e.g. `spec-start HUB-123 customers can save items to a wishlist` -> `specs/2026-10-12-add-wishlist/spec.md` on branch `add-wishlist`, with `request: customers can save items to a wishlist` and `issue: HUB-123`
- spec-start sets the kind, feature or fix. A feature is grilled and planned and needs the owner's go before planning. A fix takes the fast path and needs the owner's go before ship only when it changes behavior {#sets-kind}
  e.g. a dependency bump -> a fix with "No behavior change", no plan.md and no go; a wrong rounding -> a fix with one claim under Change, and the owner's go before ship
- spec-start settles why and what by grilling, and grilling ends when nothing is left that only the owner can answer {#grills}
  e.g. the wishlist -> rounds on who saves, duplicates and devices before any claim is written; the remaining questions are answerable from the code -> grilling stops and the agent looks them up
- For a fix, spec-start writes the spec in one pass and grills only on what is ambiguous {#fast-path}
  e.g. `spec-start partial refunds are one cent off` -> a fix spec in a few minutes, with one claim under Change
- spec-start writes What changes as claims under `Add`, `Change` and `Remove` headings. A Change has a `was:` line and a Remove has a `reason:` line {#what-changes-format}
  e.g. the refund fix -> `### Change · returns/submit-return` with the old text under `was:`
- When the spec touches a domain that has no behavior docs, spec-start offers to map that domain first {#offers-map}
  e.g. a spec on returns, with no `behavior/returns/` -> "Map returns first?"
- The owner who says go is the one `index.md` lists for the domain. spec-start adds the row for a new domain, with its owner, before any go is asked. When the owner is the user, their OK in session is the go {#owner-is-listed}
  e.g. the wishlist is a new domain -> spec-start asks who owns it and adds the row; a solo developer says "OK, go" -> `approved: {by: <user>, via: in session}`
- The owner's go is recorded only when the user reports one, as `approved: {by, via}`, and only once Open questions is empty {#records-go}
  e.g. "Sanne approved on Slack" plus a link -> `approved: {by: sanne, via: "<link>"}`
