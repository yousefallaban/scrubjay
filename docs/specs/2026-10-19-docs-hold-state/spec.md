---
id: 2026-10-19-docs-hold-state
kind: feature
status: draft
summary: "A spec folder file describes the current state and is rewritten in place: no session lines, no recheck lines, no lines under a ticked task, and a commit at every tick so git holds the history"
request: "Yousef, on 2026-10-19, after a cleanup pass left 19 session lines in his client spec's tasks.md: as we have versioning, the doc should read as if written new, not appended to; keep the latest state"
approved: {by: yousef, via: in session}
---
# Make every spec file describe the current state

## Why
A 13-task spec built over 19 sessions ended with 19 Session lines and 17 Rechecked lines above its tasks, and the owner read them as noise even after a cleanup kept only what the rules allow. Every one of those lines records something a commit would hold better: when work happened, what a plan change did to the tasks, what a finished task tried on the way. A second history inside the file is read on every resume and never consulted later, while the decisions file already keeps the choices that outlive the spec. Reference files got the current-state rule in 0.2.0; tasks.md did not, and nothing committed as the work went, so on an unpushed branch there was no history at all.

## What changes

### Add · practice/docs-conventions
- A file in the spec folder describes the current state and is rewritten in place, with git as its history, and only `reference/decisions.md` appends {#state-not-history}
  e.g. a task reopened and finished again -> tasks.md shows the task ticked, and the earlier state is in the git log, not in the file

### Add · spec/build
- spec-build commits the files a task touched when it ticks the task, with the task line as the message, and commits an OK'd recheck as one commit {#commits-at-tick}
  e.g. T2 ticked -> `feat: T2 save and list, with duplicates kept to one entry [saves-item, no-duplicates, lists-saved]` on the branch, and a hand-made change outside the plan's Files stays uncommitted

### Change · spec/build
- After a change to `spec.md` or to plan.md's Files, the agent rechecks every task, shows each as keep, redo, new or drop with a one-line reason, and rewrites the task list in place without a recheck line {#rechecks-tasks}
  was: After a change to `spec.md` or to plan.md's Files, the agent rechecks every task, shows each as keep, redo, new or drop with a one-line reason, and records one recheck line in `tasks.md` that names only the tasks whose status changed
  e.g. a fourth claim is added -> the session shows T1 to T3 as keep and T4 as new, and tasks.md gains T4 and nothing else
- What blocked a task, what was tried and dropped, or what a redo changed is kept as at most two lines under that task while it is open, and the lines go at the tick {#notes}
  was: What blocked a task, or what was tried and dropped, is kept as a note of at most two lines under that task
  e.g. T2 ticked after a detour through a Set -> the Set note is gone, and the choice, if lasting, is in `reference/decisions.md`
- A mid-build request that changes no claim and adds no file to the plan reopens its task with a `redo:` line, and a size or value it brings goes to `reference/`, never into plan.md's Approach {#polish}
  was: A mid-build request that changes no claim and adds no file to the plan reopens its task with a `redo:` line and no recheck line, and a size or value it brings goes to `reference/`, never into plan.md's Approach
  e.g. "make the icon bigger" after T2 is ticked -> T2 is unticked with `redo: icon size`, the size goes to `reference/layout.md`, and the redo line goes at the tick

### Change · spec/ship
- The PR description states what changed between the request and the shipped claims, and what became of each line in `reference/follow-ups.md`: kept for a spec or dropped {#reports-outcome}
  was: The PR description states how many sessions the spec took, how many the user says needed re-explaining, what changed between the request and the shipped claims, and what became of each line in `reference/follow-ups.md`: kept for a spec or dropped
  e.g. a spec with two deferred changes -> `Grilling added guest saving and kept sharing out. Follow-ups: share by link, kept for a spec; price alerts, dropped.`

### Change · pack/quality
- The claims the block drives, answers-from-docs, resumes, verifies-on-doubt and names-the-mismatch, are checked by hand on `scrubjay-example` on both agents before release, and the transcripts are kept, since eval runs load no project instructions {#block-cases}
  was: The claims the block drives, answers-from-docs, resumes, session-line, verifies-on-doubt and names-the-mismatch, are checked by hand on `scrubjay-example` on both agents before release, and the transcripts are kept, since eval runs load no project instructions
  e.g. a fresh Codex session on `add-wishlist` reports "T3 is next" unprompted -> the transcript is saved under the case

### Remove · spec/build
- Every session writes one line above the tasks in `tasks.md` with the date, where it resumed, and the gist of the user's first message, never a verdict {#session-line}
  reason: its only reader was the Outcome's session count, which git's dates give without a rule, and 19 of them in one spec were read as noise

## Not doing
- Changing `reference/decisions.md` or `docs/decisions/`: lasting choices stay append-only, as the one record meant to be read later.
- A sessions count in the frontmatter or the Outcome: the dates are in the git log, and a count nobody can judge after 19 sessions is not worth a block rule.
- Touching the `was:` lines in `spec.md`: they are the payload of a Change, which spec-ship needs at ship, not history.
- Pushing: spec-build commits locally, and the push stays with the user until spec-ship opens the pull request.
- A tool that cleans existing spec folders: one prompt does it once per folder after the update.
- Changing plan.md's rules: Approach already holds shape only, and Files already tracks the current scope.
