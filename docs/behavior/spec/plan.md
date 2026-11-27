---
capability: spec/plan
---
# Plan a spec

- spec-plan does not plan a feature until the owner's go is recorded {#needs-go}
  e.g. a draft feature spec -> spec-plan says the go is missing and stops
- spec-plan writes `plan.md` in two parts: first what the owner reads to say OK, then what the agent builds from, which is the Scope and the architecture files spec-ship updates, each with the plan section or the reference file it comes from {#writes-plan}
  e.g. the wishlist plan -> Approach and Contracts first, then the Scope and `data-model.md, from Contracts`
- The Scope is a tree with one path per line: a shared folder is written once, and each line has a mark for new, changed or deleted and a reason of a few words {#scope-as-tree}
  e.g. `src/` on the first line, then under it `wishlist/   + the module and its tests` and `index.ts   ~ export the module`
- spec-plan writes `tasks.md`, where each task fits one session and names the claim IDs, or the check, that prove it done {#writes-tasks}
  e.g. `- [ ] T1 Wishlist table and API -> saves-item, no-duplicates`
- Working material goes into `reference/`, and each file opens with a line saying what it is {#reference-files}
  e.g. a data model sketch -> `reference/data-model.md` starting with `Purpose: draft data model for the wishlist.`
- spec-plan shows the plan and tasks and waits for an OK before any code is written {#waits-for-ok}
  e.g. the user asks for a smaller T1 -> tasks are updated and shown again
