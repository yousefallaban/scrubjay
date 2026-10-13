---
spec: 2026-10-13-no-slop
---
Session 2026-10-13: started at T1; first message: "ok do it, once you make sure it works then sync private as well".

- [x] T1 Writing rules in docs-conventions, case first: a Why from a rambling request, graded on tells and length; stop-slop credited -> plain-writing
  - note: the case passed before the rule, with the plugin and without it; the rule is kept as the stated standard by the owner's call, and the case guards it.
- [x] T2 Remove-or-claim step in spec-ship, case first: a fixture with an exported helper no claim covers, shipped with "remove what no claim covers" -> no-uncovered-code
  - note: 0.4 before the rule with a silent prompt. Worded "unless the owner adds a claim" the agent stopped to ask and nothing shipped, 0.4 again and an existing ship case at 0.12; removal as the default with no question: 1.00, and every ship case back at 1.00.
- [x] T3 Run every spec-ship and docs-conventions case once with the plugin -> check: all at 1.00
  - note: 14 runs at 1.00, results under checks/no-slop/run-*.json.
- [x] T4 Ship: behavior and decisions updated, version 0.1.1 in both manifests, PR; then sync the private copy -> check: PR open, private branch pushed with 0.1.1
