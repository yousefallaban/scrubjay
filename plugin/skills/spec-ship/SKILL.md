---
name: spec-ship
description: Ship a built spec. Runs the project's tests and stops on failure, refuses to ship behavior without the owner's recorded go, has a fresh reviewer compare the diff with the spec, the plan and the project's conventions and shows its findings in the conversation, stops on a claim the diff contradicts or leaves untested, removes code no claim covers, asks fix, go on or stop, copies the spec's claims into behavior/ without rewording, updates the architecture files the plan lists, sets the status to shipped, commits the docs, and only then asks whether to create the pull request or show its text. Never merges. Use when a user asks to ship, finish, wrap up or open the pull request for a spec, or runs spec-ship.
---

# spec-ship

Code and docs land together, reviewed by someone who didn't write them, and the owner's go is on record.

## Process

1. Load docs-conventions. `references/behavior.md`, `references/architecture.md`, `references/index.md` and `references/spec.md` apply.
2. Find the active spec from the branch. Read `spec.md`, `plan.md`, `tasks.md`. If a task is unticked, say which and stop.
3. Gate on the go. A feature, or a fix with claims under What changes, needs the `approved` line. Without it, say "The owner of <domain>/<capability> hasn't said go" and stop. A fix with "No behavior change" needs none.
4. Run the project's test command from `architecture/stack.md`. If anything fails, report it and stop. No docs change on a red run.
5. Fresh review. Ask a reviewer that did not write the code, a sub-agent with a fresh context or, without one, a separate read-only session of the agent started from the shell with the review prompt, to compare the branch's diff against main with the claims in `spec.md`, the Scope in `plan.md`, a Files section read the same way, and the rules in `architecture/conventions.md` and `architecture/invariants.md` when they exist, and to report: claims with no test carrying their reference, weak tests, behavior in the diff that no claim covers, changes outside the plan's Scope, anything in the diff that contradicts a claim, and anything in the diff that breaks a rule in those two files. A weak test carries a claim reference but its assertions do not prove that claim: the reference is a label, so the reviewer reads the assertions and says whether they exercise what the claim promises. A convention finding names the rule and the line that breaks it. The findings are shown in the conversation, in the form this agent gives any review, and nowhere else: no report file, no notes, nothing written outside the repository. Code from any source is in the diff and meets the same checks: a change another review or tool made is covered by the claim whose code it serves, or it is behavior no claim covers; that other review is not the fresh review. A weak test or a convention break is reported, not repaired: spec-ship edits neither the test nor the code the finding names. The docs the flow itself writes, the spec folder, `behavior/`, `architecture/`, `decisions/`, `glossary.md`, `index.md`, the block in `AGENTS.md` and the `CLAUDE.md` import, are never unrelated.
6. Uncovered code. For each finding of behavior no claim covers, remove the code and the tests that exercise it, without asking: the spec is the contract. A test-only helper that nothing outside the tests calls is not behavior and stays. A helper that the code behind a claim calls, and that adds no behavior of its own, belongs to that claim: it stays, and a test of it that carries no reference stays with it. Run the tests again and stop on red. The pull request names each removal. An owner who wants the code back adds a claim for it, which is a change to `spec.md` with a new go, and only when the owner says so in the session does the claim get written instead of the removal.
7. The decision point. Say which findings block and which are optional. A claim the diff contradicts, or a claim with no test carrying its reference, blocks: name the claim and the line, say that no docs change, give the two ways on, "Say fix to reopen T<n>, or change the claim in spec.md", and stop. A weak test, a convention break and a change outside the Scope are optional: suggest fix or leave for each in a few words, then ask one question: fix, naming the findings, go on to the pull request, or stop. Nothing under `behavior/` or `architecture/` changes before the answer. On fix, hand over to spec-build: the task that built the code is unticked with a `redo:` line naming the finding, built and ticked, and the ship starts again from step 4. On go on, the optional findings go into the pull request as they are.
8. Update `behavior/`. For each `### Add · <domain>/<capability>`, create or extend `behavior/<domain>/<capability>.md` from its template with the claims copied word for word. For each Change, replace the claim with that ID in place. For each Remove, delete the claim. Reword nothing.
9. Update architecture. For each line under Architecture to update at ship in `plan.md`, update that area file from the named reference file, creating it from its template when it doesn't exist. Leave the reference file as it is. Add a domain row to `index.md` only when one is still missing.
10. Set `status: shipped` in `spec.md`. The status becomes true on the main branch exactly when the pull request merges. `reference/follow-ups.md` stays as it is; its lines are deferred work for later specs and nothing asks about them.
11. Commit the docs. Everything the ship changed under the docs path goes into one commit, `docs: ship <slug>`. Never push here.
12. The pull request. Ask one question: create the pull request with `gh`, or show its title and description to paste. Nothing of the pull request is written before the answer. Title: `type(scope): objective`, type being the kind written out, `feature` or `fix`, never the short `feat`, and `refactor` for a fix with no behavior change; scope the `issue:` key or else the slug, the spec id without its date, which is also the branch name; objective the spec's title. Description: if the repo has `.github/pull_request_template.md` or `PULL_REQUEST_TEMPLATE.md`, fill its sections with the content below; a Screenshots section gets "attach by hand" and the local paths, and no image is committed or uploaded. Otherwise use the layout below. Release impact is derived from the kind and the claims, MINOR for a feature, PATCH for a fix with claims, "No release impact" for a fix without, MAJOR when a claim is removed, and is not asked. On create, push the branch and run `gh pr create` with the title and the description; the address of the pull request is the last line. On show, print both. Without `gh`, show them. Never merge.

```
<the Why in one or two lines>

- Added `<domain>/<capability>#<id>`: <the claim>      one line per claim added, changed or removed
Spec: <spec.md on this branch, as a link on the repository's remote>   · <Tracker>: <KEY>, linked as <issue-tracker><KEY>   only when the spec has an issue key

## Open findings
<each weak test and each convention finding with its rule and line, left as it is>   or   None.
Removed at ship: <what, and that no claim covered it>   only when step 6 removed something

## Unrelated changes
<changes outside plan.md's Scope, one per line>   or   None.

**Release impact:** <No release impact | PATCH | MINOR | MAJOR>
```

## Verification

- The tests passed on the branch before any docs changed.
- The findings appeared in the conversation, and no file was written outside the repository.
- A contradicted or untested claim left `status` and `behavior/` unchanged.
- The decision question came before any docs change, and the pull request question after the docs commit.
- Every claim under Add, Change and Remove is reflected in `behavior/`, word for word.
- Every area file named in `plan.md` was updated, and no reference file changed.
- `spec.md` says `status: shipped` and carries the `approved` line when claims changed.
- The docs changes are one commit, `docs: ship <slug>`.
- The pull request text has every section filled, no placeholder and no Outcome.
- A weak test is named under Open findings, and that test reads as it did before the ship.
- A convention finding names its rule under Open findings, and the code it names reads as it did before the ship.

## Rationalizations and red flags

| Excuse | Rule |
| --- | --- |
| "One flaky test, I'll ship anyway." | Red run, no ship. Fix or stop. |
| "The test carries the claim's ID, so the claim is proven." | The ID is a label. The reviewer reads the assertions; a test that only checks that nothing throws proves nothing about one entry, and the findings say so. |
| "The helper has no claim and its test has no reference, so it's uncovered." | A helper that the code behind a claim calls belongs to that claim. Remove only behavior that no claim covers. |
| "The reviewer compares the diff with the spec; conventions are the build's business." | The reviewer also reads `architecture/conventions.md` and `architecture/invariants.md`. A change can meet every claim and break a project rule, and the findings say which. |
| "The convention break is a one-line fix, I'll do it while shipping." | Reported, not repaired. Shipping changes code only to remove behavior no claim covers; fix means spec-build reopens the task. |
| "I reviewed my own diff carefully." | The reviewer is a fresh context that didn't write the code. A review done in this session is never written up as fresh: without a sub-agent, start a separate session from the shell, or, without a shell, stop and hand the user the review prompt. |
| "Codex already reviewed this branch, so the review is done." | The fresh review runs on every ship. Another review's fix is code in the diff: covered by a claim, or removed. |
| "I'll save the findings to a file so nothing is lost." | The findings stay in the conversation and the open ones go into the pull request. No report file, no body file, nothing outside the repository. |
| "The claim is contradicted, but the tests pass, so I'll ship and note it." | A contradicted claim stops the ship. The memory would say what the code does not do. |
| "I'll ask about each finding one by one." | One question: fix, naming them, go on, or stop. |
| "I'll print the pull request text so they see it before deciding." | Nothing of the pull request before the answer. Create or show, then the text. |
| "The release impact is a judgment call, I'll ask." | It is derived from the kind and the claims. |
| "I'll tidy the claim wording while copying." | Claims are copied word for word. Rewording is a Change in a later spec. |
| "No owner around, but the fix is small." | A fix with claims needs the go. Show the text to paste and stop. |
| "I'll merge it, the user asked to ship." | spec-ship never merges. |
| "The review found an extra helper, but it is harmless, I'll leave it." | Code no claim covers is removed before the docs change. Harmless today is precedent tomorrow. |
| "I'll ask whether they want to keep it before removing." | Removal is the default and needs no question. The owner brings code back with a claim and a go. |

## Fallbacks

- No sub-agents: start a separate read-only session of the agent from the shell with the review prompt, wait for it, and take its findings. Codex: `codex exec --sandbox read-only "<the review prompt>" < /dev/null`, which the sandbox blocks, so ask to run it with escalated permissions. Without a shell either: stop before any docs change, give the user the review prompt to run in a fresh session, and wait for the findings. Either way, say in the pull request that the review ran in a separate session.
- No shell in this session: ask the user to run the test command and report the result, ship only on a reported green run, and say what the docs commit would hold instead of committing.
- No `gh`: show the title and the description to paste.
- No remote: the spec link is its path in the repository.
- No question tool: ask the two questions in plain text and wait.
