---
id: {{YYYY-MM-DD-slug}}
kind: {{feature | fix}}
status: draft
summary: {{one user-facing line; reused in release notes}}
request: {{the sentence, issue or commits it started from}}
issue: {{tracker key}}
---
# {{Title as a verb phrase}}

## Why
<!-- required: the problem, who has it, and what it costs to leave it, in 2 to 5 lines. No solution. -->

## What changes
<!-- required. A fix that changes no behavior writes "No behavior change." and nothing else here.
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
<!-- required for a feature, optional for a fix: what is deliberately out, so scope can't creep silently. -->

## Open questions
<!-- while drafting: questions only the owner can answer. Delete the section when empty;
the owner can't say go before that. -->
