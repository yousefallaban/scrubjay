---
id: 2026-10-12-d18-company-knowledge-sits-one-layer-above-docs
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Company knowledge sits one layer above docs/. Projects link to it and never copy it

## Context
Company rules live in a company skill pack, company facts in a company docs repo shaped like `docs/`, and project memory in the project's `docs/`. Company policies always win. Company defaults can be overridden only with a decision record. For a freelancer, a client's rules come from the client's pack or docs repo, and your own way of working is your personal pack.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Company knowledge sits one layer above docs/. Projects link to it and never copy it.

## Consequences
Why: copies drift, and links don't.
Revisit when: several products share knowledge. A company docs repo template is in the backlog.
Changed in part by D36.
