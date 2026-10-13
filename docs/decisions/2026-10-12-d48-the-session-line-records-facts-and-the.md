---
id: 2026-10-12-d48-the-session-line-records-facts-and-the
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The session line records facts, and the re-explain count comes from the user at ship

## Context
Supersedes the session line in D31. Each session writes the date, where it resumed, and the gist of the user's first message. spec-ship asks the user which sessions needed re-explaining and puts that count in the PR description.

## Options
- The choice in D31: replaced by this one

## Decision
The session line records facts, and the re-explain count comes from the user at ship.

## Consequences
Why: "whether it needed re-explaining" was the agent grading itself, and the kill-or-rethink rule keys on that number.
Revisit when: a transcript-based measure exists that needs no one's verdict.
