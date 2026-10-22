---
id: 2026-10-22-the-ship-ends-in-the-conversation-and-the-pull-request-comes-when-asked
status: accepted
spec: 2026-10-22-ship-ends-clean
date: 2026-10-22
---
# The ship's findings stay in the conversation, two kinds of finding stop the ship, and the pull request is made only when asked

## Context
A real ship with the pack ended in two files in a temporary folder, the review report and the PR body, because the skill was silent on where findings go and the agent's harness filled the silence. The PR description carried the grilling story, the follow-ups settlement and resolved findings, which the spec folder and git already hold. A claim the diff contradicted was a finding that the ship reported and then copied into behavior/ as true. The owner rejected a pack-made review format, labels, a reply-by-number protocol and native review commands inside the ship as customization that copies what the agents already do.

## Options
- A format of the pack's own for findings, with labels and numbered replies: lost, as a copy of the agents' native reviews that the pack would have to maintain.
- The agent's native review command as the fresh reviewer: parked, since nothing shows the contract checks survive inside it and the eval runner cannot grade a review that runs inside Codex; the AGENTS.md block carries the five checks so any reviewer reading it has them.
- Findings in the conversation in the agent's own form, a stop on a contradicted or untested claim, one question about the findings before any code or docs change, the removal and the docs as commits, and the pull request created or shown only when asked: won.
- Option questions at every ask in every skill: dropped before its first task, since every shape of it costs context on runs that ask nothing.

## Decision
spec-ship shows the fresh review's findings in the conversation and writes no file outside the repository; a contradicted or untested claim stops the ship; the ship names what blocks, what is optional and what will be removed, and asks fix, go on or stop; on go on the removal lands as its own commit and the docs as one commit `docs: ship <slug>`; then it asks whether to create the pull request or show its text, whose body is the repo's template or six parts with no Outcome.

## Consequences
The next step after a review is always a question with a default, and nothing of the pull request exists before the answer. Fix means spec-build reopens the task, so the ship repairs nothing. The follow-ups file keeps its lines and no question is asked about them or about the release impact. Trace graders in the eval cases anchor on fixture words, never on the skill's own text, which the first review found passing graders on its own. The create-or-show question cannot be graded in an eval session, which has no shell and so no `gh`; it is checked by hand. Watch for a weak test or a convention break shipping unfixed because go on is the easy answer; the pull request names them so the merger sees them.
