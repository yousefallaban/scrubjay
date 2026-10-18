---
id: 2026-10-18-mid-build-changes
kind: feature
status: building
summary: A polish request reopens one task, reference files stay current, and deferred changes are settled at ship
request: the first real spec built with the pack left seventeen recheck lines, a 250-line verification log and a plan full of sizes; make mid-build changes cheap to record
approved: {by: yousef, via: in session}
---
# Make mid-build changes cheap to record

## Why
The first feature built with the pack in daily use went through seventeen polish rounds in two days: a larger icon, 12px of padding, a pill shape. Each one went through the only door spec-build has for a mid-build request, change of course, and left a recheck line naming every task with a reason, 984 words in a thirteen-task file. Verification results were appended run after run until one reference file held nine runs in 250 lines, plan.md's Approach gained a sentence of sizes per round, one claim grew five subjects, and six observations for later work sat in a reference file with nothing to pick them up at ship. The agent followed the skills. The skills had no door for polish, no rule that a reference file is state, and no home for a deferred change.

## What changes

### Change · spec/build
- After a change to `spec.md` or to plan.md's Files, the agent rechecks every task, shows each as keep, redo, new or drop with a one-line reason, and records one recheck line in `tasks.md` that names only the tasks whose status changed {#rechecks-tasks}
  was: The agent rechecks every task, marks each keep, redo, new or drop with a one-line reason, and records one recheck line in `tasks.md`
  e.g. `Rechecked 2026-10-14 after: guests can save. T2 redo, T4 new.`, with T1 and T3 kept, said in the session and not written
- When a change contradicts Not doing or grows the scope, the agent proposes a follow-up spec instead, and a change the user defers becomes one line in `reference/follow-ups.md` {#follow-up-spec}
  was: When a change contradicts Not doing or grows the scope, the agent proposes a follow-up spec instead
  e.g. "also share wishlists" while sharing is under Not doing -> "Start a separate spec for sharing?"; "later" -> `- Share a wishlist by link, raised while building T2`

### Add · spec/build
- A mid-build request that changes no claim and adds no file to the plan reopens its task with a `redo:` line and no recheck line, and a size or value it brings goes to `reference/`, never into plan.md's Approach {#polish}
  e.g. "footer padding 12px" with T2 ticked -> T2 is unticked under `- redo: footer padding 12px, in reference/layout.md`, and nothing is added above the tasks or to Approach
- A change of course that adds to what a claim says writes a new claim or replaces the claim, so each claim stays one testable sentence with one example {#one-sentence-claims}
  e.g. "also show how many items are saved" arrives while `lists-saved` exists -> a new claim with its own ID, not a longer `lists-saved`

### Add · practice/docs-conventions
- A reference file describes the current state of its subject: a new run, draft or measurement replaces the paragraph it supersedes, and only `reference/decisions.md` is appended {#reference-is-state}
  e.g. a second browser-check run -> the results paragraph is rewritten, and the file holds one set of results and its limits

### Change · spec/ship
- The PR description states how many sessions the spec took, how many the user says needed re-explaining, what changed between the request and the shipped claims, and what became of each line in `reference/follow-ups.md`: kept for a spec or dropped {#reports-outcome}
  was: The PR description states how many sessions the spec took, how many the user says needed re-explaining, and what changed between the request and the shipped claims
  e.g. spec-ship asks "Which of the 4 sessions needed re-explaining, and which follow-ups get a spec?" -> `Sessions: 4, re-explained: 0. Grilling added guest saving and kept sharing out. Follow-ups: share by link, kept for a spec; price alerts, dropped.`

## Not doing
- Rewriting a task's sentence on a polish: the `redo:` line says what changed, and git holds the history.
- Splitting spec/build into smaller capabilities, although it now holds more than seven claims.
- A standing backlog: `reference/follow-ups.md` belongs to one spec, and every line in it is settled when that spec ships.
- Enforcing a size on reference files or plan.md: the rule is stated and its eval case covers it, as D35 says.
- Changing the session line or the re-explained count at ship, D48.
- Rewriting shipped specs or the parked docs-check branch to the new rules.
