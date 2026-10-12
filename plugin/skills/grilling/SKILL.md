---
name: grilling
description: How to settle intent before any code. Question rounds where every question is answerable now and comes with a recommended answer, facts looked up in the code and docs instead of asked, and each answer written where it belongs the moment it settles. Loaded by spec-start, spec-plan and docs-map whenever something only the owner can answer is still open.
user-invocable: false
---

# Grilling

Settle what only the owner can settle, in rounds, and write each answer down as soon as it lands.

## Process

1. Before asking anything, look it up. The docs path's `index.md`, `glossary.md`, `behavior/`, `architecture/` and `decisions/`, then the code and its tests. A question the code or the docs can answer is never put to the owner; the answer is used and, when it matters, quoted with its source.
2. Ask in numbered rounds of 3 to 5 questions. Every question is answerable now, by the owner, from what they know. Each has the form: the question, one line on why it matters or what changes with a different answer, and `Recommended: <answer>`. The rounds move from the goal and who it is for, to scope and boundaries, to edge cases and data, to what is deliberately out.
3. Write each answer where its topic belongs the moment it settles, before the next round: the why and the what into `spec.md`, as claims in the claim format; the how into `plan.md` or a `reference/` file; a lasting choice into a decision record; a settled term into `glossary.md`, sorted. Nothing waits for the end of the interview.
4. Stop when nothing is left that only the owner can answer. What remains answerable from the code is looked up, not asked. When the owner is not in the session and questions remain, they go under Open questions in `spec.md`, each with its recommended answer, and the spec stays a draft until the owner answers.
5. Never ask filler, never ask twice, and never ask what the owner already said. A recommended answer is a real recommendation, not a hedge.

## Verification

- Every question in the transcript carries `Recommended:`.
- No question was answerable from the docs or the code.
- Every settled answer is in a file before the round after it.
- The interview ended with Open questions empty, or with each remaining question being one only the owner can answer.

## Rationalizations and red flags

| Excuse | Rule |
| --- | --- |
| "The answer is obvious, I'll assume it." | If only the owner can answer it, ask it, with the obvious answer as the recommendation. |
| "I'll ask everything in one big round to save time." | 3 to 5 per round. A wall of questions gets skimmed. |
| "Let me ask which database they use." | That is in `architecture/stack.md` or the code. Look it up. |
| "I'll write it all down at the end." | Each answer is written when it settles. A session can end at any moment. |
| "They said 'just build it', so no questions." | Open questions that only the owner can answer stay open, and the spec stays a draft. |

## Fallbacks

- No question tool: ask in plain text, numbered, with the recommended answers, and wait.
- No owner in the session: write the remaining questions under Open questions and stop.
