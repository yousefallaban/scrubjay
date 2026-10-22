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
- A question about what the code does now, or a doubt about a claim, is answered from the code and the tests that cover it, with the claim quoted beside the finding {#verifies-on-doubt}
  e.g. "I'm not sure the code rounds half up the way the docs say" -> the session reads `src/returns.ts` and its test, and answers with `returns/submit-return#partial-refund` and what the code does
- When the code disagrees with a claim, the session states the documented requirement and what the code does instead, and names the fix spec or offers to start one {#names-the-mismatch}
  e.g. the claim says half-up rounding and the code rounds with floating point -> "Documented: half-up (returns/submit-return#partial-refund). Code: one cent short on some inputs. No fix spec yet; start one?"
- docs-init makes sure a root CLAUDE.md imports AGENTS.md, creating a one-line CLAUDE.md when the repo has none, and ends by confirming the block loads in a new session {#links-claude-md}
  e.g. a repo with no CLAUDE.md under a parent folder that has one -> `CLAUDE.md` holds `@AGENTS.md`, and a new session shows the block in context
- When `docs/` already serves a documentation site, docs-init asks for a subfolder and records that path in the block {#docs-path}
  e.g. a repo with a docs site in `docs/` -> memory goes to `docs/project/`, and the block points there
- When Spec Kit, OpenSpec or Kiro files exist, docs-init adds their folders to the never-write list in the block and says so. Nothing is moved or imported {#existing-spec-tools}
  e.g. an `openspec/` folder -> the block lists it as never-write, and the folder is untouched
- Running docs-init again only refreshes the block between the markers {#rerun-safe}
  e.g. a rerun after a pack update -> the block text is updated, and no docs file changes
- The block tells a reviewer what a review on a spec branch checks: every claim has a test carrying its reference whose assertions prove it, nothing in the diff contradicts a claim, nothing lands outside plan.md's Scope, code no claim covers is removed at ship, and the rules in `architecture/conventions.md` and `invariants.md` hold {#block-names-review-checks}
