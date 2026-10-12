---
product: {{product name}}
docs-format: 1
---
# {{Product name}}

## What it is
<!-- required: who uses the product and for what, in 2 to 4 sentences. Not a feature list. -->

## Domains
<!-- required: one row per domain. docs-map or spec-ship adds a row when a domain is added. -->
| Domain | Covers | Owner | Behavior |
| --- | --- | --- | --- |
| {{domain}} | {{what it covers}} | {{person or team}} | [behavior/{{domain}}/](behavior/{{domain}}/) |

## Architecture
See [architecture/index.md](architecture/index.md).

## Company knowledge
<!-- optional: links only, never copies. Delete if the project has none. -->
- Company docs: {{link to the company docs repo}}
- Company skills: {{names of the company skills that apply}}

## Existing spec tools
<!-- optional: written by docs-init when it finds Spec Kit, OpenSpec or Kiro files. Delete if none.
New work never goes into these folders (they are on the AGENTS.md never-write list);
docs-map reads them as input when it maps a domain. Nothing is bulk-imported. -->
| Tool | Choice | Location |
| --- | --- | --- |
| {{Spec Kit, OpenSpec or Kiro}} | {{archived on YYYY-MM-DD, or left in place}} | {{docs/archive/<tool>/, or the original folders}} |
