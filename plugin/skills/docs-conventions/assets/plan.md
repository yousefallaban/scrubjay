---
spec: "{{spec id}}"
---
## Approach
<!-- required: the shape of the solution, in 3 to 8 lines. Don't restate the why. -->

## Contracts
<!-- when the change adds or alters what another module or system calls or reads:
exported types and function signatures, component props, endpoints, events, schema.
Code in the project's language, changed members only. Never internal helpers. -->

## Dependencies
<!-- when the change adds or alters a dependency between modules.
One mermaid flowchart, about ten nodes at most, an arrow from the module that depends. -->

## Picks
<!-- when a choice was made for the owner without asking. One line each:
{{the choice}} over {{the alternative}}, because {{the reason}}.
A choice that outlives the spec links to its decision record. -->

<!-- The owner reads down to here to say OK: about 40 lines at most.
What follows is what the build works from. -->

## Scope
<!-- required: the folders or files the change may land in; a folder covers everything under it.
This is where the build may write without asking and what the review checks the diff against. -->
{{path}}    {{new | changed | deleted}}: {{one-line reason}}

## Architecture to update at ship
<!-- optional: when an architecture area changes. spec-ship updates exactly these files,
each from the plan section or the reference file it names. -->
- {{area}}.md, from {{Contracts | Dependencies | reference/<file>}}

## Rollout
<!-- optional: only when order matters. Migrations, feature flags, deploy order, data backfills. -->

## Risks
<!-- optional: what could break, and which claim or test covers it. -->

<!-- An owner's part past about 40 lines means the change is too big, or it holds detail
the OK does not need, which belongs in reference/. -->
