---
id: 2026-10-13-no-slop
kind: feature
status: draft
summary: Shipping removes code no claim covers, and every file the pack writes is in plain words
request: apply what the talk on code slop and the stop-slop skill get right, without an anti-slop section in every skill
approved: {by: yousef, via: in session}
---
# No slop: uncovered code is removed, docs are written plain

## Why
The fresh review at ship already finds code that no claim covers, a helper, a return value, a parameter nobody asked for, and in both dogfood runs it did. Then the finding goes into the pull request and the code ships anyway. That is how a codebase rots one unasked-for line at a time: a lazy addition becomes precedent, precedent becomes architecture. The documents the pack writes have a smaller version of the same problem: the free text in a Why, a decision or a pull request can carry the tells of machine writing, openers that announce, hedges, jargon, and a reader stops trusting the file.

## What changes

### Add · spec/ship
- spec-ship removes code the diff has that no claim covers, unless the owner adds a claim for it and says go, and the pull request names what was removed or claimed {#no-uncovered-code}
  e.g. an exported `clearWishlist` with a test that carries no claim reference -> deleted before any docs change, and listed under Review as removed

### Add · practice/docs-conventions
- Every file the pack writes is in plain words: no opener that announces what follows, no hedge or intensifier, no jargon, no em dash, no rhetorical setup, active voice, one idea per sentence, specifics over adjectives {#plain-writing}
  e.g. a Why that opens "In today's fast-paced world, it's worth noting that" -> rewritten as the problem, who has it and what it costs, in two to five lines

## Not doing
- A score or a rubric for writing. The templates and their limits are the gate.
- A ban on every adverb. "A return never covers more than the order holds" keeps its adverb.
- Bundling stop-slop or any other pack's skill. They stack on their own.
- A code-style rule in spec-build. Code quality skills stack; the pack holds the workflow.
