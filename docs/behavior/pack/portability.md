---
capability: pack/portability
---
# Stay portable across agents

- Every skill is a SKILL.md that follows the Agent Skills standard, so any agent that supports the standard can load it {#agent-skills}
  e.g. the same `spec-start` folder loads in Claude Code and Codex
- The installed plugin is only the plugin folder: skills, templates, manifests, the plugin's README and its eval cases, never this repo's docs, checks or CI {#plugin-folder}
  e.g. after install, the installed plugin folder holds no `docs/specs/` and no `checks/` from this repo
- The product name appears only in the manifests and README files. Skills, templates and the project-memory markers carry no name {#name-neutral}
  e.g. a private copy named canon differs from scrubjay only in those files, and a project set up with one works with the other
- A skill that uses a feature only some agents have states what to do without it {#fallbacks}
  e.g. no sub-agents -> "open a fresh session for the review"; no question tool -> ask in plain text
- The portable and Claude manifests publish matching author, homepage and discovery keywords {#shared-plugin-metadata}
  e.g. a compatible client reads its manifest -> the publisher, project link and discovery terms agree
- Claude's manifest provides a packaged icon and documentation/support links for Anthropic's directory {#claude-listing-metadata}
  e.g. a directory reads the manifest -> the icon path resolves and the documentation and support links are present
