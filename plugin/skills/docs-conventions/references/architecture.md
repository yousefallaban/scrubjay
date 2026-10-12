Purpose: rules for `architecture/<area>.md`. Templates: `assets/architecture/<area>.md`.

Frontmatter: `area`, the area name. A title, then the area's own table or list. Current state only: no history, no plans. The why links to decision records.

Area files are created the first time they have content, never empty. `stack.md` exists from init, with the commands spec-build and spec-ship run. The folder listing is its own index.

| Area | Holds |
| --- | --- |
| `stack` | languages and frameworks, and the commands to install, run, test, lint and build |
| `conventions` | only the rules agents get wrong without being told: naming, error handling, test style |
| `boundaries` | modules: name, path, domain, what each may depend on |
| `data-model` | entities: name, key fields, relations |
| `contracts` | APIs and events: name, kind, input, output, consumers |
| `integrations` | external services: purpose, direction, auth, what the product does when it fails |
| `config` | settings and flags: name, purpose, default, where it's set; never real secret values |
| `invariants` | non-negotiable rules every spec must keep: ID, rule, why |

Written by docs-map for what a domain needs, and by spec-ship for the files plan.md lists under Architecture to update at ship.
