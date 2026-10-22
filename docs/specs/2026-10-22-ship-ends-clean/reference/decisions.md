Purpose: lasting choices made while specifying and building ship-ends-clean, appended as they are made, never edited.

## D1 The review keeps the agent's own form; the pack defines no finding format
2026-10-22. Labels, a fixed list shape and a reply-by-number protocol were proposed and Yousef rejected them as customization that copies what Codex and Claude Code already show. The pack says what the review checks and what the ship does with each kind of finding; how the findings look is the agent's. The cases grade content and consequences, not layout.

## D2 Native review commands stay out of the ship for now
2026-10-22. `codex review --base <branch>` takes custom instructions and Claude's `/code-review` reads CLAUDE.md, so either could run the contract checks in the agent's native review. Whether the checks survive inside those modes is unproven, and the eval runner cannot grade a review that runs inside Codex. The sub-agent reviewer stays the default, measured at 1.00. The block carries the five checks so a reviewer that reads AGENTS.md, including the GitHub-side reviews of both vendors, has them at no cost to the pack.

## D3 Two kinds of finding stop the ship
2026-10-22. A claim the diff contradicts and a claim with no test carrying its reference stop the ship before any docs change, because a claim copied into behavior/ while the code disagrees makes the memory assert what the code does not do. A weak test, a convention break and a change outside the Scope ship as they are, named in the PR, unless the user says fix. Uncovered code is still removed without asking, as decided on 2026-10-13.

## D4 The pull request drops the Outcome; follow-ups stay in their file
2026-10-22. The spec folder holds the request and the claims, and `reference/follow-ups.md` holds deferred lines as state, so the PR no longer retells either and the follow-ups question and the release-impact question go. One question remains at the end: open the pull request or stop.

## D5 Version 0.5.0
2026-10-22. A claim is removed, which the pack's own scheme calls MAJOR; before 1.0 the minor number carries it.

## D6 Fix means reopen
2026-10-22. The ship repairs nothing. "fix" on a finding is a request about finished work, which the 0.4.0 rule already answers: the task that built the code is reopened with a redo line, built and ticked, and the ship runs again.

## D7 The pull request is created or shown only when asked, after a decision point on the findings
2026-10-22. Supersedes the single end question in D4. Yousef: the pull request is the result of the ship and nothing of it is generated until he asks. After the review the ship says what blocks and what is optional, suggests fix or leave for each optional finding, and asks fix, go on or stop; on go on the docs land in one commit and the ship asks create or show. Two questions, each where there is something to decide, and the body is never printed unasked.

## D8 The option-question spec is dropped for now
2026-10-22. asks-with-options, planned as a sentence at every ask in six skills, was dropped before its first task: every shape of it costs context on runs that ask nothing, and the pack adds text only on evidence from real use. If the five asks left in the flow still read clumsy after this spec has shipped a real change, it returns as a ten-line practice loaded only at an ask.

## D9 The question comes before the removal, and a removal is its own commit
2026-10-22. The fresh review of this spec found that step 6 removed uncovered code before step 7 could stop on a contradiction, and that the docs commit never carried the removal, so a created pull request could say "Removed at ship" about code still on the branch. The order is now: findings, the one question, then on go on the removal as `refactor: remove <what>, no claim covers it`, then the docs. A stop leaves the branch as it was.

## D10 A trace grader never matches the skill's own words
2026-10-22. The skill text is in the transcript the moment the skill loads, so a grader that looks for a phrase the skill contains passes without the agent doing anything. Every trace grader in this spec anchors on something only the fixture has, a claim ID, a task number, a file name, or on a question mark the skill's text does not carry.

## D11 The pull request question is proven by hand, the no-gh path by eval
2026-10-22. An eval session has no shell and so no `gh`, which is exactly the case where the skill shows the text without asking. A case that waited for the create-or-show question therefore failed on the skill's own fallback, in two runs of three. The case now grades the no-gh path, the text coming after the docs commit, and the question is checked by hand on the example repo where `gh` exists.

## D12 Two claims reworded with the owner's go after the second review
2026-10-22. The second fresh review found two rules in the skill with no claim behind them, both from the first review's fix: a removal lands as its own commit, and no code changes before the answer to the findings question. Yousef said go to carrying them into the claims: `ships-in-one-commit` now says the docs commit follows any removal commit, and `asks-after-review` says no code and no docs change before the answer. The follow-ups sentence that said more than the spec allows went back to "the lines stay as deferred work".

## D13 The pull request is opened with whatever GitHub access the agent has
2026-10-22. The claim and the skill named `gh`, one vendor's tool, while the Codex and Copilot apps open pull requests through their own GitHub connections and a sandboxed Codex may have no `gh` at all. Yousef said go: create means push and open with what the agent has, `gh` or the app's connection, and with neither the text is shown. The question to the user is unchanged.
