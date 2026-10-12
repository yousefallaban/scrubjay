# Templates

Every file the skills write starts from one of these templates.

- `{{slot}}` is filled in by the skill that writes the file.
- `<!-- ... -->` comments are guidance for the skill. They are removed when the file is written, so project files never contain them.
- A section marked `optional` is deleted when it would be empty. Never leave it blank, and never write "None" or "TBD".
- Heading names are fixed. Agents find content by heading, so never rename one.
- `docs-format` in `index.md` records which template version a project uses. A template change applies to new files only.
- No template contains the product name, so any copy of the pack writes identical files.

| Template | Written by | Becomes |
| --- | --- | --- |
| `agents-block.md` | docs-init | the managed block in the root `AGENTS.md` |
| `index.md` | docs-init | `docs/index.md` |
| `behavior-capability.md` | docs-map, spec-ship | `docs/behavior/<domain>/<capability>.md` |
| `architecture/index.md` | docs-init, docs-map | `docs/architecture/index.md` |
| `architecture/<area>.md` | docs-map, spec-ship | `docs/architecture/<area>.md` |
| `decision.md` | any step that makes a lasting choice | `docs/decisions/<date-slug>.md` |
| `spec.md` | spec-start | `docs/specs/<id>/spec.md` |
| `plan.md` | spec-plan | `docs/specs/<id>/plan.md` |
| `tasks.md` | spec-plan, or spec-build when planning is skipped | `docs/specs/<id>/tasks.md` |

Slots in `agents-block.md`:

- `{{docs-path}}`: `docs`, or the subfolder chosen when `docs/` already serves a documentation site.
- `{{extra-never-write}}`: the folders of any Spec Kit, OpenSpec or Kiro setup found by docs-init, written as `, openspec/ or .kiro/specs/`. Empty when there are none.

Files with no template:

- Glossary: one line per term, sorted A to Z:
  `- **Term**: meaning in product language. Code: \`Name\`. Avoid: other words.`
  `Code` and `Avoid` are optional. Business rules never go in the glossary.
- Reference file: free format. The first line says what it is (`Purpose: ...`). After ship, a line above it says where it was promoted.
- Archive README (`docs/archive/<tool>/README.md`): two lines saying what was archived, when, and that it is history read during migration, never a place for new work.
