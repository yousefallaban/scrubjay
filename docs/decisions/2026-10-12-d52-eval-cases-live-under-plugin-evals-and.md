---
id: 2026-10-12-d52-eval-cases-live-under-plugin-evals-and
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# Eval cases live under plugin/evals/ and ship with the plugin. By-hand protocols and transcripts live under checks/by-hand/

## Context
Settles the trade-off left open in plan.md. `claude plugin eval` refuses an `--eval-dir` outside the plugin root, tested on 2.1.272: "must stay inside the plugin root (no ..)". Cases are plain prompt and grader files, so shipping them costs users nothing but a folder. The by-hand protocols for the block-driven claims are not eval cases and stay in the repo next to the checks.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
Eval cases live under plugin/evals/ and ship with the plugin. By-hand protocols and transcripts live under checks/by-hand/.

## Consequences
Why: the runner decides where cases go. The `plugin-folder` claim now names eval cases as part of what users receive.
Revisit when: the runner accepts a cases directory outside the plugin.
