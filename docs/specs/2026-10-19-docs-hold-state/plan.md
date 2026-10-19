---
spec: 2026-10-19-docs-hold-state
---
## Approach
Seven claims, each proven by an eval case or the by-hand block check written before its rule. spec-build loses the session-line step and the recheck line, gains a tick step that removes the task's working lines and commits the task's files with the task line as the message, and says a redo line goes at the tick. The tasks template and reference drop the session and recheck lines and describe the tick. The block loses "Every session adds its line to tasks.md" and says the recheck rewrites the tasks in place. spec-ship's Outcome drops the two counts and the question about re-explained sessions. docs-conventions states the current-state rule for the spec folder. This repo's AGENTS.md, both READMEs and the by-hand protocol follow. The version goes to 0.3.0 (D4), and this spec's own tasks.md is written in the new shape (D5).

## Files
```
plugin/skills/spec-build/SKILL.md                        changed: no session step; tick step commits and clears the task's lines; recheck rewrites in place; verification and red flags
plugin/skills/spec-ship/SKILL.md                         changed: step 10 and the PR layout drop the session counts
plugin/skills/docs-conventions/SKILL.md                  changed: the spec folder holds the current state, git the history, decisions.md appends
plugin/skills/docs-conventions/references/tasks.md       changed: no session or recheck lines; lines under an open task go at the tick
plugin/skills/docs-conventions/assets/tasks.md           changed: the template's comment says the same
plugin/skills/docs-conventions/assets/agents-block.md    changed: no session line; the recheck rewrites the tasks in place
plugin/evals/spec-build/commits-at-tick/                 new: T2 built and ticked in a session that cannot run commands; graded on the commit the agent says it would make, with the task line
plugin/evals/spec-build/clears-lines-at-tick/            new: T2 carries a note and a handoff line; graded on both gone at the tick and the task ticked
plugin/evals/spec-build/rechecks-after-change/           changed: graders require the list rewritten in place and no recheck line
plugin/evals/spec-build/resumes-from-tasks/              changed: the fixture has no session lines and no grader expects one
plugin/evals/spec-ship/settles-follow-ups/               changed: the Outcome grader expects no session count
plugin/evals/spec-ship/ships-and-updates-behavior/       changed: the Outcome grader expects no session count
checks/by-hand/resumes-and-session-line.md               changed: becomes the resumes check; reruns on both agents under the new block
checks/by-hand/transcripts/                              changed: the transcripts of those runs
AGENTS.md                                                changed: the session and changing-course lines of How to work
README.md, plugin/README.md                              changed: the lines on resuming and on plans changing mid-build
plugin/plugin.json, plugin/.claude-plugin/plugin.json    changed: version 0.3.0
```

## Risks
- The commit case cannot run git in the eval sandbox, so it grades what the agent says it would commit; the by-hand resumes check on a real repo is where a real commit is seen.
- Fixtures across both suites carry session lines in their tasks.md from the 0.2.0 shape; a case passes with them present, since no grader asks for their removal, but the two resume fixtures are rewritten so the baseline arm is honest.
- An agent may keep writing a session line from habit when the block no longer asks; the resumes check on both agents is the guard.
