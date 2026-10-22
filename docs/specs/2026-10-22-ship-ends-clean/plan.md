---
spec: 2026-10-22-ship-ends-clean
---
## Approach
Ten claims, each proven by an eval case written before its rule, baseline first. spec-ship's steps 5 to 11 are rewritten: the reviewer's findings are shown in the conversation in whatever form the agent gives a review, and nothing is saved; the ship then says which findings block and which are optional, with fix or leave suggested for each, and asks fix, go on or stop; a contradicted or untested claim stops the ship and names the two ways on; the removal of uncovered code follows the question and lands as its own commit; then the docs land in one commit; then one question, create the pull request with `gh` or show its title and description, and nothing of the pull request exists before the answer. The body is the repo's template or six parts. "fix" is handed to spec-build's reopen rule with one sentence there. The block asset gains a Review paragraph with the five checks, and every fixture's block carries it. The graders that pinned `## Review`, `## Unrelated changes` and `## Outcome` read the new shape, the follow-ups case becomes the case that the file is left alone and nothing is asked, and eight cases are new or repurposed. The version goes to 0.5.0 (D5).

## Trade-offs
- A format of the pack's own for findings would be gradeable to the letter; it was rejected as a copy of what the agents already do (D1). The cases grade what a finding must contain and what the ship must not do, not how the list looks.
- Calling the agent's native review from the ship would give one list for bugs and contract; parked until a by-hand run shows the contract checks survive inside it (D2).

## Scope
```
plugin/skills/spec-ship/SKILL.md                                changed: steps 5 to 11, the PR layout, the red flags and the fallbacks
plugin/skills/spec-build/SKILL.md                               changed: the hand-over sentence, the follow-ups Purpose line and its red flag row
plugin/skills/docs-conventions/assets/agents-block.md           changed: the Review paragraph
plugin/skills/docs-conventions/references/agents-block.md       changed: the rule for that paragraph
plugin/skills/docs-conventions/references/reference.md          changed: follow-ups.md keeps its lines past the ship
plugin/evals/spec-ship/                                         changed: graders that pin the old layout, the follow-ups case repurposed, seven new cases, the release-impact pre-answer gone from the prompts
plugin/evals/docs-init/                                         changed: a grader for the Review paragraph on the rerun and on a fresh init
checks/fixture-webshop.sh, plugin/evals/*/*/fixture.sh          changed: the block in every fixture AGENTS.md carries the Review paragraph
checks/by-hand/                                                 changed: a ship check section with a row per agent in dogfood.md, and its transcripts
plugin/README.md                                                changed: the spec-ship row and step say the PR is opened from the conversation
AGENTS.md                                                       changed: the Shipping line names the one docs commit
plugin/plugin.json, plugin/.claude-plugin/plugin.json           changed: version 0.5.0
```

## Risks
- A trace grader cannot pin a review form the pack does not define; the cases grade the finding named, the removal named, no `## Outcome`, and no `Write` to a path outside the repo. The last one matches temp and scratch paths and may miss a stray file written elsewhere.
- The contradiction case may see the agent change the code to match the claim instead of stopping; it is graded on `src/` unchanged, the status unchanged and no `behavior/` file.
- The eval session has no shell and so no `gh`, which makes the pull request question unaskable there: the skill's no-gh fallback shows the text, and the case grades that the text comes after the docs. The question itself is checked by hand on the example repo.
- The eval prompts pre-answer the questions so a run completes; the asks-after-the-review case grades the blockers-and-optional line and the question, which a pre-answered prompt may make the agent skip. If three runs skip it, the prompt leaves the review question unanswered and the case grades the stop before any docs change instead.
- The fix case runs in one prompt that says to fix a weak test the review finds; the agent may edit the test inside the ship instead of reopening the task, which is what the redo-line grader catches.
