---
spec: 2026-10-18-mid-build-changes
---
## Approach
Five rules, each proven by an eval case written before the rule. spec-build gets a second door next to change of course: polish, which reopens one task with a `redo:` line and writes nothing above the tasks. The change-of-course step writes the recheck line with changed tasks only and keeps every edited claim one sentence. The reference rules say a reference file is state, replaced not appended, with `reference/decisions.md` the one exception, and name `reference/follow-ups.md` for changes the user defers. The plan rules say Approach is shape only. spec-ship asks about the follow-ups in its one outcome question and writes the answers into the PR's Outcome. The version goes to 0.2.0 in both manifests.

## Files
```
plugin/skills/spec-build/SKILL.md                          changed: step 9 split into change of course and polish, the one-sentence rule for edited claims, the deferred follow-up line, red flags, description
plugin/skills/spec-ship/SKILL.md                           changed: step 10 asks about follow-ups, the Outcome line names them, verification
plugin/skills/docs-conventions/references/tasks.md         changed: the recheck line names changed tasks only; a polish writes a redo line and no recheck line
plugin/skills/docs-conventions/references/reference.md     changed: a reference file is state, decisions.md is appended, follow-ups.md named
plugin/skills/docs-conventions/references/plan.md          changed: Approach is shape only; sizes and values go to reference/
plugin/skills/docs-conventions/assets/tasks.md             changed: the rules comment says the same
plugin/evals/spec-build/redoes-a-polish-request/           new: T2 ticked, "footer padding 12px"; graded on T2 unticked with a redo line, no Rechecked line, Approach unchanged
plugin/evals/spec-build/rechecks-after-change/graders/     changed: the Rechecked line carries no "keep"; the spec gains a fourth claim
plugin/evals/spec-build/replaces-a-reference-run/          new: a second run of browser checks; graded on the first run's sentence gone and the new one present
plugin/evals/spec-build/records-a-deferred-follow-up/      new: "share by link, later"; graded on reference/follow-ups.md and an unchanged spec
plugin/evals/spec-ship/settles-follow-ups/                 new: a built spec with two follow-ups; graded on the Outcome naming both with their answers
plugin/skills/docs-conventions/assets/agents-block.md      changed: the block names the polish next to the recheck
AGENTS.md, README.md, plugin/README.md                     changed: the polish and the deferred follow-up named where the recheck is
plugin/plugin.json, plugin/.claude-plugin/plugin.json      changed: version 0.2.0
SECURITY.md                                                changed: the maintained version line follows the manifests
```

## Risks
- A polish case may pass without the rule when the agent reopens the task on its own. The baseline arm decides; a case that passes in both arms stays as the guard, as the sessions spec did.
- The reference case grades on the first run's sentence being gone. The fixture's sentence names a failure the rerun fixes, so a faithful update removes it and an append keeps it.
