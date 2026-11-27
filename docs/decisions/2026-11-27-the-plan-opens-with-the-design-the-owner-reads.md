---
id: 2026-11-27-the-plan-opens-with-the-design-the-owner-reads
status: accepted
spec: 2026-11-27-plan-shows-design
date: 2026-11-27
---
# The plan opens with the part the owner reads to judge the design, and nothing else has to be read for the OK

## Context
In a project built with the pack, every feature had a plan and the owner's OK, and no plan showed a contract or a dependency. The plan was a few lines of approach and a list of paths, and the design sat in free-format reference files or only in the code. The owner found the architecture after it was built and corrected it there. He wanted to see it before any code, without a big file to read.

## Options
- A design document of its own, or a design skill with its own grilling: lost, as one more file to read and one more step, when the plan already gets the OK.
- A line limit on the owner's part, tried at about 40 lines: lost, since agents cut what mattered to fit it and argued about blank lines.
- A list of the choices the agent made, three lines each: lost after a trial on three real specs, where it made the plans two to three times longer and repeated the Approach.
- A diagram in every plan, and a diagram of which module depends on which: lost; the owner said that picture told him nothing.
- A stop in the build and a check at ship for code that leaves the agreed design: deferred, since no real build has left it yet.
- A practice of its own for diagrams, with a page per kind: parked after a trial, because of what it costs in context.
- The plan in two parts, with every line above the Scope written for the owner: won.

## Decision
Every line above the Scope of `plan.md` is the owner's part. The Approach is a list with one complete fact per line, and a decision is a line there when it changes what a user sees or can do, crosses a boundary or removes something. A contract is shown as code under a plain label only when it is new or its shape changes and it crosses a boundary. A diagram is drawn when three or more parts pass something to each other in an order, and not otherwise. What the agent could not read is marked "Not checked" where it appears. The Scope is a tree. One rule in docs-conventions covers any text the owner reads to decide. A fix that would add or alter a contract or a dependency is planned first, and spec-ship may take an architecture file from a plan section.

## Consequences
The owner reads more lines in the plan than before, about 20 to 45 in the cases against about 10, and reads one file where he read three. Whether a line reads well cannot be graded; the cases grade its visible signs and a person checks the rest. A rule that rests on the agent's judgment gave different results on different models: the diagram was drawn by one model and skipped by another until the rule named what the agent can see, so such rules are proven in the eval runner on the default model. The release rerun of whole suites cost more than it found and now covers the cases that changed. Both agents wrote a decision record before the owner's OK in the by-hand runs, which the pack does not yet settle. Watch for the Approach growing into paragraphs.
