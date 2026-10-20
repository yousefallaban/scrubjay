---
id: 2026-10-19-the-plan-names-places-and-a-request-reopens-its-task
status: accepted
spec: 2026-10-19-plan-keeps-size
date: 2026-10-19
---
# The plan's Scope names the folders a change may land in, and a request about finished work reopens its task instead of adding one

## Context
A real spec planned six tasks and ended with 48: every request to do finished work differently was appended as a new task, because the recheck offered keep, redo, new or drop and nothing said which one a change to finished work gets. Its plan listed 173 file paths, kept accurate by hand, where every new file was a question and a recheck round and every rename a maintenance step. The owner agreed with the view that path lists go stale, and asked what the list was for once the build is over.

## Options
- Drop the file list and rely on claim coverage alone: lost, since the owner would no longer see where a change lands before saying OK, and the review would lose its unrelated-changes finding.
- Keep the list at file level and maintain it: lost, as 173 paths showed what that costs.
- Name places instead of paths, folders or files with one reason each, a folder covering everything under it, and read an older plan's Files heading the same way: won.
- For tasks, cap the count: lost, since the list should be as long as the plan. Say instead that a request about work a ticked task did reopens that task, and a new task comes only from a new claim or a check the plan lacks: won.

## Decision
plan.md's Scope lists the folders or files a change may land in; spec-build writes freely under a listed folder and asks only outside the Scope; the review and the pull request name changes outside it. A request that changes work a ticked task did reopens that task with a redo line, whatever its size, and the recheck marks such a task redo, never new.

## Consequences
A module of many files is one plan line, a rename inside it costs nothing, and the recheck fires only when the change leaves the listed places. The task list stays the plan's length through the build. The boundary for what the code does stays with the claims: code no claim covers is still removed at ship. Older plans keep their Files heading and work unchanged. Watch for a Scope so wide, a single `src/` line, that it stops saying anything; the review's unrelated-changes finding goes quiet then, which is the signal.
