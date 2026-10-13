---
capability: docs/map
---
# Map a domain

- docs-map documents one domain the user names, never the whole app, and adds that domain's row to `index.md` when it is missing {#one-domain}
  e.g. "map returns" -> drafts for `behavior/returns/` only, and a `returns` row in `index.md`
- docs-map reads that domain's code and drafts 3 to 7 claims per capability, each with an example {#drafts-claims}
  e.g. returns -> `submit-return.md` with a claim for partial refunds
- docs-map writes only the architecture area files and glossary terms that the domain needs {#only-what-it-needs}
  e.g. returns call a payment provider -> `integrations.md` gets a row, and `config.md` is not created
- docs-map writes nothing until the domain's owner confirms the drafts {#owner-confirms}
  e.g. the owner corrects a claim -> the corrected text is what gets written
- docs-map reads old Spec Kit, OpenSpec or Kiro specs for the domain as input and never edits them {#reads-old-specs}
  e.g. `openspec/specs/returns/` exists -> its rules show up as draft claims for the owner to confirm
