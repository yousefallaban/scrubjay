---
id: {{YYYY-MM-DD-slug}}
kind: {{feature | fix | refactor | chore}}
status: draft
summary: {{one user-facing line; reused in release notes}}
issue: {{tracker key}}    # optional: delete the line if there is none
# At the owner's go, add: approved: {by: <owner>, via: <in session, a message link, or a PR>}
# Record a go only when the user reports one; never infer it. Git dates the line.
# After a change to Why or What changes, remove the line; the owner's new go writes it back.
---
# {{Title as a verb phrase}}

## Why
<!-- required: the problem, who has it, and what it costs to leave it, in 2 to 5 lines. No solution. -->

## What changes
<!-- required, except refactor and chore. A refactor writes "No behavior change."
Use only the headings below that apply, one per capability.
Claims read exactly as they will in behavior/, so spec-ship copies them without rewording. -->

### Add · {{domain}}/{{capability}}
- {{Actor}} {{does or sees something observable, present tense}} {#{{claim-id}}}
  e.g. {{a concrete situation}} -> {{the observable result}}

### Change · {{domain}}/{{capability}}
- {{The claim as it should read}} {#{{existing-claim-id}}}
  was: {{the current text on main}}
  e.g. {{a concrete situation}} -> {{the observable result}}

### Remove · {{domain}}/{{capability}}
- {{The claim being removed}} {#{{existing-claim-id}}}
  reason: {{why it stops being true}}

## Not doing
<!-- required for features, optional otherwise: what is deliberately out, so scope can't creep silently. -->

## Open questions
<!-- while drafting: questions only the owner can answer. Delete the section when empty;
the owner can't say go before that. -->
