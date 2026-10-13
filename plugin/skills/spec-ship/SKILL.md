---
name: spec-ship
description: Ship a built spec. Runs the project's tests and stops on failure, refuses to ship behavior without the owner's recorded go, has a fresh reviewer compare the diff with the spec and the plan, copies the spec's claims into behavior/ without rewording, updates the architecture files the plan lists, sets the status to shipped, and prepares the pull request with its title, template, review findings and outcome, asking whether to create it or show it. Never merges. Use when a user asks to ship, finish, wrap up or open the pull request for a spec, or runs spec-ship.
---

# spec-ship

Code and docs land together, reviewed by someone who didn't write them, and the owner's go is on record.

## Process

1. Load docs-conventions. `references/behavior.md`, `references/architecture.md`, `references/index.md` and `references/spec.md` apply.
2. Find the active spec from the branch. Read `spec.md`, `plan.md`, `tasks.md`. If a task is unticked, say which and stop.
3. Gate on the go. A feature, or a fix with claims under What changes, needs the `approved` line. Without it, say "The owner of <domain>/<capability> hasn't said go" and stop. A fix with "No behavior change" needs none.
4. Run the project's test command from `architecture/stack.md`. If anything fails, report it and stop. No docs change on a red run.
5. Fresh review. Ask a reviewer that did not write the code, a sub-agent with a fresh context, to compare the branch's diff against main with the claims in `spec.md` and the Files list in `plan.md`, and to report: claims with no test carrying their reference, behavior in the diff that no claim covers, files changed outside the plan, and anything in the diff that contradicts a claim. Keep the findings for the pull request; code files outside the plan become its Unrelated changes. The docs the flow itself writes, the spec folder, `behavior/`, `architecture/`, `decisions/`, `glossary.md`, `index.md`, the block in `AGENTS.md` and the `CLAUDE.md` import, are never unrelated.
6. Update `behavior/`. For each `### Add · <domain>/<capability>`, create or extend `behavior/<domain>/<capability>.md` from its template with the claims copied word for word. For each Change, replace the claim with that ID in place. For each Remove, delete the claim. Reword nothing.
7. Update architecture. For each line under Architecture to update at ship in `plan.md`, update that area file from the named reference file, creating it from its template when it doesn't exist. Leave the reference file as it is. Add a domain row to `index.md` only when one is still missing.
8. Set `status: shipped` in `spec.md`. The status becomes true on the main branch exactly when the pull request merges.
9. Outcome. Count the Session lines in `tasks.md`. Ask the user which of those sessions needed re-explaining, one question. Compare `request:` with the shipped claims and write one line on what grilling added, changed or kept out.
10. The pull request. Title: `type(scope): objective`, type being the kind written out, `feature` or `fix`, never the short `feat`, and `refactor` for a fix with no behavior change; scope the `issue:` key or else the slug; objective the spec's title. Description: if the repo has `.github/pull_request_template.md` or `PULL_REQUEST_TEMPLATE.md`, fill its sections and add Review and Outcome at the end. Otherwise use the layout below. Propose Release impact from the kind and the claims, MINOR for a feature, PATCH for a fix with claims, "No release impact" for a fix without, MAJOR when a claim is removed, and ask the user to confirm it in the same question as the sessions. Then ask whether to create the pull request with `gh` or to show the title and description to paste. Without `gh`, show them. Never merge.

```
## Links
- **<Tracker>:** <KEY> — <spec title>, linked as <issue-tracker><KEY>   or   None.
- **Spec:** docs/specs/<id>/spec.md

## Description
<the Why in one or two lines, then one line per claim added, changed or removed>

## Unrelated changes
<files changed outside plan.md, one per line>   or   None.

## Release impact
**Release impact:** <No release impact | PATCH | MINOR | MAJOR>

## Review
<the fresh reviewer's findings, or "No findings.">

## Outcome
Sessions: <n>, re-explained: <n>. <what grilling added, changed or kept out>.
```

## Verification

- The tests passed on the branch before any docs changed.
- Every claim under Add, Change and Remove is reflected in `behavior/`, word for word.
- Every area file named in `plan.md` was updated, and no reference file changed.
- `spec.md` says `status: shipped` and carries the `approved` line when claims changed.
- The pull request text has every section filled and no placeholder.

## Rationalizations and red flags

| Excuse | Rule |
| --- | --- |
| "One flaky test, I'll ship anyway." | Red run, no ship. Fix or stop. |
| "I reviewed my own diff carefully." | The reviewer is a fresh context that didn't write the code. |
| "I'll tidy the claim wording while copying." | Claims are copied word for word. Rewording is a Change in a later spec. |
| "No owner around, but the fix is small." | A fix with claims needs the go. Show the text to paste and stop. |
| "I'll merge it, the user asked to ship." | spec-ship never merges. |

## Fallbacks

- No sub-agents: ask the user to open a fresh session with the review prompt and paste the findings back, and say so in the pull request.
- No shell in this session: ask the user to run the test command and report the result, and ship only on a reported green run.
- No `gh`: show the title and the description to paste.
- No question tool: ask the two questions in plain text and wait.
