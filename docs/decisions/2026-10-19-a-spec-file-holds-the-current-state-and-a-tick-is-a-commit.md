---
id: 2026-10-19-a-spec-file-holds-the-current-state-and-a-tick-is-a-commit
status: accepted
spec: 2026-10-19-docs-hold-state
date: 2026-10-19
---
# A spec folder file holds the current state and is rewritten in place, and every tick is a commit, so git is the history

## Context
tasks.md recorded its own history: a Session line per session, a Rechecked line per plan change, and notes that stayed under ticked tasks. A real 13-task spec built over 19 sessions in the company copy ended with 36 such lines above and between its tasks, and the owner read them as noise even after the 0.2.0 polish door and a cleanup under the 0.2.0 rules. Reference files had been given the current-state rule in 0.2.0; tasks.md had not. And nothing committed as the work went, so on that unpushed branch the lines were the only history there was.

## Options
- Keep the lines but cap them: lost, since any number of history lines is history in a file read on every resume and never consulted later.
- Move the session history to a frontmatter count: lost, because its only reader was the Outcome's session count, which the git log gives once commits exist, and a re-explained judgment after 19 sessions is a guess.
- Make every spec folder file describe the current state, rewritten in place, with the decisions file as the one append-only record, and have spec-build commit the task's files at each tick and each OK'd recheck so git holds every earlier state: won.

## Decision
A file in the spec folder describes the current state and is rewritten in place; only `reference/decisions.md` appends, and the 0.2.0 rule for reference files folds into this one. tasks.md carries nothing above the tasks, and every line under a task goes at the tick. spec-build commits the files a task touched at its tick, with the task line as the message; it commits only the files the plan names and never pushes. The Outcome no longer counts sessions.

## Consequences
A resumed session reads the plan as it stands, with working lines only under the open task, and the history sits in the git log with dates. Projects that commit by hand gain a commit per tick they did not ask for, and can say so in their conventions. The session count and the re-explained question are gone from the pull request. A project without git keeps the rule without the commit, which the skill says once. Watch for an agent writing a session or recheck line from habit; the by-hand resumes check on both agents is the guard.
