---
capability: pack/quality
---
# Prove the pack works

- Each skill has at least 3 cases that should trigger it, 2 that should not, and 1 behavior case, stored once as plain prompt and grader files, plus a scaffold script where the case needs a repo state. The behavior case covers the claim the skill can only instruct, not enforce {#case-minimum}
  e.g. "customers should be able to save items for later" triggers spec-start; "what does this regex do?" triggers nothing; docs-init's behavior case scaffolds an AGENTS.md with a client's rules and checks they are unchanged outside the markers
- Before v0.1 is released, every case passes on Claude Code through its eval command, and each command has been run once by hand on Codex {#two-agents}
  e.g. a trigger case that fails on Claude Code, or a command that doesn't load on Codex, blocks the release
- The claims the block drives, answers-from-docs, resumes, verifies-on-doubt and names-the-mismatch, are checked by hand on `scrubjay-example` on both agents before release, and the transcripts are kept, since eval runs load no project instructions {#block-cases}
  e.g. a fresh Codex session on `add-wishlist` reports "T3 is next" unprompted -> the transcript is saved under the case
- Static checks run without any agent installed, and CI runs them on every pull request: skill frontmatter, manifests against their published formats, templates that parse and exist where docs-conventions lists them, the product name only in allowed files, and internal links that resolve {#static-checks}
  e.g. a PR with a SKILL.md missing its description -> CI fails on a machine with no agent CLI
