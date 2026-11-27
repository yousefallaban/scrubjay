---
spec: 2026-11-27-plan-shows-design
---
## Approach
The plan template gains three sections between Approach and Scope: Contracts, Dependencies and Picks, and Picks takes the place of Trade-offs. Every line above Scope is what the owner reads, held to about 40 lines. spec-plan fills the sections from the code it reads and shows them before the OK, and the rule that sent design detail to `reference/` is turned around for what the owner has to agree to. spec-build gains two stops: a fix that would change a contract or a dependency is planned first, and a task asks before it leaves the Contracts or Dependencies the plan shows. spec-ship's reviewer gains one kind of finding, and an architecture entry may name a plan section. Each claim is proven by an eval case written before its rule, baseline first. The draft template is in [reference/plan-template.md](./reference/plan-template.md). The version goes to 0.6.0.

## Trade-offs
- Picks replaces Trade-offs, over keeping both: two headings for the same thing are more to read. A plan with a Trade-offs heading is read the same way.
- The owner's part is every line above Scope, over a wrapper heading: it costs no line, and a grader can count it.
- The fix rule sits in spec-build and spec-plan, over spec-start: spec-start has not read enough code to know which contracts a fix touches.
- Every fixture's plan gains a Contracts section, over a rule that skips older plans: one rule with no exception, and a plan written before 0.6.0 costs its project one question.

## Scope
```
plugin/skills/docs-conventions/assets/plan.md           changed: Contracts, Dependencies and Picks above Scope
plugin/skills/docs-conventions/references/plan.md       changed: the rules for the three sections and the owner's 40 lines
plugin/skills/docs-conventions/references/reference.md  changed: what the owner agrees to is never only here
plugin/skills/docs-conventions/SKILL.md                 changed: the charter row for plan.md
plugin/skills/spec-plan/SKILL.md                        changed: the gate for a fix, steps 4, 5 and 7, the verification and the red flags
plugin/skills/spec-build/SKILL.md                       changed: a fix that changes the design is planned first; the stop before leaving the design
plugin/skills/spec-ship/SKILL.md                        changed: the reviewer's design finding; an architecture file from a plan section
plugin/evals/spec-plan/                                 changed: new cases for the owner's part, and the plan-shape grader
plugin/evals/spec-build/                                changed: new cases for the planned fix and the stop
plugin/evals/spec-ship/                                 changed: new cases for the design finding and the plan-section source
checks/fixture-webshop.sh, plugin/evals/*/*/fixture.sh  changed: the plan in every fixture gains its Contracts
checks/by-hand/                                         changed: a plan row per agent in dogfood.md, with the lines the owner reads
plugin/README.md, README.md                             changed: the spec-plan row says what the plan shows
plugin/plugin.json, plugin/.claude-plugin/plugin.json   changed: version 0.6.0
```

## Risks
- A plan written before 0.6.0 shows no contracts, so its next task that exports something asks once. `stays-in-design` covers the question; the one-time cost is accepted.
- What counts as a contract is the agent's judgment. The case grades code under Contracts and the unchanged `Product` type absent from it, which pins the line at one point only; an internal helper has no name a grader can know in advance.
- A grader can pin the mermaid fence and one edge, never that the diagram renders. Rendering is checked by hand on the example repo.
- The 40 lines are graded as the lines between Approach and Scope. A plan can pass and still be padded; the by-hand row records what the owner actually had to read.
- The eval session has no shell, so the planned-fix case grades that plan.md exists and `src/` is unchanged, not that the build resumes after the OK.
