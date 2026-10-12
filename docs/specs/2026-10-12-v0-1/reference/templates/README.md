# Templates

Every file the skills write starts from one of these templates. In the pack they live under `assets/` in the docs-conventions skill. A command skill never names a template path; it loads docs-conventions and writes from the template for that file, so a skill works the same whether the pack is installed whole or one skill is copied.

- `{{slot}}` is filled in by the skill that writes the file.
- `<!-- ... -->` comments are guidance for the skill. They are removed when the file is written, so project files never contain them. Frontmatter carries no comments; its rules are below.
- A section marked `optional` is deleted when it would be empty. Never leave it blank, and never write "None" or "TBD".
- Heading names are fixed. Agents find content by heading, so never rename one.
- `docs-format` in `index.md` records which template version a project uses. A template change applies to new files only.
- No template contains the product name, so any copy of the pack writes identical files.

| Template | Written by | Becomes |
| --- | --- | --- |
| `agents-block.md` | docs-init | the managed block in the root `AGENTS.md` |
| `index.md` | docs-init; spec-start and docs-map add domain rows | `docs/index.md` |
| `architecture/stack.md` | docs-init (Commands), docs-map (the rest) | `docs/architecture/stack.md` |
| `architecture/<area>.md` | docs-map, spec-ship | `docs/architecture/<area>.md`, created when an area first has content |
| `behavior-capability.md` | docs-map, spec-ship | `docs/behavior/<domain>/<capability>.md` |
| `decision.md` | any step that makes a lasting choice | `docs/decisions/<date-slug>.md` |
| `spec.md` | spec-start | `docs/specs/<id>/spec.md` |
| `plan.md` | spec-plan | `docs/specs/<id>/plan.md` |
| `tasks.md` | spec-plan, or spec-build when planning is skipped | `docs/specs/<id>/tasks.md` |

Frontmatter rules:

- `spec.md`: `status` is `draft`, `building` or `shipped`; the owner's go is never a status. `issue` is optional and the line is deleted when there is none. At the owner's go, add `approved: {by: <owner>, via: <in session, a message link, or a PR>}`; record a go only when the user reports one, never infer it, and git dates the line. After a change to Why or What changes, remove the line; the owner's new go writes it back.
- `decision.md`: `status` is `accepted` or `superseded by <id>`. A decision is never edited once accepted; a new one supersedes it, and only the old one's status changes.

Slots in `agents-block.md`:

- `{{docs-path}}`: `docs`, or the subfolder chosen when `docs/` already serves a documentation site.
- `{{extra-never-write}}`: the folders of any Spec Kit, OpenSpec or Kiro setup found by docs-init, written as `, openspec/ or .kiro/specs/`. Empty when there are none.

Files with no template:

- Glossary: one line per term, sorted A to Z, created when the first term settles:
  `- **Term**: meaning in product language. Code: \`Name\`. Avoid: other words.`
  `Code` and `Avoid` are optional. Business rules never go in the glossary.
- Reference file: free format. The first line says what it is (`Purpose: ...`). It is never edited at ship.
