---
area: boundaries
---
# Boundaries

| Module | Path | Domain | May depend on |
| --- | --- | --- | --- |
| the pack | `plugin/` | what users install | nothing outside itself |
| command skills | `plugin/skills/{docs-init,docs-map,spec-start,spec-plan,spec-build,spec-ship}/` | docs, spec | docs-conventions, grilling |
| practices | `plugin/skills/{docs-conventions,grilling}/` | practice | nothing |
| templates | `plugin/skills/docs-conventions/assets/` | practice | nothing; reached only through docs-conventions |
| eval cases | `plugin/evals/` | pack quality | the skills they test, `checks/fixture-webshop.sh` copied in |
| manifests | `plugin/plugin.json`, `plugin/.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json`, `.agents/plugins/marketplace.json` | setup | nothing |
| static checks | `checks/` | pack quality | the pack's files, read-only |
| by-hand protocols | `checks/by-hand/` | pack quality | `scrubjay-example`, a separate repo |
| this repo's memory | `docs/` | the pack's own specs | nothing in `plugin/` |
