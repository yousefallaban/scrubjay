---
spec: 2026-10-19-plan-keeps-size
---
## Approach
Six claims, each proven by an eval case written before its rule. spec-build gains the reopen rule in its recheck and polish steps with a red flag, and its scope ask reads the plan's Scope. The plan template, reference and charter row define Scope as folders or files with one reason each, a folder covering everything under it, with a Files heading in an older plan read the same way. spec-plan writes it, spec-ship's review and PR layout name changes outside it. Every eval fixture's plan carries the new heading, two cases prove the ask and the silence, and one proves the reopen. The version goes to 0.4.0 (D3).

## Scope
```
plugin/skills/spec-build/SKILL.md                        changed: the reopen rule in steps 9 and 10 with a red flag; step 7 and the verification read Scope
plugin/skills/spec-plan/SKILL.md                         changed: step 5 writes Scope as folders or files
plugin/skills/spec-ship/SKILL.md                         changed: step 5 and the PR layout name changes outside Scope
plugin/skills/docs-conventions/SKILL.md                  changed: the charter row for plan.md
plugin/skills/docs-conventions/references/plan.md        changed: the Scope section's rules
plugin/skills/docs-conventions/assets/plan.md            changed: the Scope section
plugin/skills/docs-conventions/assets/agents-block.md    changed: the recheck line says Scope; the four block-driven claims are untouched by it
plugin/skills/docs-conventions/references/tasks.md       changed: the recheck sentence says Scope
plugin/evals/spec-build/reopens-a-ticked-task/           new: T2 ticked, a request to do its list differently; graded on T2 reopened with a redo line and no new task
plugin/evals/spec-build/writes-inside-scope/             new: the plan lists src/wishlist/ as a folder and T2 needs a new file under it; graded on the file written and the plan unchanged
plugin/evals/spec-build/asks-before-out-of-plan-file/    changed: the fixture's plan uses the Scope heading and the grader reads the new question
plugin/evals/spec-plan/writes-plan-and-tasks/            changed: the plan-shape grader expects Scope
plugin/evals/*/*/fixture.sh, checks/fixture-webshop.sh   changed: the Files heading becomes Scope in every fixture plan
AGENTS.md                                                changed: the changing-course line names the plan's Scope
plugin/plugin.json, plugin/.claude-plugin/plugin.json    changed: version 0.4.0
```

## Risks
- The reopen case may pass in the baseline arm when the agent treats the request as a polish already; it then stays as the guard against the "new task" choice.
- A grader that reads the scope question from the trace matches the skill's own text; the inside-scope case grades files instead, the written helper and the unchanged plan.
