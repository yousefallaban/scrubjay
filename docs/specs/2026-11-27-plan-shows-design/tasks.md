---
spec: 2026-11-27-plan-shows-design
---
- [x] T1 The owner's part of the plan: cases first, shows-the-design and a contracts grader on writes-plan-and-tasks, run on the 0.5.0 skills as the baseline with the lines the owner reads recorded in reference/baseline.md; then the template, its rules, the charter row and spec-plan steps 4, 5 and 7 with the red flags -> writes-plan, owner-part, shows-contracts, shows-dependencies, lists-picks, agreed-design-in-plan
- [x] T2 A fix that changes the design is planned first: case first, plans-a-fix-that-moves-a-contract; then the gate in spec-plan and step 3 in spec-build -> fix-with-design-gets-plan
- [ ] T3 The build stays in the design: the plan in every fixture gains its Contracts; case first, asks-before-a-contract-outside-the-plan; then spec-build step 7 and its red flag -> stays-in-design
- [ ] T4 The ship checks the design: cases first, names-a-contract-outside-the-plan and updates-architecture-from-a-plan-section; then spec-ship step 5 and the architecture step -> reviews-against-design, updates-architecture
- [ ] T5 Version 0.6.0, both READMEs, a by-hand plan on scrubjay-example with Claude Code and Codex -> check: both manifests agree at 0.6.0, `sh checks/run.sh` exits 0, and dogfood.md has a row per agent with the lines the owner reads
- [ ] T6 Rerun every spec-plan, spec-build and spec-ship case three times with the baseline arm on the default model -> check: exit 0
