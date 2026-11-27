Purpose: draft of the plan template this spec builds, for `plugin/skills/docs-conventions/assets/plan.md`.

````markdown
---
spec: "{{spec id}}"
---
## Approach
<!-- required: the shape of the solution, in 3 to 8 lines. Don't restate the why. -->

## Contracts
<!-- when the change adds or alters what another module or system calls or reads:
exported types and signatures, component props, endpoints, events, schema.
Code in the project's language, changed members only. Never internal helpers. -->

## Dependencies
<!-- when the change adds or alters a dependency between modules.
One mermaid flowchart, about ten nodes at most. -->

## Picks
<!-- every choice made for the owner, one line each:
<the choice> over <the alternative>, because <the reason>.
A choice that outlives the spec links to its decision record. -->

<!-- The owner reads down to here: about 40 lines at most. Below is what the build works from. -->

## Scope
<!-- required: the folders or files the change may land in; a folder covers everything under it. -->
{{path}}    {{new | changed | deleted}}: {{one-line reason}}

## Architecture to update at ship
<!-- optional: each area file, from the plan section or the reference file it comes from. -->
- {{area}}.md, from {{Contracts | Dependencies | reference/<file>}}

## Rollout
<!-- optional: only when order matters. -->

## Risks
<!-- optional: what could break, and which claim or test covers it. -->
````

The owner's part is every line above `## Scope`. A plan written with a Trade-offs heading is read as Picks.
