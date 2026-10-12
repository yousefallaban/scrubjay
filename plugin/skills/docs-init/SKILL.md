---
name: docs-init
description: Set up project memory in a repository. Creates docs/index.md and docs/architecture/stack.md from the templates, writes the project-memory block into the root AGENTS.md between its markers, and makes sure CLAUDE.md imports AGENTS.md. Use when a user asks to initialize, set up or add project memory, the docs layer or the spec workflow to a repo, or runs docs-init. A rerun refreshes only the block.
---

# docs-init

Sets up the docs layer once and refreshes the block on a rerun. It never maps the product: `behavior/`, `glossary.md` and `decisions/` grow through docs-map and the spec commands.

## Process

1. Load docs-conventions. Its `references/index.md`, `references/architecture.md` and `references/agents-block.md` hold the rules for the three files this command writes, and its `assets/` hold their templates.
2. Find the docs path. If the root AGENTS.md already has a project-memory block, read the path from it. Otherwise it is `docs`, unless `docs/` already serves a documentation site, which a `mkdocs.yml`, a Docusaurus or Sphinx config, or an `index.html` under it gives away. Then ask for a subfolder and recommend `docs/project`.
3. Decide first run or rerun. If `<docs-path>/index.md` exists, this is a rerun: skip to step 7 and touch no docs file.
4. Look before asking. Read the README and the package or build files for the product name and the install, run, test, lint and build commands. List any `.specify/`, `specs/`, `openspec/` or `.kiro/specs/` folder, any AGENTS.md below the root, and whether a root CLAUDE.md exists. None of this is asked.
5. Ask what only the user knows, in one numbered round with a recommended answer each: what the product is in 2 to 4 sentences, when the README doesn't say; the first domain and its owner, the user on a solo project; the issue tracker's address, if the team has one; and a confirmation of the detected commands. If the request already gives these facts, don't ask.
6. Write the two files from their templates, every guidance comment removed, no empty section: `<docs-path>/index.md` with what it is, the Domains table, and `issue-tracker` only when given; `<docs-path>/architecture/stack.md` with the Commands table and only the rows that have a command. Create no other file and no empty folder.
7. Write the block into the root AGENTS.md from `assets/agents-block.md`. Fill `{{docs-path}}`, and `{{extra-never-write}}` with the spec-tool folders found, as `, openspec/ or .kiro/specs/`, else nothing. If the file has the markers, replace only what is between them. If it exists without markers, append the block at the end. If it doesn't exist, create it with a one-line title and the block. Everything outside the markers stays exactly as it was. The block is root-only; nested AGENTS.md files are named in the report, not written.
8. Make sure the root CLAUDE.md imports AGENTS.md: add a line `@AGENTS.md` at the top of an existing one that lacks it, or create a CLAUDE.md holding only that line. Claude Code reads a CLAUDE.md anywhere above the repo in place of AGENTS.md, so the import is needed even when the repo had no CLAUDE.md of its own.
9. Report what was written, the never-write folders, the nested AGENTS.md files the block doesn't cover, and the spec-tool folders left exactly where they were. Then ask the user to confirm the block loads: a new session asked "where does project memory live?" answers with `<docs-path>/index.md`.

## Verification

- `<docs-path>/index.md` has at least one domain row and `docs-format`. `stack.md` has a test command.
- The root AGENTS.md holds the markers exactly once, and a diff shows no change outside them.
- CLAUDE.md contains `@AGENTS.md`.
- No `<!--` guidance, no "None" and no "TBD" in the two docs files.
- On a rerun, only the text between the markers changed.

## Fallbacks

- No question tool: one plain-text message with the numbered questions and their recommended answers, then wait.
- No way to start a session from here: give the user the one question to ask in a new session and the answer to expect.
