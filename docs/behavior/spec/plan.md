---
capability: spec/plan
---
# Plan a spec

- spec-plan does not plan a feature until the owner's go is recorded {#needs-go}
  e.g. a draft feature spec -> spec-plan says the go is missing and stops
- spec-plan writes `plan.md` with the approach, the files to touch with a one-line reason each, and the architecture files spec-ship updates, each with the reference file it comes from {#writes-plan}
  e.g. the wishlist -> four files listed, and `data-model.md, from reference/data-model.md` under Architecture to update at ship
- spec-plan writes `tasks.md`, where each task fits one session and names the claim IDs, or the check, that prove it done {#writes-tasks}
  e.g. `- [ ] T1 Wishlist table and API -> saves-item, no-duplicates`
- Working material goes into `reference/`, and each file opens with a line saying what it is {#reference-files}
  e.g. a data model sketch -> `reference/data-model.md` starting with `Purpose: draft data model for the wishlist.`
- spec-plan shows the plan and tasks and waits for an OK before any code is written {#waits-for-ok}
  e.g. the user asks for a smaller T1 -> tasks are updated and shown again
