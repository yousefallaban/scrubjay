---
id: 2026-10-12-v0-1
kind: feature
status: approved
summary: First release of scrubjay, six commands and two practices that give coding agents a spec workflow and project memory in docs/.
approved: {by: yousef, via: "design session with Claude"}
---
# Build scrubjay v0.1

> This bootstrap spec covers the whole first release, so it runs well past the ~80-line guideline. Later specs follow the guideline.
> Background: `reference/decisions.md` (wins on any conflict), `reference/design.md`, `reference/research.md`. Templates: `reference/templates/`.

## Why
Coding agents forget the project between sessions, so every new session needs re-explaining. They also build what was typed rather than what was meant, so the rework shows up after the code is written.
The packs we studied (Superpowers, Matt Pocock's skills, Addy Osmani's agent-skills) haven't solved durable memory across sessions. The spec tools (Spec Kit, OpenSpec, Kiro) each tie a project to their own format.
v0.1 exists to test two bets on real work: knowledge kept in `docs/` survives sessions, and grilling the intent before any code produces the right thing.

## What changes

### Add · setup/install
- A developer installs the pack in Claude Code from the GitHub repo with two commands {#claude-code}
  e.g. `/plugin marketplace add yousefallaban/scrubjay` then `/plugin install scrubjay@yousefallaban` -> `/scrubjay:spec-start` is available
- A developer installs the pack in Codex from the repo's git URL {#codex}
  e.g. Codex installs from `https://github.com/yousefallaban/scrubjay` -> `$spec-start` is available
- Installing from a private copy works with the developer's existing git credentials, and the README gives the steps and known catches for each agent {#private-repo}
  e.g. after `gh auth login && gh auth setup-git`, the same two Claude Code commands install it from a private repo
- Any other agent that supports Agent Skills can use the pack once its skills folder is copied into that agent's skills directory {#copy-fallback}
  e.g. the skills folder copied into Gemini CLI's skills directory -> `spec-start` loads
- The pack needs only git on the user's machine. `gh` is optional and used only to open pull requests {#git-only}
  e.g. on a machine without `gh`, every command works, and spec-ship shows the PR text to paste
- Updating the pack never rewrites a project's docs. When the docs format changes, docs-init offers the migration {#safe-update}
  e.g. a newer pack meets a project at `docs-format: 1` -> nothing changes until the user runs docs-init and accepts

### Add · docs/init
- docs-init creates `index.md`, `glossary.md`, `architecture/index.md` and empty `behavior/`, `decisions/` and `specs/` folders from the templates {#creates-skeleton}
  e.g. a repo with no `docs/` -> the skeleton exists, and `index.md` says what the product is in the user's words
- docs-init writes the project-memory block into the root AGENTS.md between its markers and leaves everything outside the markers untouched {#writes-block}
  e.g. an AGENTS.md holding a client's own rules -> those rules stay exactly as they were, and the block is added
- docs-init makes sure CLAUDE.md loads AGENTS.md {#links-claude-md}
  e.g. a repo with no CLAUDE.md -> CLAUDE.md contains `@AGENTS.md`
- When `docs/` already serves a documentation site, docs-init asks for a subfolder and records that path in the block {#docs-path}
  e.g. a repo with a docs site in `docs/` -> memory goes to `docs/project/`, and the block points there
- When Spec Kit, OpenSpec or Kiro files exist, docs-init asks whether to archive them (the default) or leave them in place. Either way their folders join the never-write list, the choice is recorded in `index.md`, and nothing is imported {#existing-spec-tools}
  e.g. an `openspec/` folder, archive chosen -> the content moves to `docs/archive/openspec/` with a README, and the tool's setup files are listed for the user to remove
- Running docs-init again only refreshes the block between the markers {#rerun-safe}
  e.g. a rerun after a pack update -> the block text is updated, and no docs file changes

### Add · docs/map
- docs-map documents one domain the user names, never the whole app {#one-domain}
  e.g. "map returns" -> drafts for `behavior/returns/` only
- docs-map reads that domain's code and drafts 3 to 7 claims per capability, each with an example {#drafts-claims}
  e.g. returns -> `submit-return.md` with a claim for partial refunds
- docs-map writes only the architecture area files and glossary terms that the domain needs {#only-what-it-needs}
  e.g. returns call a payment provider -> `integrations.md` gets a row, and `config.md` is not created
- docs-map writes nothing until the domain's owner confirms the drafts {#owner-confirms}
  e.g. the owner corrects a claim -> the corrected text is what gets written
- docs-map reads old Spec Kit, OpenSpec or Kiro specs for the domain as input and never edits them {#reads-old-specs}
  e.g. `openspec/specs/returns/` exists -> its rules show up as draft claims for the owner to confirm

### Add · spec/start
- spec-start creates `specs/<date>-<slug>/spec.md` and a branch named after the slug, starting from a sentence, an issue, or commits already made {#creates-spec}
  e.g. `spec-start customers can save items to a wishlist` -> `specs/2026-10-12-add-wishlist/spec.md` on branch `add-wishlist`
- spec-start sets the kind (feature, fix, refactor or chore), and the kind decides which later steps run and who says go {#sets-kind}
  e.g. a chore -> no plan.md and no owner's go; a fix -> no plan.md unless it takes several steps
- spec-start settles why and what by grilling until nothing is left open that only the owner can answer {#grills}
  e.g. the wishlist -> rounds on who saves, duplicates and devices, before any claim is written
- For a fix or a chore, spec-start writes the spec in one pass and grills only on what is ambiguous {#fast-path}
  e.g. `spec-start partial refunds are one cent off` -> a fix spec in a few minutes, with one claim under Change
- spec-start writes What changes as claims under `Add`, `Change` and `Remove` headings. A Change has a `was:` line and a Remove has a `reason:` line {#what-changes-format}
  e.g. the refund fix -> `### Change · returns/submit-return` with the old text under `was:`
- When the spec touches a domain that has no behavior docs, spec-start offers to map that domain first {#offers-map}
  e.g. a spec on returns, with no `behavior/returns/` -> "Map returns first?"
- The owner's go is recorded only when the user reports one, as `approved: {by, via}`, and only once Open questions is empty {#records-go}
  e.g. "Sanne approved on Slack" plus a link -> `approved: {by: sanne, via: "<link>"}`, and status becomes approved

### Add · spec/plan
- spec-plan does not plan a feature until the owner's go is recorded {#needs-go}
  e.g. a draft feature spec -> spec-plan says the go is missing and stops
- spec-plan writes `plan.md` with the approach, the files to touch with a one-line reason each, and the architecture files to update at ship {#writes-plan}
  e.g. the wishlist -> four files listed, and `data-model.md` marked for update at ship
- spec-plan writes `tasks.md`, where each task fits one session and names the claim IDs, or the check, that prove it done {#writes-tasks}
  e.g. `- [ ] T1 Wishlist table and API -> saves-item, no-duplicates`
- Working material goes into `reference/`, and each file opens with a line saying what it is {#reference-files}
  e.g. a data model sketch -> `reference/data-model.md` starting with `Purpose: draft data model for the wishlist.`
- A lasting choice becomes a decision record the moment it is made {#records-decisions}
  e.g. storing wishlists on the server -> `decisions/2026-10-12-wishlist-stored-server-side.md`
- spec-plan shows the plan and tasks and waits for an OK before any code is written {#waits-for-ok}
  e.g. the user asks for a smaller T1 -> tasks are updated and shown again

### Add · spec/build
- spec-build works one task at a time and ticks a task only when the claims it names are proven {#task-by-task}
  e.g. T1's tests pass -> T1 is ticked, and the build moves to T2
- When a task changes behavior, spec-build writes a failing test, named with the claim reference, before the code {#test-first}
  e.g. `keeps one entry [wishlist/save-item#no-duplicates]` fails, then passes
- spec-build sets the status to building, and creates `tasks.md` first when the kind skipped planning {#sets-building}
  e.g. a one-step fix -> `tasks.md` with one task, and status building
- A new session on the spec's branch reads `tasks.md` first and reports the next task and any notes, without the user re-explaining {#resumes}
  e.g. a colleague checks out `add-wishlist` -> "T3 is next; T2 deviated because guests now save in the browser"
- What blocked a task, or what was tried and dropped, is kept as a note of at most two lines under that task {#notes}
  e.g. `- note: tried a client-side cache first; dropped, it went stale across devices`
- spec-build asks before touching a file that is not listed in plan.md {#stays-in-scope}
  e.g. a fix needs a shared helper changed -> "This file isn't in the plan. Add it?"

### Add · spec/change-course
- When the user changes course mid-spec, the agent updates the file the change belongs to: `spec.md` for why or what, `plan.md` for how, `reference/` for details {#updates-owner-file}
  e.g. "guests should be able to save too" -> a new claim in `spec.md`
- The agent rechecks every task, marks each keep, redo, new or drop with a one-line reason, and records one recheck line in `tasks.md` {#rechecks-tasks}
  e.g. `Rechecked 2026-10-14 after: guests can save. T2 redo, T4 new.`
- No affected task is built until the user OKs the recheck {#waits-for-ok}
  e.g. the user drops T4 -> the list is updated, then the build continues
- When Why or What changes changes, the agent removes the `approved` line, and affected tasks wait until the owner's new go writes it back {#renews-go}
  e.g. the guest claim added -> `approved` is removed; Sanne's new go restores it, and the build continues
- When a change contradicts Not doing or grows the scope, the agent proposes a follow-up spec instead {#follow-up-spec}
  e.g. "also share wishlists" while sharing is under Not doing -> "Start a separate spec for sharing?"

### Add · spec/ship
- spec-ship runs the project's test command and stops when it fails {#runs-tests}
  e.g. one failing test -> no docs change, and the failure is reported
- spec-ship does not ship a feature or a fix without a recorded go {#needs-go}
  e.g. a fix with no `approved` line -> "The owner of returns/submit-return hasn't said go"
- A fresh reviewer that did not write the code compares the diff with `spec.md` and with plan.md's file list, and its findings go into the PR description {#fresh-review}
  e.g. a file changed outside the plan -> listed as a finding
- spec-ship copies the claims in `spec.md` into `behavior/` without rewording, applying each Add, Change and Remove {#updates-behavior}
  e.g. the wishlist ships -> `behavior/wishlist/save-item.md` holds exactly the three claims from the spec
- spec-ship promotes the reference files that stay true into `architecture/`, marks each promoted file with where it went, and adds new domains to `index.md` {#promotes-reference}
  e.g. `reference/data-model.md` -> merged into `architecture/data-model.md`, with a first line `Promoted to docs/architecture/data-model.md on 2026-10-15.`
- spec-ship sets the status to shipped inside the same pull request {#sets-shipped}
  e.g. the PR merges -> code, docs and `status: shipped` land on main together
- spec-ship asks whether to create the PR or show its title and description to paste. Without `gh` it shows them. The PR title starts with the slug, and spec-ship never merges {#pr-choice}
  e.g. "show" chosen -> `add-wishlist: Add wishlist` and the description, ready to paste

### Add · practice/grilling
- Questions come in numbered rounds, every question answerable now, each with a recommended answer {#rounds}
  e.g. `3. Does saving the same product twice keep one entry? Recommended: yes.`
- Facts are looked up in the code and docs, never asked {#looks-up-facts}
  e.g. "which database?" -> answered from `architecture/stack.md`, not put to the user
- Each answer is written where its topic belongs the moment it settles: why and what to `spec.md`, how to `plan.md` or `reference/`, lasting choices to `decisions/`, new terms to `glossary.md` {#writes-as-it-settles}
  e.g. "wishlist" is agreed as the term -> a glossary line exists before the round ends
- Grilling ends when nothing is left that only the owner can answer {#knows-when-done}
  e.g. the remaining questions are all answerable from the code -> grilling stops and the agent looks them up

### Add · practice/docs-conventions
- Every file a command writes starts from its template, with the frontmatter and headings exactly as the template has them {#from-template}
  e.g. a new decision -> `Context`, `Options`, `Decision`, `Consequences`, in that order
- Project files contain no guidance comments and no empty sections. Optional sections are deleted, never filled with "None" or "TBD" {#no-placeholders}
  e.g. a plan with no rollout concerns -> no Rollout heading
- Each file holds only its own job. Content the charter's "never contains" column names goes to the file the charter names for it {#one-job}
  e.g. a business rule found while writing `glossary.md` -> it becomes a claim in `behavior/`
- Claims follow the claim format, 3 to 7 per capability, and test names carry the claim reference {#claim-format}
  e.g. `- Saving the same product twice keeps one entry {#no-duplicates}` with an `e.g.` line under it
- `index.md` records the docs-format version, and a template change applies to new files only {#docs-format}
  e.g. a template gains a section -> shipped specs are never rewritten

### Add · pack/portability
- Every skill is a SKILL.md that follows the Agent Skills standard, so any agent that supports the standard can load it {#agent-skills}
  e.g. the same `spec-start` folder loads in Claude Code and Codex
- Users receive only the plugin folder: skills, templates, manifests and the plugin's README, never this repo's docs, tests or CI {#plugin-folder}
  e.g. after install, the user's cache holds no `docs/specs/` from this repo
- The product name appears only in the manifests and README files. Skills, templates and the project-memory markers carry no name {#name-neutral}
  e.g. a private copy named canon differs from scrubjay only in those files, and a project set up with one works with the other
- A skill that uses a feature only some agents have states what to do without it {#fallbacks}
  e.g. no sub-agents -> "open a fresh session for the review"; no question tool -> ask in plain text
- Agent-specific files, such as manifests and per-agent case runners, sit apart from the skills, so adding an agent adds files and changes no skill {#adapters}
  e.g. adding Copilot support -> new manifest and runner files, and every SKILL.md is unchanged
- Anyone can develop the pack with any coding agent: repo instructions live in AGENTS.md, and CLAUDE.md only imports it {#builder-neutral}
  e.g. Codex building a task -> it reads the same AGENTS.md and spec that Claude Code reads

### Add · pack/quality
- Each skill was written test-first: the repo keeps the scenario that failed without the skill, and the skill is the smallest fix for it, tightened against the loopholes seen {#test-first-skills}
  e.g. without spec-start, the agent writes code straight from a one-line request -> that scenario is kept as the skill's baseline
- Each skill has at least 3 cases that should trigger it, 2 that should not, and 1 behavior case {#case-minimum}
  e.g. "customers should be able to save items for later" triggers spec-start; "what does this regex do?" triggers nothing
- Cases are stored once, in a format no agent owns, and each supported agent has a runner that feeds it the same cases {#neutral-cases}
  e.g. one case file runs through Claude Code's eval runner and through Codex's non-interactive mode
- Every case passes on Claude Code and on Codex before v0.1 is released {#two-agents}
  e.g. a trigger case that fails on Codex blocks the release
- Static checks run without any agent installed: skill frontmatter, manifests against their published formats, templates that parse, the product name only in allowed files, and internal links that resolve {#static-checks}
  e.g. a SKILL.md missing its description -> the check fails on a machine with no agent CLI
- CI runs the static checks on every pull request. Agent cases run on demand, since they need agent credentials {#ci}
  e.g. a PR that breaks a manifest -> CI fails
- Behavior cases run against fixture projects that start from a known state {#fixtures}
  e.g. the docs-init case starts from a repo with an existing AGENTS.md, every time

### Add · pack/docs
- The README tells a new user what the pack is, the two bets, how to install it per agent (public and private), and one line per command {#readme}
  e.g. a Codex user finds their install steps without reading Claude-specific text
- A quickstart takes a user from install to a first spec on their own repo {#quickstart}
  e.g. docs-init, then spec-start, on an existing repo, in about five minutes
- CREDITS.md names the packs whose mechanics we learned from and what each gave us {#credits}
  e.g. grilling -> Matt Pocock's skills
- CHANGELOG.md has an entry per release and flags any docs-format change {#changelog}
  e.g. v0.1.0 -> "docs-format 1"
- CONTRIBUTING.md says how to test a change with any supported agent {#contributing}
  e.g. a contributor using Codex runs the static checks and the Codex runner

## Not doing
- Everything in the backlog in `ROADMAP.md`: per-claim evidence (`verify.md`), a checker in a git hook and CI, computed change marks, a separate intent gate, approval by merge, `docs-status`, evals beyond the case minimum, a company docs repo template and a docs-init option to link it.
- The stage 2 check engine, review routing, production watch, products spanning several repos, and the SaaS control plane.
- The script that exports a private client copy. The name-neutral rule keeps that possible later.
- An MCP server, a runtime, an npm package, telemetry.
- Bulk import of Spec Kit, OpenSpec or Kiro specs.
- Merging pull requests.
- Copilot, Cursor and Gemini CLI as tested targets. They should work through the standard, but v0.1 tests only Claude Code and Codex.
- Pre-writing `behavior/` or `architecture/` for this repo. They are created at ship from what proved true.
