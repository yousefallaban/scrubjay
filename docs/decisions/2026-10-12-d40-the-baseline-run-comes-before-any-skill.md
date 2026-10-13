---
id: 2026-10-12-d40-the-baseline-run-comes-before-any-skill
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The baseline run comes before any skill, and bet A is built before bet B

## Context
Extends D29. The first task runs OpenSpec plus Matt Pocock's `grill-me` on one real task. The docs layer, the block and resume come next. Grilling comes after.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
The baseline run comes before any skill, and bet A is built before bet B.

## Consequences
Why: the baseline says how much to build, and it checks bet B's premise for free since grill-me exists. Bet A is the riskier bet: the comparison we cite says no pack has solved it.
Revisit when: never. This is the order for v0.1.
