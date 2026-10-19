---
name: spec-start
description: Start a spec from a sentence, a ticket or commits already made. Creates the spec folder and the branch, sets the kind, feature or fix, settles why and what by grilling for a feature or in one pass for a fix, writes the claims under Add, Change and Remove, offers to map a domain that has no behavior docs, and records the owner's go only when the user reports one. Use when a user describes something to build, change or fix, asks to start or write a spec, runs spec-start, or reports that the owner approved a spec, so the go gets recorded.
---

# spec-start

From an intent to a spec the owner can say go to, with nothing left open that only the owner can answer.

## Process

1. Load docs-conventions and grilling. `references/spec.md` and the claim format apply.
2. Read what the spec starts from: a sentence, a ticket key with a sentence, or the commits on the current branch when the user says the work is already done. Derive a kebab-case slug of two to five words and the id `<today>-<slug>`. Record the start as `request:`, and the ticket key as `issue:` when there is one.
3. Set the kind. A `feature` adds or changes behavior and gets grilled, planned and needs the owner's go before planning. A `fix` is a bug, a small change, a chore or a refactor: one pass, a failing test first when it changes behavior, and the owner's go before ship only when it has claims. When unsure, ask with a recommendation.
4. Create the branch named after the slug from the main branch, unless the branch already exists or the user is already on it. Create `<docs-path>/specs/<id>/spec.md` from the template.
5. Find the domain. Read `index.md`. If the domain has no row, ask who owns it and what it covers, and add the row now, before any go is asked. If the spec touches a domain with no `behavior/<domain>/` folder, offer to map it first: "Map <domain> first?" and run docs-map when the user says yes.
6. Settle why and what. For a feature, grill in rounds until nothing is left that only the owner can answer, writing the why and each claim into `spec.md` as it settles. For a fix, write the spec in one pass from the request and the code, and ask only about what is ambiguous. Why is 2 to 5 lines, the problem and its cost, no solution.
7. Write What changes as claims under `### Add · <domain>/<capability>`, `### Change · ...` and `### Remove · ...`, only the headings that apply. A Change carries `was:` with the current text from `behavior/`. A Remove carries `reason:`. A fix with no behavior change writes "No behavior change." So does a fix for code that breaks a claim `behavior/` already states: the claim doesn't change, the code catches up with it, so write "No behavior change." and name the claim the fix restores, as `restores: <domain>/<capability>#<id>`, so the failing test carries that reference. For a feature, write Not doing. Questions only the owner can answer and that the session didn't settle go under Open questions with a recommended answer each.
8. The go. The owner is the one `index.md` lists for the domain. Record `approved: {by: <owner>, via: <in session | link | PR>}` only when the user reports a go, and only when Open questions is empty. When the user is the owner, their "go" in the session is the go, recorded as `via: in session`. Never infer a go from enthusiasm, silence or "looks good".
9. Report: the spec path, the branch, the kind, and the next step, spec-plan for a feature with its go, spec-build for a fix.

## Verification

- The spec folder and the branch exist, the branch name is the slug, and `spec.md` has `request:` and, when given, `issue:`.
- `kind` is feature or fix, and a feature has Not doing.
- Every claim has an ID and an `e.g.` line, every Change has `was:`, every Remove has `reason:`.
- `approved` is present only if the user reported a go and Open questions is gone.
- No `<!--` guidance left in `spec.md`.

## Rationalizations and red flags

| Excuse | Rule |
| --- | --- |
| "The request is clear enough, I'll skip the rounds." | A feature is grilled. If the first round has nothing to ask, say so and show why. |
| "They sounded happy, that counts as the go." | A go is reported, never inferred. |
| "One open question is fine, I'll record the go anyway." | Open questions must be empty first. |
| "I'll describe how to build it in the spec, it helps." | The spec holds why and what. How goes to plan.md. |
| "No behavior file for this domain, I'll write claims from memory." | Offer docs-map first, or look up the code before writing a `was:`. |
| "The block says every session starts at tasks.md, so I'll create one now." | tasks.md is written by spec-plan. Until the plan has the owner's OK, the spec folder holds spec.md and reference/ only. |

## Fallbacks

- No question tool: grill in plain text, numbered, with recommended answers, and wait.
- No git: create the folder and tell the user which branch to create.
