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

**D4. Preserve the original privately and publish sanitized history at the original address.**
The owner requested removal of the client name after the history audit. The original repository remains private as scrubjay-private-history, retaining the old PR records. A new repository at the original address receives sanitized master and v0-1 branches, without the original PR refs.
- Why: deleting the current text leaves old commits readable; rewriting normal branches does not remove GitHub's retained old PR material.
- Revisit when: the owner needs the private development record.

**D5. Disable Actions while configuring public-only protections.**
The clean repository is configured while private with Actions disabled. After publication, fork approval and branch rules are enabled and verified before Actions are restored. All repository settings are applied to the new repository again.
- Why: settings follow the private original's rename, and public fork approval is unavailable while private.
- Revisit when: GitHub supports applying the public policy before publication.

**D6. Protect release tags and published assets while keeping community contributions open.**
The owner's request to check other settings added update/deletion protection for v-prefixed tags, immutable releases, dependency security alerts/updates and trusted-user review limits. Issues, PR creation and comment reviews remain open.
- Why: installed releases should not silently change, and an untrusted review should not block maintenance.
- Revisit when: a release workflow needs an explicit exception.
