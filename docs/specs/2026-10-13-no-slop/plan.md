---
spec: 2026-10-13-no-slop
---
## Approach
Two rules, each proven by a case first. spec-ship gets a step between the fresh review and the docs: for each finding of behavior no claim covers, remove the code or, when the owner says so, add the claim with a new go, then run the tests again; the pull request's Review section names each one as removed or claimed. docs-conventions gets a short Writing section, in our words, with the rules a spec, a decision or a pull request needs and nothing a rubric would add; stop-slop is credited for the mechanics. The version goes to 0.1.1 in both manifests so Claude Code users receive it.

## Files
```
plugin/skills/spec-ship/SKILL.md                       changed: the remove-or-claim step, a red flag, the Review line
plugin/skills/docs-conventions/SKILL.md                changed: a Writing section
plugin/evals/spec-ship/removes-uncovered-code/         new: a fixture with an uncovered helper, the prompt, the graders
plugin/evals/docs-conventions/writes-plain/            new: a Why written from a rambling request, graded on tells and length
plugin/CREDITS.md                                      changed: stop-slop
plugin/plugin.json, plugin/.claude-plugin/plugin.json  changed: version 0.1.1
```

## Architecture to update at ship
- conventions.md, from this plan: every released change bumps the version (D62), and the Writing rules apply to the pack's own files

## Risks
- The writing case passes without the rule, since models often write a clean Why unprompted. The baseline arm of the case shows whether the rule earns its place; a case that fails only on wording would be dropped, not loosened.
- Removing code at ship can break a test that covered it. The step runs the tests again after the removal and stops on red, as the ship always does.
