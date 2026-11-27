Purpose: lasting choices made while specifying and building plan-shows-design, appended as they are made, never edited.

## D1 The design lives in the plan, in a part written for the owner
2026-11-27. The owner's OK has to cover the architecture, and Yousef does not want a big file to read without a real benefit. So the plan opens with what he reads to say OK, the approach, the contracts, the dependencies and the picks, capped at about 40 lines, and what the agent builds from, the Scope, the architecture files to update, rollout and risks, comes after it. A separate design document was not chosen: it would be one more file to read and one more OK. The cap sits on the owner part only, since a Scope with many rows is for the build and the review. A section with nothing to show is left out, as the conventions already require.

## D2 Three parts of the other team's design guide are left out
2026-11-27. The guide Yousef liked also has an observability table, a critical-code section, sequence diagrams and a separate agent that grills the person on the written design and ends in a fixed summary. He kept the contracts as code, the dependency view and the list of picks. The table applies only to services with metrics and would be an empty heading in most plans. The grilling skill that exists takes the useful idea, questioning a written draft, without a second skill. Sequence diagrams and critical code wait until a real plan shows the need. How a question is put stays with the agent; the skill says what must be asked.

## D3 The dependency view is one mermaid flowchart
2026-11-27. Plain arrows in a text block were the other option. Yousef chose mermaid, held to about ten nodes: it renders as a picture on GitHub and in the apps he reads plans in, and its source still reads as arrows where it does not render. One diagram, so the owner's part stays short.

## D4 A contract is what another module or system calls or reads
2026-11-27. Exported types and function signatures, component props, endpoints, events and schema. A module's internal helpers are not contracts and stay out of the plan. The line follows what the owner corrects in practice: the surface other code depends on, which is costly to change once it is built on.

## D5 A fix that changes the design gets a plan
2026-11-27. A fix has no plan, and a refactor is a fix, so a change that moves a contract or a dependency could reach the build with nothing shown. Yousef chose that such a fix gets a plan with the owner's part and waits for the OK. Every other fix stays one pass.

## D6 The build asks before leaving the design, and the ship review checks it
2026-11-27. Without both, the OK would cover a design the code is free to leave. spec-build asks before a contract or a dependency the plan does not show, as it does for a path outside the Scope, and on yes the plan is updated. The answer changes neither `spec.md` nor the Scope, so no task recheck follows. The fresh reviewer reports both directions: in the diff and not in the plan, in the plan and not in the diff.

## D7 An architecture file may come from a plan section
2026-11-27. With the design in the plan, an entry under Architecture to update at ship names a plan section or a reference file. Copying the Contracts into a reference file only to name it would be text nobody reads.

## D8 Two picks of the agent's, shown at the go
2026-11-27. Not asked as questions, listed for Yousef beside the request for the go. A design finding does not stop the ship: the two findings that stop it protect what `behavior/` asserts about the product, and a design drift does not make a claim false. The AGENTS.md block gains no line: a block change makes every project rerun docs-init, and the check runs in spec-ship either way.
