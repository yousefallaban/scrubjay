---
id: 2026-10-12-d26-v0-1-uses-two-testing-patterns-skills
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# v0.1 uses two testing patterns: skills written test-first, and a minimum number of cases per skill

## Context
Test-first (from Superpowers) means you watch the agent fail without the skill, write the smallest skill that fixes it, then close the loopholes the agent finds. The case minimum (from Addy Osmani) is 3 trigger cases, 2 non-trigger cases and 1 behavior case per skill.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
v0.1 uses two testing patterns: skills written test-first, and a minimum number of cases per skill.

## Consequences
Why: both are cheap and work in any agent. Behavior evals in CI, rubric graders for grilling, a fixtures framework and release gates are deferred until contributors arrive.
Revisit when: contributors arrive, or skills regress after a model change.
Changed in part by D30.
