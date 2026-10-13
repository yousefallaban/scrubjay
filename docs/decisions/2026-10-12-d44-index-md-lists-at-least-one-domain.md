---
id: 2026-10-12-d44-index-md-lists-at-least-one-domain
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# index.md lists at least one domain from init, and the row for a new domain is added the moment it is named. The Behavior column is dropped

## Context
Extends D32 and D36. docs-init asks for the first domain and its owner. spec-start and docs-map add a row when they meet a domain that has none, before any go is asked. The path to a domain's behavior is a rule stated once above the table, not a column.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
index.md lists at least one domain from init, and the row for a new domain is added the moment it is named. The Behavior column is dropped.

## Consequences
Why: an empty required table broke the no-placeholders rule, the owner lookup had no row to find for a new domain when the go was needed, and a derived column drifts.
Revisit when: a domain needs more than a name, a scope and an owner.
Changed in part by D55.
