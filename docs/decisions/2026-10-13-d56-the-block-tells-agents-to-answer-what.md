---
id: 2026-10-13-d56-the-block-tells-agents-to-answer-what
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-13
---
# The block tells agents to answer what the product does from behavior/ and to open the code only to change it

## Context
Extends D24's block. The by-hand check on Claude Code found the block alone was not enough: the agent read the behavior file first, cited the claim, then opened the code to compare, three runs out of three. One bullet added to the block, and the next run answered from the docs and said so, with no code read. Codex had already done so after D55.

## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
The block tells agents to answer what the product does from behavior/ and to open the code only to change it.

## Consequences
Why: bet A is only worth something if a documented answer stops the agent from re-deriving it. The bullet states the rule the block implied.
Revisit when: a release check shows agents still opening the code for documented behavior.
