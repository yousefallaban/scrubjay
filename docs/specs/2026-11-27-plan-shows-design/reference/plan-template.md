Purpose: the plan template this spec builds, as it stands in `plugin/skills/docs-conventions/assets/plan.md`.

````markdown
---
spec: "{{spec id}}"
---
## Approach
<!-- required: what will be built, as a list with one complete fact per line, as many lines as
the owner needs to judge. Start each line with the thing it is about, in bold. Product words; a code name
only to find the thing. A decision is a line here when it changes what a user sees or can do,
crosses a boundary, or removes something. Where the route is not the obvious one, give the reason
in the same line. Where a line rests on something that could not be read from the code, end it
with **Not checked:** and what was assumed. No list of choices and no options that were not taken. -->

## How it works
<!-- only when a picture explains the change faster than text: three or more modules or outside
services pass something to each other in an order. One mermaid diagram of the kind that fits the case. Numbered steps where there is an order, a plain label on every arrow,
boxes named in product words. Never a picture of which module imports which. -->

## Contracts
<!-- when a contract is new or its shape changes, and it crosses a boundary: what a module
offers another module, what the product exchanges with the outside, or something shared that
other code already uses. One small code block per boundary, under a plain label that says
what it is and who uses it. Changed members only. A move or a removal is one line in the
Approach. A field that could not be read from the code is marked `// not checked`. -->

## Scope
<!-- required: a tree in a text block. A shared folder is written once, one path per line.
After the path comes + for new, ~ for changed or - for deleted, then a reason of a few words.
A folder covers everything under it. -->
```text
{{folder}}/
  {{file or folder}}  {{+ | ~ | -}} {{reason of a few words}}
```

## Architecture to update at ship
<!-- optional: each area file, from the plan section or the reference file it comes from. -->
- {{area}}.md, from {{Contracts | reference/<file>}}

## Rollout
<!-- optional: only when order matters. -->

## Risks
<!-- optional: what could break, and which claim or test covers it. -->
````

The owner's part is every line above `## Scope`. A plan written with a Trade-offs heading stays valid, and one with flat Scope lines or a Files heading is read as the tree.
