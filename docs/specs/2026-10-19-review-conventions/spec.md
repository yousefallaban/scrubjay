---
id: 2026-10-19-review-conventions
kind: feature
status: draft
summary: "The ship review also reports what in the diff breaks a rule in architecture/conventions.md or invariants.md, and leaves the fix to the owner"
request: "A third reviewer's findings, relayed by Yousef on 2026-10-19: the fresh review compares the diff with the spec and the plan only, so a change can satisfy every claim and still break a project rule; review both"
approved: {by: yousef, via: in session}
---
# Review the diff against the project's conventions

## Why
The fresh reviewer at ship is told what to report, and every item is about the spec and the plan: claims without a test, weak tests, uncovered behavior, files outside the plan, contradictions. A change can satisfy every claim and still throw a bare `Error` where `architecture/conventions.md` names the project's error class, or cross a rule in `architecture/invariants.md`, and nothing at ship reports it. Those two files hold exactly the rules agents get wrong without being told, and the review is the one step where a context that did not write the code reads the diff. A reviewer found the gap on 2026-10-19.

## What changes

### Add · spec/ship
- The fresh reviewer reads `architecture/conventions.md` and `architecture/invariants.md` beside the spec and the plan, and reports anything in the diff that breaks a rule in them {#reviews-against-conventions}
  e.g. conventions.md says errors thrown from `src/` are `ShopError`, and the new `save` throws a bare `Error` -> listed in the Review as a convention finding, naming the rule and the line
- Code the review reports as breaking a convention is left unchanged at ship, for the owner to fix before the merge {#convention-finding-stays}
  e.g. the bare `Error` in `save` -> `src/wishlist.ts` is the same after spec-ship, and the Review says which rule it breaks

## Not doing
- A second reviewer for standards: the two-reviewer split some packs use exists to keep each context clean, and a fresh sub-agent already is one, so it reads two more files.
- Reading every architecture file: stack, boundaries, data-model, contracts, integrations and config describe the current state; conventions and invariants hold the rules.
- Repairing a convention break at ship, or stopping the ship on one: shipping builds nothing, and the owner decides, as for a weak test.
- A conventions step in spec-build: the check belongs to the one step where a context that did not write the code reads the diff.
- The other five proposals from the same review, skill compatibility, impact and preservation, an investigation path, task slicing and PR evidence: parked, none with an observed failure, and task slicing is already what `-> claim IDs` on every task gives.
- A version bump: this ships inside 0.2.0 with pull requests 6 and 7, by Yousef's call.
