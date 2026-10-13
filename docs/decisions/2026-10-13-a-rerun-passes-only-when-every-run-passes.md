---
id: 2026-10-13-a-rerun-passes-only-when-every-run-passes
status: accepted
spec: 2026-10-13-sessions
date: 2026-10-13
---
# A regression rerun uses three runs per case and passes only when every run passes

## Context
The release check already ran three times per case, and the eval runner's default threshold fails the run when any case scores below 1. The reruns after a skill change ran once, and a case that passed once was taken as passing. Anthropic's notes on evals separate pass@k, one success in k, from pass^k, every run succeeds, and put regression suites on the second. The first rerun at three runs caught two things one run had hidden: the no-slop removal step meeting the no-shell fallback in three ship cases, which stopped the ship before the docs, and a test-first case that needed the test run the new rule asks for.

## Options
- One run per case, as before: lost, it passes a case by luck and hides an interplay between rules.
- Three runs, mean score: lost, a 0.67 would pass a case that fails one run in three.
- Three runs, every run at 1.00, the runner's default threshold: won.

## Decision
A rerun after a skill change runs each case three times with the runner's default threshold, so a case passes only when every run passes, and the fixtures hold only claimed behavior so a case tests one rule.

## Consequences
Why: the cases are the proof the tick stands on, and proof that holds one time in three is not proof.
Revisit when: the cost of three runs blocks a small fix; then the rerun covers the changed skill's cases only, which it already does.
