---
spec: 2026-11-27-plan-shows-design
---
- [x] T1 The owner's part of the plan: cases first, shows-the-design, draws-no-diagram-inside-one-module and a contracts grader on writes-plan-and-tasks; then the template, its rules, the rule for text the owner reads, the charter row and spec-plan steps 4, 5 and 7 with the red flags -> writes-plan, scope-as-tree, owner-part, approach-is-complete, shows-contracts, marks-guesses, draws-when-it-helps, agreed-design-in-plan, written-to-judge
- [x] T2 A fix that changes the design is planned first: case first, plans-a-fix-that-moves-a-contract; then the gate in spec-plan and step 3 in spec-build -> fix-with-design-gets-plan
- [x] T4 The ship takes an architecture file from a plan section: case first, updates-architecture-from-a-plan-section; then the architecture step in spec-ship -> updates-architecture
- [x] T5 Version 0.6.0, both READMEs, a by-hand plan on scrubjay-example with Claude Code and Codex -> check: both manifests agree at 0.6.0, `sh checks/run.sh` exits 0, and dogfood.md has a row per agent
- [ ] T6 Rerun every spec-plan, spec-build and spec-ship case three times with the baseline arm on the default model -> check: exit 0
