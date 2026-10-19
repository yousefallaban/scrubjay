---
id: 2026-10-18-polish-is-a-second-door-in-spec-build
status: accepted
spec: 2026-10-18-mid-build-changes
date: 2026-10-18
---
# Polish is a second door in spec-build, and the recheck line names only changed tasks

## Context
D9 said to revisit when rechecks become noisy in practice. The first spec built in daily use went through seventeen polish rounds, a larger icon, 12px of padding, a pill shape, and each one took the only door spec-build had, change of course, leaving a recheck line that named every task with a reason. Step 9 said "mark each keep, redo, new or drop with a one-line reason" while the template showed `T2 redo, T4 new, T5 dropped`, and the agent wrote all the reasons into the line.

## Options
- Shorten the recheck for every change: lost, a change to a claim still has to be checked against every task.
- Treat polish as a change of course with a shorter line: lost, it still rechecks thirteen tasks for 12px of padding.
- A second door: a request that changes no claim and adds no file to the plan unticks its task with a `redo:` line and writes nothing above the tasks; the recheck stays for changes to the spec or the plan's Files, its reasons are said in the session, and the line names only the tasks whose status changed: won.

## Decision
A polish reopens one task with a redo line and no recheck; a change of course rechecks every task and writes one line naming only the changed ones. A task holds one redo line, the newest, so repeated polish does not grow it.

## Consequences
A tasks.md stays readable through a long polish phase. The kept-task reasons are no longer on record, which git and the session hold instead. D9 and D33 stand; this refines them. Watch for a polish that quietly changes a claim: the rule says that is a change of course.
