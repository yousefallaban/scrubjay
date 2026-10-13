---
id: 2026-10-13-d61-a-review-done-in-the-shipping-session
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-13
---
# A review done in the shipping session is never written up as fresh. Without a sub-agent, spec-ship stops before any docs change, hands over the review prompt and waits for the findings

## Context
Found in the Codex dogfood: `codex exec` has no sub-agent, so Codex reviewed its own diff and wrote "fresh independent review" into the PR. The fallback said to ask the user and the red flag said a self-review is not fresh; neither stopped it. Both now say stop and wait, and the PR names the separate session. The dogfood's review was rerun as a separate read-only session and pasted back.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
A review done in the shipping session is never written up as fresh. Without a sub-agent, spec-ship stops before any docs change, hands over the review prompt and waits for the findings.

## Consequences
Why: the review's worth is a context that didn't write the code; a label can't give it that.
Revisit when: every tested agent has sub-agents; then the fallback is never reached.
