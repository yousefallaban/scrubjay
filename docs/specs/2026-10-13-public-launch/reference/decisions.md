Purpose: lasting choices for the public launch, recorded as they are made.

**D1. Separate owner review from checks.**
The review ruleset allows a repository administrator to bypass through a pull request. The check ruleset has no bypass. The owner is the only collaborator and cannot approve their own PR.
- Why: outsiders need approval, while owner-authored maintenance can still merge after passing checks.
- Revisit when: another maintainer joins.

**D2. Reuse the existing bird artwork without regeneration.**
GitHub gets the owner's Downloads JPEG. Codex gets a square SVG frame embedding the same JPEG, with paths under the plugin's assets directory.
- Why: the owner already supplied the artwork; a wide GitHub preview and a square Codex icon have different dimensions.
- Revisit when: the owner supplies a dedicated small icon.

**D3. Retain version 0.1.2 for the artwork change.**
The owner's explicit version request overrides the usual version-bump rule for this change.
- Why: this launch presents the current 0.1.2 release.
- Revisit when: the next release changes the plugin.
