Purpose: rules for `index.md`. Template: `assets/index.md`.

Frontmatter: `product`, the product name; `docs-format`, the template version the project uses; `issue-tracker`, optional, the address a ticket key is appended to, such as `https://example.atlassian.net/browse/`, deleted when the team has none.

What it is: who uses the product and for what, in 2 to 4 sentences, in the user's words. Not a feature list.

Domains: a table with at least one row: domain, what it covers, owner. docs-init asks for the first row. spec-start and docs-map add a row the moment a new domain is named, before any go is asked. The owner is who says go for that domain; on a solo project, that is the user. A domain's behavior lives at `behavior/<domain>/`, so there is no link column.

Behavior: one line pointing at `behavior/`, so an agent that loads only what index.md links to finds the claims. Architecture: one line pointing at `architecture/`.

Nothing else: details of any domain belong in behavior/.
