Purpose: lasting choices for the requested repository-instruction cleanup.

**D1. Version comes from the plugin manifests.**
Use plugin/plugin.json as the source and verify plugin/.claude-plugin/plugin.json agrees. Do not derive a version from a branch or old spec.
- Why: the owner requested one current version source.

**D2. Repository branches use a change type and purpose.**
Use feature, fix, docs, chore or refactor, followed by one slash and a lowercase kebab-case purpose. The purpose maps to the active spec slug. Agent prefixes and version-only names are excluded.
- Why: the owner requested descriptive names and a rule that does not identify an agent.

**D3. Remove the standalone roadmap.**
Future work agreed with the owner gets a spec. Remove the current file and active links; historical specs and append-only decisions keep their original references as history.
- Why: the owner does not want a second planning document.

**D4. Rename the existing work branch and replace its PR.**
Rename the local and remote branch to chore/public-repo-setup. Create a replacement PR with the same commits, link the prior PR, and never merge it.
- Why: GitHub closes an open PR when its head branch is renamed.
