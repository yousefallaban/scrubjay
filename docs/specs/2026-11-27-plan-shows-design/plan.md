---
spec: 2026-11-27-plan-shows-design
---
## Approach
The plan template gets an owner's part above the Scope: Approach, How it works and Contracts. How it works is a diagram and is written only when a picture helps. Trade-offs goes: the Approach says what will be built, and a guess is marked where it appears with the words Not checked. Contracts holds only what is new or changes shape and crosses a boundary, one small code block per boundary under a plain label. The Scope becomes a tree. docs-conventions gains one rule for any text the owner reads to decide, and spec-plan applies it to the owner's part. spec-build plans a fix first when it would change a contract or a dependency. spec-ship may update an architecture file from a plan section. Each claim is proven by an eval case written before its rule. The draft template is in [reference/plan-template.md](./reference/plan-template.md). The version goes to 0.6.0.

## Trade-offs
- No section for choices, over a list in three lines each: in the second trial that list made the plans two to three times longer, and it repeated the Approach. A plan with Trade-offs stays valid.
- The owner's part is every line above Scope, over a wrapper heading: it costs no line, and a grader can find it.
- The writing rule is tested with what a grader can see, a bullet per fact in Approach, a label over each code block and no long prose line, over a judge model: the cases stay free to run and give the same verdict each time.
- The fix rule sits in spec-build and spec-plan, over spec-start: spec-start has not read enough code to know which contracts a fix touches.
- Fixtures keep their flat Scope lines, over rewriting 35 of them: the old format stays valid, and only new plans are written as a tree.

## Scope
```
plugin/skills/docs-conventions/assets/plan.md           changed: the owner's part, the diagram rule and the Scope tree
plugin/skills/docs-conventions/references/plan.md       changed: the rules for each section
plugin/skills/docs-conventions/references/reference.md  changed: what the owner agrees to is never only here
plugin/skills/docs-conventions/SKILL.md                 changed: the charter row for plan.md and the rule for text the owner reads
plugin/skills/spec-plan/SKILL.md                        changed: the gate for a fix, steps 4, 5 and 7, the verification and the red flags
plugin/skills/spec-build/SKILL.md                       changed: a fix that changes the design is planned first
plugin/skills/spec-ship/SKILL.md                        changed: an architecture file from a plan section
plugin/evals/spec-plan/                                 changed: the cases for the owner's part, the writing rule, the diagram and the tree
plugin/evals/spec-build/                                changed: the case for the planned fix
plugin/evals/spec-ship/                                 changed: the case for the plan-section source
checks/by-hand/                                         changed: a plan row per agent in dogfood.md
plugin/README.md, README.md                             changed: the spec-plan row says what the plan shows
plugin/plugin.json, plugin/.claude-plugin/plugin.json   changed: version 0.6.0
```

## Risks
- What crosses a boundary is the agent's judgment. In the trial two wordings gave five and six contracts for the same feature; a case pins one known contract present and one internal helper absent.
- "Written so the owner can judge" cannot be graded as such. The cases grade its visible signs, and a plan can pass them and still be hard to read; the by-hand row records what a person thought of it.
- Whether a diagram helps is a judgment. One case expects a diagram where three parts work together and one expects none for a change inside one module; nothing grades whether the picture is clear.
- A grader can pin the mermaid fence, numbered steps and labelled arrows, never that the diagram renders. Rendering is checked by hand.
- The proofs of T1 to T4 are by-hand runs on Sonnet, one or two per case. T6 is the first run of every case in the runner, three times on the default model, and can still show a case that passes only sometimes.
