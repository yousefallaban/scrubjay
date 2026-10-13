---
capability: docs/init
---
# Set up project memory

- docs-init creates `index.md`, with what the product is, at least one domain with its owner, and the issue tracker's address when the team has one, and `architecture/stack.md` with the project's commands. The other files and folders are created on first write {#creates-skeleton}
  e.g. a repo with no `docs/` -> `index.md` says what the product is in the user's words, lists `returns · Sanne` and `issue-tracker: https://example.atlassian.net/browse/`, and `stack.md` holds the install and test commands
- docs-init writes the project-memory block into the root AGENTS.md between its markers, leaves everything outside the markers untouched, and names any nested AGENTS.md it finds, since the block is root-only {#writes-block}
  e.g. an AGENTS.md holding a client's own rules -> those rules stay exactly as they were, the block is added, and `packages/api/AGENTS.md` is listed as not covered
- With the block in place, a new session answers a question about a documented capability from `behavior/` and cites the claim reference, without reading the code {#answers-from-docs}
  e.g. "how are partial refunds calculated?" -> the answer cites `returns/submit-return#partial-refund` and opens no source file
- docs-init makes sure a root CLAUDE.md imports AGENTS.md, creating a one-line CLAUDE.md when the repo has none, and ends by confirming the block loads in a new session {#links-claude-md}
  e.g. a repo with no CLAUDE.md under a parent folder that has one -> `CLAUDE.md` holds `@AGENTS.md`, and a new session shows the block in context
- When `docs/` already serves a documentation site, docs-init asks for a subfolder and records that path in the block {#docs-path}
  e.g. a repo with a docs site in `docs/` -> memory goes to `docs/project/`, and the block points there
- When Spec Kit, OpenSpec or Kiro files exist, docs-init adds their folders to the never-write list in the block and says so. Nothing is moved or imported {#existing-spec-tools}
  e.g. an `openspec/` folder -> the block lists it as never-write, and the folder is untouched
- Running docs-init again only refreshes the block between the markers {#rerun-safe}
  e.g. a rerun after a pack update -> the block text is updated, and no docs file changes
