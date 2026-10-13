---
capability: practice/docs-conventions
---
# Keep the docs conventions

- Every file a command writes starts from its template, with the frontmatter and headings exactly as the template has them {#from-template}
  e.g. a new decision -> `Context`, `Options`, `Decision`, `Consequences`, in that order
- Project files contain no guidance comments and no empty sections. Optional sections are deleted, never filled with "None" or "TBD" {#no-placeholders}
  e.g. a plan with no rollout concerns -> no Rollout heading
- Each file holds only its own job, and content that belongs elsewhere goes to the file docs-conventions names for it {#one-job}
  e.g. a business rule found while writing `glossary.md` -> it becomes a claim in `behavior/`
- Claims follow the claim format, 3 to 7 per capability. Tests and tasks reference a claim by `capability#id` whenever the bare ID is not unique in the spec {#claim-format}
  e.g. `- Saving the same product twice keeps one entry {#no-duplicates}` with an `e.g.` line under it, referenced as `wishlist/save-item#no-duplicates`
- `index.md` records the docs-format version, and a template change applies to new files only {#docs-format}
  e.g. a template gains a section -> shipped specs are never rewritten
