---
spec: 2026-10-12-v0-1
---
Session 2026-10-12: started at T1; first message: "then go".

- [x] T1 Create scrubjay-example: a small webshop on Bun with products, orders and returns with partial refunds, no wishlist since the flow adds it, passing tests, tagged baseline -> check: `bun test` passes on tag baseline, and the repo has no docs/ and no AGENTS.md
- [x] T2 Baseline run: OpenSpec plus grill-me on "add a wishlist" in scrubjay-example; record what worked, what broke and the resident tokens in reference/baseline.md; propose spec cuts where they already work -> check: reference/baseline.md has a finding per command and a token count
  - note: no cuts; neither tool has the entry point, resume, go gate or test-gated truth. OpenSpec archives with no code written.
- [x] T3 Repo scaffold: plugin/ with the three manifests, LICENSE copy, checks/check.py, checks/run.sh and the CI workflow; settle where evals live -> static-checks, plugin-folder, name-neutral, check: CI green on the empty plugin
  - note: evals settled under plugin/evals/ (D52); CI green on the PR merged as #3.
- [x] T4 docs-conventions: SKILL.md with the charter and the claim format, references per file, templates under assets/, cases -> from-template, no-placeholders, one-job, claim-format, docs-format
  - note: 6 cases at 1.00 with the plugin; without it the decision scored 0.67 and the plan 0.33, so the skill is what makes them pass.
- [ ] T5 docs-init, test-first on scrubjay-example, with the first domain and the issue tracker, cases with a scaffold, by-hand protocol for the block -> creates-skeleton, writes-block, answers-from-docs, links-claude-md, docs-path, existing-spec-tools, rerun-safe
- [ ] T6 docs-map, test-first on returns in scrubjay-example -> one-domain, drafts-claims, only-what-it-needs, owner-confirms, reads-old-specs
- [ ] T7 spec-build core and resume, test-first with a hand-written tasks.md on a branch of scrubjay-example -> task-by-task, test-first, sets-building, resumes, session-line, notes, stays-in-scope
- [ ] T8 spec-build, changing course -> updates-owner-file, rechecks-tasks, waits-for-recheck-ok, renews-go, follow-up-spec
- [ ] T9 grilling, test-first on the wishlist request -> rounds, looks-up-facts, writes-as-it-settles
- [ ] T10 spec-start, test-first on the wishlist and on the refund fix -> creates-spec, sets-kind, grills, fast-path, what-changes-format, offers-map, owner-is-listed, records-go
- [ ] T11 spec-plan -> needs-go, writes-plan, writes-tasks, reference-files, waits-for-ok
- [ ] T12 spec-ship, docs half: tests, the go, behavior, architecture, status -> runs-tests, ships-with-go, updates-behavior, updates-architecture, sets-shipped
- [ ] T13 spec-ship, PR half: the fresh reviewer and its fallback, the PR title and template with links, unrelated changes and release impact, the outcome line -> fresh-review, pr-choice, pr-template, reports-outcome, fallbacks
- [ ] T14 Install from the private repo on Claude Code and on Codex, run each command once by hand on Codex, write the install sections -> claude-code, codex, private-repo, git-only, agent-skills
- [ ] T15 Pack docs: plugin README, quickstart, CREDITS -> readme, quickstart, credits
- [ ] T16 Dogfood: the wishlist feature end to end on scrubjay-example with the pack installed, on both agents -> check: a shipped spec on scrubjay-example whose PR description carries the review findings and the outcome line
- [ ] T17 Release check: every case passes on Claude Code, each command run once on Codex, the three block claims by hand on both agents with transcripts kept -> case-minimum, two-agents, block-cases
- [ ] T18 Ship v0.1: the checks, a fresh review of the diff against spec.md, docs/behavior, docs/architecture and docs/decisions from what proved true, status shipped, a PR titled v0-1 -> check: the PR is open with status shipped and the review findings in its description
