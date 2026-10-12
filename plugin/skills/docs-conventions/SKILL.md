---
name: docs-conventions
description: The file charter and the claim format for a project's memory in docs/. Load before writing or changing any file under docs/, the index, glossary, behavior, architecture, decisions, specs, plans, tasks or reference files, and before editing the project-memory block in AGENTS.md. It says which file holds what, what each never contains, where misplaced content goes, and how a claim is written.
user-invocable: false
---

# Docs conventions

Project memory lives under the docs path the project-memory block in AGENTS.md names, `docs/` unless the block says otherwise. Every file has one job. Content that matches a file's "never contains" column goes to the file the charter names for it.

## Process

1. Find the file's row in the charter. Read its reference under `references/` for the sections and their rules, and start from its template under `assets/`.
2. Write only what the file's job covers. Move anything else to the file the row names.
3. Remove every `<!-- -->` guidance comment. Delete an optional section that would be empty. Never write "None" or "TBD". Keep heading names and their order exactly as the template has them.
4. Keep the frontmatter keys the template has, with no comments in the frontmatter. A quoted slot such as `id: "{{slug}}"` is filled without the quotes, unless the value needs them to stay valid YAML.
5. Write claims in the claim format below, 3 to 7 per capability.

## The charter

| File | Job | Contains | Never contains, and where that goes | Template | Reference |
| --- | --- | --- | --- | --- | --- |
| `index.md` | map of the product and its docs | what it is, the domains with their owners, where things are | details of any domain: `behavior/` | `assets/index.md` | `references/index.md` |
| `glossary.md` | shared words | term, meaning, name in code, words to avoid | rules or behavior: `behavior/` | none, one line per term | `references/glossary.md` |
| `behavior/<domain>/<capability>.md` | what the product does now | claims with IDs, one example each | how it's built: `architecture/`; history: git; plans: `specs/` | `assets/behavior-capability.md` | `references/behavior.md` |
| `architecture/<area>.md` | how it's built now | one area per file, created when it first has content | behavior: `behavior/`; history: git; plans: `specs/` | `assets/architecture/` | `references/architecture.md` |
| `decisions/<date>-<slug>.md` | why a lasting choice was made | context, options, decision, consequences | step-by-step detail: `plan.md` or `reference/` | `assets/decision.md` | `references/decision.md` |
| `specs/<id>/spec.md` | why this change, and exactly what changes | why, claims under Add, Change and Remove, not doing, open questions | how it's built: `plan.md`; progress: `tasks.md` | `assets/spec.md` | `references/spec.md` |
| `specs/<id>/plan.md` | how this change is built | approach, files to touch, architecture to update at ship, risks | the why: `spec.md`; progress: `tasks.md` | `assets/plan.md` | `references/plan.md` |
| `specs/<id>/tasks.md` | where the work stands | session lines, tasks with the claims that prove them, short notes | design discussion: `plan.md` or `decisions/` | `assets/tasks.md` | `references/tasks.md` |
| `specs/<id>/reference/*` | working material for this spec | anything the spec needs, opening with `Purpose: ...` | the why, the plan, progress: the three files above | none | `references/reference.md` |
| AGENTS.md block | the workflow and where memory lives | the managed block between the markers | project knowledge: `docs/` | `assets/agents-block.md` | `references/agents-block.md` |

## The claim format

```
- <Actor> <does or sees something observable, present tense> {#claim-id}
  e.g. <a concrete situation> -> <the observable result>
```

One testable sentence per claim, then one concrete example. IDs are kebab-case and unique within their capability. The full reference is `domain/capability#claim-id`; tests carry it in their names, and tasks use it whenever the bare ID is not unique in the spec. Observable behavior only: "keeps one entry", never "uses a unique index". A claim in `spec.md` reads exactly as it will in `behavior/`, so shipping copies it without rewording.

## Versions

`index.md` carries `docs-format`. A template change applies to new files only. Shipped specs and existing files are never rewritten to a newer format.

## Verification

- The file has the template's frontmatter keys and headings, in the template's order, and no `<!-- -->` comment anywhere.
- No section is empty, and "None" and "TBD" appear nowhere.
- Every claim has an ID and an `e.g.` line, and a capability has 3 to 7 of them.
- Nothing in the file matches its "never contains" column.
