---
name: docs-map
description: Document one domain of an existing product the first time work touches it. Reads that domain's code and tests, drafts 3 to 7 claims per capability with an example each, plus only the architecture rows and glossary terms the domain needs, and writes nothing until the domain's owner confirms the drafts. Use when a user asks to map, document or describe a domain, module or feature area into project memory, or runs docs-map. Never maps the whole app.
---

# docs-map

Maps one domain, never the whole app. Coverage grows where work happens.

## Process

1. Load docs-conventions. The claim format, `references/behavior.md`, `references/architecture.md` and `references/glossary.md` apply.
2. Take the domain the user names. If asked for everything, say that docs-map works one domain at a time and ask which one comes first. Read `index.md`; if the domain has no row, ask who owns it and what it covers, and add the row before anything else.
3. Find the domain's code: the row's "covers", `architecture/boundaries.md` when it exists, folder and file names, then grep. Read the code and its tests. Read any Spec Kit, OpenSpec or Kiro spec for the domain under the never-write folders as input, and never edit those files. A sub-agent may do this reading and report back when one is available; otherwise read in this session.
4. Draft the behavior: group what the code does into capabilities named as verb phrases, and under each write 3 to 7 claims in the claim format, observable behavior only, one `e.g.` each from the tests or the code. Where the tests, the code and a comment disagree, write the question for the owner instead of guessing.
5. Draft only the architecture rows the domain needs: a `stack.md` language row, a `boundaries.md` module row, `data-model.md` entities, `contracts.md` APIs or events, `integrations.md` external services, `config.md` settings, `invariants.md` rules, each only when the domain has one. Draft the glossary terms the domain introduces, one line each.
6. Show the drafts to the owner `index.md` lists for the domain, numbered, with the open questions at the end and a recommended answer for each. Then stop and wait. Nothing is written before the owner confirms, and what the owner corrects is what gets written.
7. After confirmation, write: `behavior/<domain>/<capability>.md` from its template, one file per capability; the architecture rows, creating an area file from its template only when it gets a row; the glossary lines, sorted. Report what was written and what the owner left out.

## Verification

- A behavior file exists for each confirmed capability and for nothing else, each with 3 to 7 claims, every claim with an ID and an `e.g.` line.
- No architecture file was created without a row for this domain. `config.md` does not exist when the domain has no settings.
- `glossary.md` is sorted A to Z and holds no rule.
- The spec-tool folders are unchanged.
- Before confirmation, `git status` shows no new file under the docs path.

## Fallbacks

- No question tool: show the drafts and the questions in plain text, numbered, and wait for the reply.
- No sub-agents: read the domain's code in this session.
