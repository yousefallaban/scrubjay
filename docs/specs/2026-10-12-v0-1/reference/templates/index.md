---
product: "{{product name}}"
docs-format: 1
issue-tracker: "{{address a ticket key is appended to, such as https://example.atlassian.net/browse/}}"
---
# {{Product name}}

## What it is
<!-- required: who uses the product and for what, in 2 to 4 sentences. Not a feature list. -->

## Domains
<!-- required, at least one row: docs-init asks for it. spec-start and docs-map add a row the moment a new domain is named.
The owner is who says go for that domain; on a solo project, that is you. A domain's behavior lives at behavior/<domain>/. -->
| Domain | Covers | Owner |
| --- | --- | --- |
| {{domain}} | {{what it covers}} | {{person or team}} |

## Architecture
See [architecture/](architecture/): one file per area, `stack.md` first.
