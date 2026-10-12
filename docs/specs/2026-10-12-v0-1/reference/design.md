Purpose: the Stage 1 (v0) design, exported from the design doc on 2026-10-12 (revision 92). It holds the reasoning behind the spec.

> **decisions.md wins wherever the two differ.** Known stale parts of this export:
> - "ledger" is the old placeholder name. The pack is `scrubjay`, and the private copies are `canon` (D23).
> - The AGENTS.md block shown here uses `ledger` markers and the commit-prefix rule. The current block is `templates/agents-block.md` (D7, D24).
> - "Still open" lists six questions that are all answered in decisions.md (D7, D8, D10, D19, D23, and the install facts in research.md).
> - "Team install and updates" shows a `ledger-skills` repo with the plugin at its root. The plugin lives in its own subfolder (D22), and the repo is public once v0.1 works (D23).
> - "How we test it" predates D26 to D28 on testing patterns.
> - The approval is shown as `approved: {by, on}` and is "renewed". It is now `approved: {by, via}`, removed on a change to Why or What changes and written back at the new go (D8).
> - The flow diagram didn't survive the export, so it appears as a placeholder line.
> - After the review of 2026-10-12 (D30 to D41): there are two kinds (feature, fix) and three statuses (draft, building, shipped); changing course lives in spec-build; spec-ship updates the architecture files plan.md lists and writes no "Promoted to" line; there is no `architecture/index.md` and no company-knowledge section in `index.md`; docs-init writes `stack.md`; existing spec tools are only marked never-write; testing is static checks, plain case files, Claude Code evals and Codex by hand. Claude Code now reads AGENTS.md when no CLAUDE.md exists, so the "reads CLAUDE.md rather than AGENTS.md" line is outdated.
> - After the second review of 2026-10-12 (D42 to D50): docs-init always writes the CLAUDE.md import; the block names glossary and decisions and is root-only; `index.md` has no Behavior column and lists a domain from init; two marketplace files, one per agent, and no Claude Code manifest; templates live under `assets/` in docs-conventions and are never referenced by path from another skill; the session line records facts and the re-explain count comes from the user; frontmatter carries no comments.

---

# Stage 1 Design: Skill Pack and Docs

Oct 9, 2026 · @Yousef

## Scope

Stage 1 is a v0 built to test two bets: agents keep project knowledge across sessions when it lives in `docs/`, and they build the right thing when the intent is grilled before any code. Everything else waits until real use shows it's needed.

We write every workflow skill ourselves; specialist skills stay optional installs. "ledger" is still a placeholder name.

| In v0 | Backlog: added when evidence demands | Later stages |
| --- | --- | --- |
| `docs/`: index, glossary, behavior, architecture, decisions, specs | Evidence per claim (`verify.md`) | Deterministic check engine |
| Each spec: `spec.md`, `plan.md`, `tasks.md`, `reference/` | A checker in a git hook and CI | Review routing and CODEOWNERS |
| Six commands, two practices, one AGENTS.md block | `+` / `~` / `-` marks against main | Production watch |
| A file charter: one job per file | A separate intent gate, approval by merge, `docs-status`, evals | Products across several repos |

## Own, learn or leave

We own every skill in the workflow and write it ourselves, we learn the mechanics that work from the top packs, and we leave specialist skills to the team.

[Addy Osmani's agent-skills](https://github.com/addyosmani/agent-skills) compares itself with Superpowers and Matt Pocock's skills and concludes that none of the three has solved durable memory across sessions ([comparison](https://github.com/addyosmani/agent-skills/blob/main/docs/comparison.md)). The same page warns against running two packs as routers at once, so our pack is the one router and anything else is added a skill at a time.

| What | Decision | Why |
| --- | --- | --- |
| Workflow skills: start, plan, build, ship, grilling | **Own.** Written by us, for our files | One voice and our paths; the workflow and the memory can't drift apart |
| Specialist skills: security, performance, frontend, API design, observability | **Leave.** Optional installs, one skill at a time | They write no workflow files |
| Question rounds with a recommended answer per question | **Learn** from Matt's grilling | The sharpest requirements loop of the three packs |
| Small tasks, each with acceptance criteria and the files it touches | **Learn** from Addy | Keeps each slice reviewable |
| Skill sections: process, rationalizations, red flags, verification | **Learn** from Addy | Makes steps harder for an agent to skip |
| A truth folder that each change updates when it ships | **Learn** from OpenSpec | Agents read the current state in one place |
| Project instructions outrank skill defaults | **Learn** from Superpowers | Lets AGENTS.md steer optional skills |

Learning means writing a mechanism in our own words, not copying text; `CREDITS.md` names the packs we learned from.

## The flow at a glance

Four commands take a spec from intent to merge, and two more set up and map the docs. Each step leaves a file the next step reads.

&#91;embedded content: stage 1 v0 flow · 4 spec commands, 2 docs commands\]

A change mid-way never restarts the flow: the agent updates the file the change belongs to and rechecks every task. Glossary terms and decisions are written the moment they settle; only `spec-ship` updates `behavior/` and `architecture/`.

## Docs layer

Project memory lives in `docs/`: five kinds of truth that agents load as needed, plus one folder per spec for the work in flight. If the repo already uses `docs/` for a documentation site, `docs-init` puts ours in a subfolder and records the path in the AGENTS.md block.

```
<project repo>/
  AGENTS.md                             managed block: the workflow and where memory lives
  docs/
    index.md                            map of the product and its docs
    glossary.md                         shared words, sorted A to Z
    behavior/<domain>/<capability>.md   what the product does now
    architecture/                       how it is built now: index.md + files created when needed
    decisions/YYYY-MM-DD-slug.md        why lasting choices were made
    specs/YYYY-MM-DD-slug/              one folder per change
      spec.md                           why + what
      plan.md                           how (features, refactors, fixes with several steps)
      tasks.md                          where the work stands
      reference/                        anything else this spec needs; promoted at ship
```

**The file charter.** Each file has one job. The "never contains" column keeps files small: content that matches it belongs in the file the table names for it.

| File | Its one job | Contains | Never contains | Written | Read |
| --- | --- | --- | --- | --- | --- |
| AGENTS.md block | Tell every agent the workflow and where memory lives | Seven short rules and a pointer to `docs/index.md` | Project knowledge | `docs-init` | Every session, automatically |
| `index.md` | Map of the product and its docs | What the product is, its domains and owners, where things are, links to company knowledge | Details of any domain | `docs-init`; `docs-map` or `spec-ship` when a domain is added | Start of every task |
| `glossary.md` | Shared words | Term, meaning, name in code, words to avoid | Rules or behavior | When a term settles, during grilling or `docs-map` | When naming things or reading specs |
| `behavior/<domain>/<capability>.md` | What the product does now | Testable claims with IDs, one example each | How it's built, history, plans | `docs-map`; `spec-ship` | Before changing that capability; to answer "how does X work" |
| `architecture/*.md` | How it's built now | One file each, created when needed: stack and commands, conventions, boundaries, data model, contracts, integrations, invariants | Behavior, history, plans | `docs-map`; `spec-ship`, only for files the change touched | Before planning or building |
| `decisions/<date-slug>.md` | Why a lasting choice was made | Context, options, choice, consequences, the spec it came from | Step-by-step details | The moment a lasting choice is made | When someone wants to repeat or undo the choice |
| `spec.md` | Why this change, and exactly what changes | Problem, the claims to add, change or remove grouped by capability, non-goals, open questions, status | How to build it | `spec-start`; updated when a change affects why or what | Every later step; the owner's go |
| `plan.md` | How this change will be built | Approach, trade-offs, files to touch with one line each, architecture files to update at ship, risks | The why; progress | `spec-plan`; updated when the approach changes | Before building; when the approach is questioned |
| `tasks.md` | Where the work stands | Checklist, each task naming the claims that prove it done; short notes per task: blocked, tried, why | Design discussion | `spec-plan`, or `spec-build` when the kind skips planning; updated every session | Start of every new session |
| `reference/*` | Working material this spec needs | Data model sketches, contract drafts, API examples, research, mockups; each file opens with one line saying what it is | The why, the plan, progress | `spec-plan`; `spec-build` | While planning and building; at ship, to decide what to promote |

**Promote, don't link.** At ship, every `reference/` file faces one question: will this stay true after the change, and does future work need it? If yes, its content is merged into `docs/architecture/`, and the reference file gets a first line saying where it went; the file stays in the spec as the record of the draft. If no, it simply stays as history. Architecture always holds the complete current state, so no agent has to read old specs to learn how the system works.

Shipped specs are history. Agents only open the active spec, so old ones cost nothing in daily work.

One AGENTS.md at the root is enough. Agents follow the nearest AGENTS.md to the file they edit ([AGENTS.md](https://agents.md/)), so rules kept inside `docs/` would be missed by an optional skill writing `SPEC.md` at the repo root. Optional specialist skills are installed per developer and never live in the repo.

## Company knowledge

Knowledge shared by every project sits one layer above `docs/`. A project links to it and never copies it.

| Layer | Holds | Lives in | How agents get it |
| --- | --- | --- | --- |
| Company rules | Coding standards, security and privacy rules, review checklists, the approved stack | A company skill pack, installed next to ours | It loads when relevant, in every repo |
| Company facts | Shared glossary, shared services, platform architecture, company-wide decisions | A company docs repo with the same shape as `docs/` | Linked from the project's `docs/index.md` |
| Project memory | This product's behavior, architecture, decisions and specs | The project's `docs/` | The AGENTS.md block |

Company policies, such as security and privacy, always win. Company defaults, such as a preferred database, can be overridden only with a decision record in the project. For a freelancer, a client's rules come from the client's skill pack or docs repo when they exist, and your own way of working across clients is your personal skill pack.

## The AGENTS.md block

The block makes every agent follow the workflow even when none of our skills is loaded. It guides rather than enforces; enforcing it is the backlog's checker.

```md
<!-- ledger:start · managed by the ledger skills -->
## Project memory
- Start every task at docs/index.md and load only what it links to.
- Every code change belongs to a spec in docs/specs/. None yet: run spec-start.
- One branch per spec, named after its slug. The active spec is the one
  matching the current branch; returning to work, read its tasks.md first.
- If something changes mid-way, update spec.md or plan.md, then recheck every task.
- Commit messages start with the spec slug: [add-wishlist] T2 save button.
- Write specs, plans, tasks, glossary terms and decisions into docs/,
  never into SPEC.md, tasks/, CONTEXT.md or docs/superpowers/.
- Run spec-ship before opening a pull request.
<!-- ledger:end -->
```

**Why agents follow it.** The [AGENTS.md FAQ](https://agents.md/) says the nearest file wins and an explicit chat message overrides it. Superpowers states outright that project instructions such as AGENTS.md outrank its skills ([using-superpowers](https://smithery.ai/skills/obra/using-superpowers)). Not every pack says so, which is why the block names the stray files it rules out.

Claude Code reads `CLAUDE.md` rather than `AGENTS.md` ([agent instruction files](https://www.claudepluginhub.com/skills/rbozydar-core-plugins-core/manage-agent-instructions)), so `docs-init` links one to the other.

## Skills

Six commands and two practices, all written by us. Commands start with `spec-` or `docs-`, so they don't collide with the commands of the packs we studied.

**Commands (typed by a person):**

| Command | Use it to | Writes | Done when |
| --- | --- | --- | --- |
| `docs-init` | add the docs layer to a repo | `docs/` skeleton, the AGENTS.md block, the CLAUDE.md link | the skeleton and the block are in place |
| `docs-map` | document one domain of an existing app the first time work touches it, never the whole app up front | that domain's behavior and architecture files, glossary terms | the owner confirms the drafts |
| `spec-start` | state why and what through a grilling interview; can start from an issue or from commits already made | `spec.md`; glossary terms | nothing left open, and the owner says go when the kind needs it |
| `spec-plan` | decide how and break it into small tasks | `plan.md`, `tasks.md`, `reference/` files, decisions | every task names the claims that prove it done |
| `spec-build` | implement task by task, a failing test first when behavior changes; creates `tasks.md` when the kind skipped planning | code, tests, ticks and notes in `tasks.md` | all tasks ticked and tests pass |
| `spec-ship` | check the work, update the truth files, prepare the pull request | `behavior/`, `architecture/`, `index.md` for a new domain, the status in `spec.md` | code and docs agree in one pull request |

`spec-ship` runs the project's tests, then asks a fresh sub-agent that did not write the code to compare the diff with `spec.md`. Its findings go into the pull request description.

**Fast path.** For a fix or a chore, `spec-start` writes the spec in one pass and only grills when something is ambiguous. The target is a few minutes.

**Practices (loaded by the agent):**

| Practice | Holds | Used by |
| --- | --- | --- |
| `grilling` | question rounds: every question answerable now, numbered, each with a recommended answer; facts looked up, never asked; terms and decisions written as they settle | `spec-start`, `spec-plan`, `docs-map` |
| `docs-conventions` | the file charter and its templates: what lives where, what each file never contains, which files to load for a task, how to write a claim, how to promote reference files | every command |

Grilling answers go where their topic belongs: why and what into `spec.md`, how into `plan.md` or `reference/`, lasting choices into `decisions/`, new terms into `glossary.md`.

Steps stay skills because grilling needs the user in the conversation. Sub-agents run only where a fresh context is the point: fact lookups while grilling, reading a domain's code in `docs-map`, and the reviewer in `spec-ship`. Every skill uses the same sections: overview, when to use, process, common rationalizations, red flags, verification.

## Changing course mid-spec

A change mid-way never restarts the spec: update the file it belongs to, recheck every task, get an OK, continue.

1. **Update the file the change belongs to:** `spec.md` for why or what, `plan.md` for how, `reference/` for details. A code-only tweak is just a task note.
2. **Recheck every task** against the updated spec and plan, and mark each one keep, redo, new or drop, with a one-line reason.
3. **Show the list and wait for an OK,** then continue.
4. **If `spec.md` changed, the owner says go again** before the affected tasks are built. A change to what gets built always goes back to them.
5. **If the change contradicts the spec's non-goals or grows its scope,** start a follow-up spec instead.

```md
## Tasks · rechecked 2026-10-14 after: guests can save without signing in
- [x] T1 Wishlist table and API            keep
- [ ] T2 Save button on the product page   redo: guests now save in the browser
- [x] T3 Wishlist page                     keep
- [ ] T4 Merge guest list on sign-in       new
```

## Flow by spec kind

The spec kind decides which commands run and which files exist.

| Kind | Commands | Files | Who says go |
| --- | --- | --- | --- |
| `feature` | start, plan, build, ship | spec, plan, tasks; reference when needed | the owner, after `spec-start` |
| `fix` | start, build with a failing test first, ship | spec, tasks; plan if it takes several steps | the owner of the affected capability, before ship |
| `refactor` | start, plan, build, ship | a spec stating that behavior doesn't change, plan, tasks | engineering |
| `chore` | start, build, ship | a spec of a few lines | nobody |

Statuses: `draft`, `approved`, `building`, `shipped`, `cancelled`. The owner's go sets `approved` (a chore skips it), `spec-build` sets `building`, and `spec-ship` sets `shipped` inside the pull request, so it becomes true on main exactly when the code merges. Each spec has its own branch named after its slug, which is how an agent knows the active spec. Work done outside the flow gets its spec afterwards: `spec-start` writes it from the commits.

## Scenario 1: a new feature

A developer adds a wishlist to a webshop. Eight steps, one change of mind, and one pull request where code and docs agree.

| # | Who acts | What runs | Files written |
| --- | --- | --- | --- |
| 1 | Developer types `spec-start customers can save items to a wishlist` | `grilling` settles why, for whom, duplicates and devices | `specs/2026-10-12-add-wishlist/spec.md`; "wishlist" added to `glossary.md` |
| 2 | Product owner says go | — | `spec.md`: status `approved` |
| 3 | Developer types `spec-plan` | approach and small tasks; the data model is sketched as working material | `plan.md`; `tasks.md`; `reference/data-model.md`; `decisions/2026-10-12-wishlist-stored-server-side.md` |
| 4 | Developer types `spec-build` | task by task, a failing test first | code and tests; ticks and notes in `tasks.md`; commits start with the slug |
| 5 | Next morning, a colleague checks out the spec's branch | the AGENTS.md block sends the agent to `tasks.md` first | nothing; the agent reports that T3 is next and why T2 deviated |
| 6 | Owner: guests should be able to save too | `spec.md` updated and the owner says go again; every task rechecked: T2 redo, T4 new | `spec.md`; `tasks.md` |
| 7 | Developer types `spec-build` again | redoes T2, builds T4, finishes T3 | code, tests, notes |
| 8 | Developer types `spec-ship` | tests run; a fresh reviewer compares the diff with `spec.md`; claims go into `behavior/`; the data model is promoted | `docs/behavior/wishlist/`; `docs/architecture/data-model.md`; the wishlist domain in `docs/index.md`; the pull request description with the review findings |

After the merge, an agent asked how wishlists work reads `docs/behavior/wishlist/` and `docs/architecture/data-model.md`, not the code or the old spec.

## Scenario 2: an existing feature

On a product that already has docs, work starts from the docs. A domain without docs yet is mapped the first time work touches it.

**A bug: partial refunds are one cent off.**

| # | Who acts | What runs | Files written |
| --- | --- | --- | --- |
| 1 | Developer asks the agent how partial refunds are calculated | the AGENTS.md block sends it to `docs/behavior/returns/submit-return.md` | nothing; the answer cites `returns/submit-return#partial-refund` |
| 2 | Developer types `spec-start partial refunds are one cent off` | fast path: kind `fix`, one pass, no grilling needed | `spec.md` with the claim under "Change", as it should read |
| 3 | Developer types `spec-build` | a failing test named with the claim ID reproduces the bug, then the fix | the test and the fix; one task note |
| 4 | Owner confirms the rounding rule | — | `decisions/2026-10-14-refund-rounding-half-up.md` |
| 5 | Developer types `spec-ship` | tests and review; the claim is updated in place | `docs/behavior/returns/submit-return.md` |

There is no `plan.md`: a one-step fix works straight from its claim.

**An enhancement: support can export the returns list as CSV.**

1. `spec-start` writes the spec with one new claim, and the owner says go.
2. `spec-plan` writes `plan.md`, `tasks.md` and `reference/contracts.md` for the new endpoint.
3. `spec-build` runs as usual.
4. `spec-ship` adds the claim to the returns list's behavior file and promotes the contract into `docs/architecture/contracts.md`.

**A domain with no docs yet.** If returns had never been documented, `spec-start` would ask to run `docs-map` for that one domain first, so coverage grows only where work happens.

## Templates and examples

Every file the skills write starts from a template in `docs-conventions/templates/`. A template fixes the frontmatter and the headings. Guidance on what goes under each heading lives in the tables below and in the `docs-conventions` practice, never inside the files themselves.

**Rules for every template:**

1. **Frontmatter and headings only.** No placeholder text such as "TBD": agents later treat it as real content.
2. **Optional sections are deleted when empty,** never left blank or filled with "None".
3. **Heading names are fixed.** Agents find content by heading, so a heading is never renamed.
4. **Spec files link back.** `spec.md` carries `id`; every other file in the spec folder carries `spec: <id>`.
5. **Templates are versioned with the pack.** `index.md` records the docs format version. A template change applies to new files only; shipped specs are never rewritten.
6. **Claims read the same everywhere.** A claim in `spec.md` is written exactly as it will read in `behavior/`, so `spec-ship` copies it without rewording.

**The claim format,** used in `spec.md` and in behavior files:

```md
- <Actor> <does or sees something observable>, in present tense {#claim-id}
  e.g. <a concrete situation> -> <the observable result>
```

One testable sentence per claim. IDs are kebab-case and unique within their capability; the full reference is `domain/capability#claim-id`. Claims state observable behavior only: "saving the same product twice keeps one entry," never "uses a unique index." Three to seven claims per capability.

### `spec.md`

| Section | Required | What goes in | What never goes in |
| --- | --- | --- | --- |
| Frontmatter | always | `id`, `kind`, `status`, `summary` (one user-facing line, reused in release notes), `issue` (optional), `approved` (by and on, renewed after a change) | Task progress |
| Why | always | The problem, who has it, and what it costs to leave it, in two to five lines | The solution |
| What changes | except refactors and chores | Claims under `### Add · <capability>`, `### Change · <capability>` and `### Remove · <capability>`. A Change adds a `was:` line with the old text; a Remove adds a `reason:` line. A refactor writes "No behavior change." | How it's built |
| Not doing | features | What is deliberately out, so scope can't creep silently | Future ideas with no decision behind them |
| Open questions | while drafting | Questions only the owner can answer. The section is deleted when empty, and the owner can't say go before that | Questions the agent can answer from the code |

A spec past about 80 lines is really two specs.

### `plan.md`

| Section | Required | What goes in | What never goes in |
| --- | --- | --- | --- |
| Frontmatter | always | `spec` | — |
| Approach | always | The shape of the solution, in three to eight lines | The why, restated |
| Trade-offs | when there was a real choice | The options considered and why this one won; a choice that outlives the spec links to its decision record | Every idea mentioned in passing |
| Files | always | An annotated file tree: path, new / changed / deleted, one-line reason. This is the scope the review checks the diff against | Line-level edits |
| Architecture to update at ship | when an architecture area changes | Which `docs/architecture/` files change, and the reference file each comes from | The content itself |
| Rollout | when order matters | Migrations, feature flags, deploy order, data backfills | Standard deploy steps |
| Risks | when there are any | What could break, and which claim or test covers it | Generic risks |

A plan past about 60 lines means the change is too big, or design detail belongs in `reference/`.

### `tasks.md`

Frontmatter `spec`. After a change mid-way, one line at the top records the recheck: `Rechecked 2026-10-14 after: guests can save. T2 redo, T4 new, T5 dropped.`

```md
- [ ] T<n> <imperative task> -> <claim IDs, or "check: <command or observable result>">
  - note: <blocked, tried, why; two lines at most>
```

Each task fits in one session. Numbers are never reused. A task to redo is unticked with a `redo:` note; a dropped task is removed and named in the recheck line. Anything lasting in a note moves into the plan or a decision record.

### `behavior/<domain>/<capability>.md`

Frontmatter `capability: <domain>/<capability>`, a title that names the capability as a verb phrase ("Save an item to the wishlist"), then the claims, and nothing else. Owners live in `index.md`, history in git, and code locations in `architecture/boundaries.md`.

### `architecture/<area>.md`

Frontmatter `area`, a title, then the area's own table. Current state only: no history and no plans, and the why links to decision records. `architecture/index.md` lists the area files that exist, one line each saying what question it answers.

| Area | Holds |
| --- | --- |
| `stack` | Languages, frameworks, and the commands to install, run, test, lint and build |
| `conventions` | Only the rules agents get wrong without being told: naming, error handling, test style |
| `boundaries` | Modules: name, path, domain, and what each may depend on |
| `data-model` | Entities: name, key fields, relations |
| `contracts` | APIs and events: name, input, output, consumers |
| `integrations` | External services: purpose, direction, auth, behavior when they fail |
| `config` | Settings and flags: name, purpose, default, where it's set |
| `invariants` | Non-negotiable rules: ID, rule, why |

### `decisions/<date-slug>.md`

| Section | What goes in |
| --- | --- |
| Frontmatter | `id`, `status` (`accepted`, or `superseded by <id>`), `spec`, `date` |
| Context | The forces that made a choice necessary, in two to five lines |
| Options | Each option in one line, with why it lost |
| Decision | One sentence |
| Consequences | What gets easier, what gets harder, what to watch |

A decision is never edited once accepted. A new decision supersedes it, and the old one only has its status changed. Agents read accepted decisions only.

### `index.md`

| Section | What goes in |
| --- | --- |
| Frontmatter | `product`, `docs-format` (the template version) |
| What it is | Who uses the product and for what, in two to four sentences |
| Domains | A table: domain, what it covers, owner, link to its behavior folder |
| Architecture | One link to `architecture/index.md` |
| Company knowledge | Optional: links to the company docs repo and the company skills that apply |

`glossary.md` and `reference/` files have no file template. The glossary is one line per term, in the format shown below; a reference file only needs its first line to say what it is.

### Filled examples

All from the wishlist spec.

`spec.md`, why and what:

```md
---
id: 2026-10-12-add-wishlist
kind: feature
status: building     # draft, approved, building, shipped, cancelled
summary: Customers can save items to a wishlist and see it on any device.
issue: SHOP-412
approved: {by: sanne, on: 2026-10-14}   # renewed after the guest change
---
# Add wishlist
## Why
Customers lose track of products they like and leave without buying.
## What changes
### Add · wishlist/save-item
- A signed-in customer can save a product to their wishlist {#saves-item}
  e.g. Sanne taps Save on "Rain jacket" -> it appears in her wishlist
- Saving the same product twice keeps one entry {#no-duplicates}
  e.g. Sanne saves "Rain jacket" again -> it still appears once
- Guests can save up to 100 products in this browser {#guest-saves-locally}
  e.g. a guest saves "Rain jacket" -> it appears on this browser only
## Not doing
Sharing wishlists; price-drop alerts.
```

`plan.md`, how:

```md
---
spec: 2026-10-12-add-wishlist
---
## Approach
Signed-in lists live on the server; guest lists live in the browser and merge on sign-in.
## Trade-offs
Server-side for signed-in users: works across devices, costs one table (see decision).
## Files
src/wishlist/api.ts               new: save, remove, list, merge
src/wishlist/guestStore.ts        new: browser storage, 100-item cap
src/wishlist/SaveButton.tsx       new: button on the product page
db/migrations/0042_wishlist.sql   new: wishlist_items table
## Architecture to update at ship
data-model.md, from reference/data-model.md
## Risks
Duplicates when lists merge on sign-in; covered by no-duplicates.
```

`tasks.md`, where the work stands; the claims after each arrow are what prove a task done:

```md
---
spec: 2026-10-12-add-wishlist
---
Rechecked 2026-10-14 after: guests can save. T2 redo, T4 new.

- [x] T1 Wishlist table and API -> saves-item, no-duplicates
- [ ] T2 Save button on the product page -> saves-item, guest-saves-locally
  - redo: guests now save in the browser
- [x] T3 Wishlist page -> no-duplicates
  - note: tried a client-side cache first; dropped, it went stale across devices
- [ ] T4 Merge the guest list on sign-in -> no-duplicates
```

`reference/data-model.md`, working material, after ship:

```md
Promoted to docs/architecture/data-model.md on 2026-10-15.
Purpose: draft data model for the wishlist.

wishlist_items: customer_id, product_id, added_at
unique (customer_id, product_id)
```

`docs/behavior/wishlist/save-item.md`, the truth after ship. Tests carry the claim ID in their name, such as `keeps one entry [wishlist/save-item#no-duplicates]`, so anyone can find the test behind a claim.

```md
---
capability: wishlist/save-item
---
# Save an item to the wishlist
- A signed-in customer can save a product to their wishlist {#saves-item}
  e.g. Sanne taps Save on "Rain jacket" -> it appears in her wishlist
- Saving the same product twice keeps one entry {#no-duplicates}
  e.g. saving "Rain jacket" again -> it still appears once
- Guests can save up to 100 products in this browser {#guest-saves-locally}
  e.g. a guest saves "Rain jacket" -> it appears on this browser only
```

`glossary.md`, one line per term, sorted A to Z so parallel specs rarely conflict. Rules stay out of it; business rules are claims in `behavior/`.

```md
- **Partial return**: a return covering some, not all, items of an order. Code: `Return.isPartial`.
- **Refund**: money paid back once support approves a return. Code: `Refund`.
- **Return**: a request to send back one or more items from one order. Code: `Return`. Avoid: refund.
- **Wishlist**: products a customer saved for later; signed-in lists live on the server, guest lists in the browser. Code: `Wishlist`. Avoid: favorites.
```

`decisions/2026-10-12-wishlist-stored-server-side.md`:

```md
---
id: 2026-10-12-wishlist-stored-server-side
status: accepted
spec: 2026-10-12-add-wishlist
date: 2026-10-12
---
# Store wishlists on the server
## Context
Customers switch between phone and laptop; a list kept in one browser is lost on the other.
## Options
- Browser storage only: no backend work, but the list doesn't follow the customer.
- Server-side, one list per customer: one table and a small API; the list follows the customer.
## Decision
Wishlists live on the server, one per signed-in customer.
## Consequences
One new table to migrate and back up. Guests are not covered; a later decision handles them.
```

## Team install and updates

Each developer installs one pack, ours, and adds specialist skills one at a time by choice. The project repo carries only `docs/` and the AGENTS.md block.

**Our pack** is a standalone private repo in the [Agent Plugins](https://agent-plugins.org/) format: a required `plugin.json`, a `skills/` folder, and no `mcp.json`, which the standard makes optional. Claude Code is not on the standard's [compatible-client list](https://agent-plugins.org/compatible-clients), so the repo also carries a `.claude-plugin/` manifest. Addy's and Superpowers' repos both do the same, with one manifest folder per agent.

```
ledger-skills/                       standalone private repo
  plugin.json                        Agent Plugins manifest
  .claude-plugin/plugin.json         Claude Code manifest
  skills/
    docs-init/  docs-map/
    spec-start/  spec-plan/  spec-build/  spec-ship/
    grilling/
    docs-conventions/                the file charter + templates/ for every file type
  README.md  CHANGELOG.md  CREDITS.md  LICENSE
```

All templates live in `docs-conventions/templates/`, next to the file charter they implement, so a format changes in one place. The pack is always installed whole, so every command can read them. `CREDITS.md` names the packs whose mechanics we learned from.

```json
{
  "$schema": "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json",
  "name": "ledger",
  "version": "0.1.0",
  "description": "Spec workflow and project memory for agents and people",
  "repository": "https://github.com/<org>/ledger-skills"
}
```

Only `$schema` and `name` are required ([manifest rules](https://agent-plugins.org/plugin-authors/manifest)).

**Specialist skills** install from their own sources, one at a time. Addy's security skill, for example: `npx skills add addyosmani/agent-skills --skill security-and-hardening`. Our pack stays the only router, so no full pack is installed next to it.

**Updates.** Our pack uses semantic versions, and `docs/index.md` records the docs format version, so a newer pack knows when `docs-init` must migrate files.

## Backlog: add when evidence demands

Everything cut from v0 stays designed. Each item comes in only when real use shows its signal.

| Signal from real use | Add | What it gives |
| --- | --- | --- |
| Bugs escape after ship | `verify.md`: evidence per claim; claim IDs required in test names | The owner sees what was proven |
| `docs/` drifts from the code | A checker in a git hook and a one-line CI job | Malformed or stale docs are blocked |
| Hand-written Add, Change and Remove lists get wrong or conflict | The checker computes them against main | The change list can't drift from the truth |
| The owner wants the why agreed before the what | A separate `intent.md` and its own gate | No exact-behavior work before the why is settled |
| A second person approves work | Approval by merging a proposal pull request | Nobody approves their own work |
| Many specs in flight at once | `docs-status` | Where each spec stands, stray files, duplicate slugs |
| Skills misfire after a model change | Trigger, routing and behavior evals | Proof the skills still fire and behave |
| Several products share knowledge | A company docs repo template, and a `docs-init` option to link it | Shared facts written once |
| Trust needs proof, not review | The stage 2 check engine: replay, diff, coverage | Deterministic confirmation of behavior |

## How we test it

The two bets are tested on real work, and the signals that decide the most arrive first.

1. **Baseline first (week 1).** Run OpenSpec plus Matt's `grill-me` on one client task. Where they already work, build less; where they break is what v0 must fix.
2. **Replay past work (days 1 to 3).** Take ten merged pull requests from a past client project, run the flow from each original ticket, and compare: did the spec capture what the real pull request did, and did grilling surface what later caused rework?
3. **Build the pack with the pack.** Use the flow to build `ledger-skills` itself, for daily friction feedback.
4. **Measure the bets on every spec.** How often a new session needed re-explaining, how many wrong turns `spec-plan` caught before any code, and minutes spent per spec by kind.

| When | What we learn |
| --- | --- |
| Days 1 to 3 | Overhead per spec, friction, whether agents follow the steps |
| Days 2 to 5 | Whether specs capture real work, from the replay |
| Week 1 | Whether a new session picks up cleanly from `tasks.md` |
| Weeks 2 to 4 | Whether `docs/` stays true, and whether owners engage |

**Kill or rethink if** specs take longer than the change itself for small work, new sessions still need the same re-explaining, or `docs/behavior/` is wrong after a month.

## Still open

Six questions remain before the skills are written.

- [ ] The real name, which replaces "ledger" in the plugin, the repo and the AGENTS.md markers
- [ ] How the owner says go when they're not in the session: a comment, a message, or a merged pull request
- [ ] Whether commits must start with the spec slug, or the pull request title is enough
- [ ] Whether each target agent can install a plugin from a private git repo, and how
- [ ] How `docs-init` treats a repo that already uses Spec Kit, OpenSpec or Kiro: import into `docs/specs/` or leave them alongside
- [ ] Whether `spec-ship` opens the pull request itself or only writes its description

## Sources

- [Addy Osmani: agent-skills](https://github.com/addyosmani/agent-skills)
- [agent-skills: comparison with Superpowers and Matt Pocock's skills](https://github.com/addyosmani/agent-skills/blob/main/docs/comparison.md)
- [agent-skills: spec-driven-development skill](https://github.com/addyosmani/agent-skills/blob/main/skills/spec-driven-development/SKILL.md)
- [mattpocock/skills](https://github.com/mattpocock/skills)
- [obra/superpowers](https://github.com/obra/superpowers)
- [using-superpowers: instruction priority](https://smithery.ai/skills/obra/using-superpowers)
- [Kiro: specs folder per feature](https://hackernoon.com/the-lean-kiro-setup-that-keeps-ai-coding-tasks-focused)
- [OpenSpec core concepts](https://openspec.dev/docs/core-concepts)
- [AGENTS.md](https://agents.md/)
- [Agent instruction files: CLAUDE.md and AGENTS.md](https://www.claudepluginhub.com/skills/rbozydar-core-plugins-core/manage-agent-instructions)
- [Agent Plugins](https://agent-plugins.org/)
- [Agent Plugins: compatible clients](https://agent-plugins.org/compatible-clients)
- [Agent Plugins: plugin manifest](https://agent-plugins.org/plugin-authors/manifest)
- [AI-SDLC framework](https://ai-sdlc.io)
