---
id: 2026-10-12-v0-1
kind: feature
status: shipped
summary: First release of scrubjay, six commands and two practices that give coding agents a spec workflow and project memory in docs/.
request: the Stage 1 design in reference/design.md
approved: {by: yousef, via: in session}
---
# Build scrubjay v0.1

> This bootstrap spec covers the whole first release, so it runs well past the ~80-line guideline. Later specs follow the guideline.
> Background: `reference/decisions.md` (wins on any conflict), `reference/design.md`, `reference/research.md`. Templates: `reference/templates/`.
> A markdown skill instructs; it can't enforce. Claims about what a command never touches or always does first are best-effort, and each one is the behavior case for its skill. Enforcement is the backlog checker.

## Why
Coding agents forget the project between sessions, so every new session needs re-explaining. They also build what was typed rather than what was meant, so the rework shows up after the code is written.
The packs we studied (Superpowers, Matt Pocock's skills, Addy Osmani's agent-skills) haven't solved durable memory across sessions. The spec tools (Spec Kit, OpenSpec, Kiro) each tie a project to their own format.
v0.1 exists to test two bets on real work: knowledge kept in `docs/` survives sessions, and grilling the intent before any code produces the right thing.

## What changes

### Add · setup/install
- A developer installs the pack in Claude Code from the GitHub repo with two commands {#claude-code}
  e.g. `/plugin marketplace add yousefallaban/scrubjay` then `/plugin install scrubjay@yousefallaban` -> `/scrubjay:spec-start` is available
- A developer installs the pack in Codex with two commands, adding the repo as a plugin marketplace and installing the plugin from it {#codex}
  e.g. `codex plugin marketplace add yousefallaban/scrubjay` then `codex plugin add scrubjay@yousefallaban` -> `$scrubjay:spec-start` is available
- Installing from a private copy works with the developer's existing git credentials, and the README gives the steps and known catches for each tested agent {#private-repo}
  e.g. after `gh auth login && gh auth setup-git`, the same two Claude Code commands install it from a private repo
- The pack needs only git on the user's machine. `gh` is optional and used only to open pull requests {#git-only}
  e.g. on a machine without `gh`, every command works, and spec-ship shows the PR text to paste

### Add · docs/init
- docs-init creates `index.md`, with what the product is, at least one domain with its owner, and the issue tracker's address when the team has one, and `architecture/stack.md` with the project's commands. The other files and folders are created on first write {#creates-skeleton}
  e.g. a repo with no `docs/` -> `index.md` says what the product is in the user's words, lists `returns · Sanne` and `issue-tracker: https://example.atlassian.net/browse/`, and `stack.md` holds the install and test commands
- docs-init writes the project-memory block into the root AGENTS.md between its markers, leaves everything outside the markers untouched, and names any nested AGENTS.md it finds, since the block is root-only {#writes-block}
  e.g. an AGENTS.md holding a client's own rules -> those rules stay exactly as they were, the block is added, and `packages/api/AGENTS.md` is listed as not covered
- With the block in place, a new session answers a question about a documented capability from `behavior/` and cites the claim reference, without reading the code {#answers-from-docs}
  e.g. "how are partial refunds calculated?" -> the answer cites `returns/submit-return#partial-refund` and opens no source file
- docs-init makes sure a root CLAUDE.md imports AGENTS.md, creating a one-line CLAUDE.md when the repo has none, and ends by confirming the block loads in a new session {#links-claude-md}
  e.g. a repo with no CLAUDE.md under a parent folder that has one -> `CLAUDE.md` holds `@AGENTS.md`, and a new session shows the block in context
- When `docs/` already serves a documentation site, docs-init asks for a subfolder and records that path in the block {#docs-path}
  e.g. a repo with a docs site in `docs/` -> memory goes to `docs/project/`, and the block points there
- When Spec Kit, OpenSpec or Kiro files exist, docs-init adds their folders to the never-write list in the block and says so. Nothing is moved or imported {#existing-spec-tools}
  e.g. an `openspec/` folder -> the block lists it as never-write, and the folder is untouched
- Running docs-init again only refreshes the block between the markers {#rerun-safe}
  e.g. a rerun after a pack update -> the block text is updated, and no docs file changes

### Add · docs/map
- docs-map documents one domain the user names, never the whole app, and adds that domain's row to `index.md` when it is missing {#one-domain}
  e.g. "map returns" -> drafts for `behavior/returns/` only, and a `returns` row in `index.md`
- docs-map reads that domain's code and drafts 3 to 7 claims per capability, each with an example {#drafts-claims}
  e.g. returns -> `submit-return.md` with a claim for partial refunds
- docs-map writes only the architecture area files and glossary terms that the domain needs {#only-what-it-needs}
  e.g. returns call a payment provider -> `integrations.md` gets a row, and `config.md` is not created
- docs-map writes nothing until the domain's owner confirms the drafts {#owner-confirms}
  e.g. the owner corrects a claim -> the corrected text is what gets written
- docs-map reads old Spec Kit, OpenSpec or Kiro specs for the domain as input and never edits them {#reads-old-specs}
  e.g. `openspec/specs/returns/` exists -> its rules show up as draft claims for the owner to confirm

### Add · spec/start
- spec-start creates `specs/<date>-<slug>/spec.md` and a branch named after the slug, starting from a sentence, a ticket, or commits already made, and records that start as `request:`, plus `issue:` with the ticket key when there is one {#creates-spec}
  e.g. `spec-start HUB-123 customers can save items to a wishlist` -> `specs/2026-10-12-add-wishlist/spec.md` on branch `add-wishlist`, with `request: customers can save items to a wishlist` and `issue: HUB-123`
- spec-start sets the kind, feature or fix. A feature is grilled and planned and needs the owner's go before planning. A fix takes the fast path and needs the owner's go before ship only when it changes behavior {#sets-kind}
  e.g. a dependency bump -> a fix with "No behavior change", no plan.md and no go; a wrong rounding that breaks a documented claim -> "No behavior change" with `restores:` naming that claim, and no new go; a new rounding rule -> one claim under Change, and the owner's go before ship
- spec-start settles why and what by grilling, and grilling ends when nothing is left that only the owner can answer {#grills}
  e.g. the wishlist -> rounds on who saves, duplicates and devices before any claim is written; the remaining questions are answerable from the code -> grilling stops and the agent looks them up
- For a fix, spec-start writes the spec in one pass and grills only on what is ambiguous {#fast-path}
  e.g. `spec-start partial refunds are one cent off` -> a fix spec in a few minutes, with "No behavior change" and `restores: returns/submit-return#partial-refund`
- spec-start writes What changes as claims under `Add`, `Change` and `Remove` headings. A Change has a `was:` line and a Remove has a `reason:` line {#what-changes-format}
  e.g. the refund fix -> `### Change · returns/submit-return` with the old text under `was:`
- When the spec touches a domain that has no behavior docs, spec-start offers to map that domain first {#offers-map}
  e.g. a spec on returns, with no `behavior/returns/` -> "Map returns first?"
- The owner who says go is the one `index.md` lists for the domain. spec-start adds the row for a new domain, with its owner, before any go is asked. When the owner is the user, their OK in session is the go {#owner-is-listed}
  e.g. the wishlist is a new domain -> spec-start asks who owns it and adds the row; a solo developer says "OK, go" -> `approved: {by: <user>, via: in session}`
- The owner's go is recorded only when the user reports one, as `approved: {by, via}`, and only once Open questions is empty {#records-go}
  e.g. "Sanne approved on Slack" plus a link -> `approved: {by: sanne, via: "<link>"}`

### Add · spec/plan
- spec-plan does not plan a feature until the owner's go is recorded {#needs-go}
  e.g. a draft feature spec -> spec-plan says the go is missing and stops
- spec-plan writes `plan.md` with the approach, the files to touch with a one-line reason each, and the architecture files spec-ship updates, each with the reference file it comes from {#writes-plan}
  e.g. the wishlist -> four files listed, and `data-model.md, from reference/data-model.md` under Architecture to update at ship
- spec-plan writes `tasks.md`, where each task fits one session and names the claim IDs, or the check, that prove it done {#writes-tasks}
  e.g. `- [ ] T1 Wishlist table and API -> saves-item, no-duplicates`
- Working material goes into `reference/`, and each file opens with a line saying what it is {#reference-files}
  e.g. a data model sketch -> `reference/data-model.md` starting with `Purpose: draft data model for the wishlist.`
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
- Every session writes one line above the tasks in `tasks.md` with the date, where it resumed, and the gist of the user's first message, never a verdict {#session-line}
  e.g. `Session 2026-10-14: resumed at T3; first message: "continue".`
- What blocked a task, or what was tried and dropped, is kept as a note of at most two lines under that task {#notes}
  e.g. `- note: tried a client-side cache first; dropped, it went stale across devices`
- spec-build asks before touching a file that is not listed in plan.md {#stays-in-scope}
  e.g. a fix needs a shared helper changed -> "This file isn't in the plan. Add it?"
- When the user changes course mid-spec, the agent updates the file the change belongs to: `spec.md` for why or what, `plan.md` for how, `reference/` for details {#updates-owner-file}
  e.g. "guests should be able to save too" -> a new claim in `spec.md`
- The agent rechecks every task, marks each keep, redo, new or drop with a one-line reason, and records one recheck line in `tasks.md` {#rechecks-tasks}
  e.g. `Rechecked 2026-10-14 after: guests can save. T2 redo, T4 new.`
- No affected task is built until the user OKs the recheck {#waits-for-recheck-ok}
  e.g. the user drops T4 -> the list is updated, then the build continues
- When Why or What changes changes, the agent removes the `approved` line, and affected tasks wait until the owner's new go writes it back {#renews-go}
  e.g. the guest claim added -> `approved` is removed; Sanne's new go restores it, and the build continues
- When a change contradicts Not doing or grows the scope, the agent proposes a follow-up spec instead {#follow-up-spec}
  e.g. "also share wishlists" while sharing is under Not doing -> "Start a separate spec for sharing?"

### Add · spec/ship
- spec-ship runs the project's test command and stops when it fails {#runs-tests}
  e.g. one failing test -> no docs change, and the failure is reported
- spec-ship does not ship a feature, or a fix that changes behavior, without a recorded go {#ships-with-go}
  e.g. a fix with a claim under Change and no `approved` line -> "The owner of returns/submit-return hasn't said go"
- A fresh reviewer that did not write the code compares the diff with `spec.md` and with plan.md's file list, and its findings go into the PR description {#fresh-review}
  e.g. a file changed outside the plan -> listed as a finding
- spec-ship copies the claims in `spec.md` into `behavior/` without rewording, applying each Add, Change and Remove {#updates-behavior}
  e.g. the wishlist ships -> `behavior/wishlist/save-item.md` holds exactly the three claims from the spec
- spec-ship updates the architecture files plan.md lists, from the reference files it names, and adds a domain row to `index.md` only when one is still missing {#updates-architecture}
  e.g. plan.md lists `data-model.md, from reference/data-model.md` -> `architecture/data-model.md` holds the wishlist table, and the reference file is unchanged
- spec-ship sets the status to shipped inside the same pull request {#sets-shipped}
  e.g. the PR merges -> code, docs and `status: shipped` land on main together
- spec-ship asks whether to create the PR or show its title and description to paste. Without `gh` it shows them. The title is `type(scope): objective`: the kind as type, `refactor` for a fix with no behavior change, the issue key or else the slug as scope, and the spec's title as objective. spec-ship never merges {#pr-choice}
  e.g. "show" chosen -> `feature(HUB-123): Add wishlist`, or `feature(add-wishlist): Add wishlist` without a ticket, and the description, ready to paste
- The PR description fills the repo's own pull request template when it has one, and otherwise spec-ship's: Links, the ticket and the spec; Description, the why and the claims added, changed or removed; Unrelated changes, the files changed outside plan.md or `None.`; Release impact, derived from the kind and the claims and confirmed by the user; Review, the fresh reviewer's findings; Outcome {#pr-template}
  e.g. a feature with `issue: HUB-123` -> `- **Jira:** [HUB-123 — Add wishlist](https://example.atlassian.net/browse/HUB-123)`, `**Release impact:** MINOR`, and `None.` under Unrelated changes
- The PR description states how many sessions the spec took, how many the user says needed re-explaining, and what changed between the request and the shipped claims {#reports-outcome}
  e.g. spec-ship asks "Which of the 4 sessions needed re-explaining?" -> `Sessions: 4, re-explained: 0. Grilling added guest saving and kept sharing out.`

### Add · practice/grilling
- Questions come in numbered rounds, every question answerable now, each with a recommended answer {#rounds}
  e.g. `3. Does saving the same product twice keep one entry? Recommended: yes.`
- Facts are looked up in the code and docs, never asked {#looks-up-facts}
  e.g. "which database?" -> answered from `architecture/stack.md`, not put to the user
- Each answer is written where its topic belongs the moment it settles: why and what to `spec.md`, how to `plan.md` or `reference/`, lasting choices to `decisions/`, new terms to `glossary.md` {#writes-as-it-settles}
  e.g. storing wishlists on the server is agreed -> `decisions/2026-10-12-wishlist-stored-server-side.md` exists before the round ends

### Add · practice/docs-conventions
- Every file a command writes starts from its template, with the frontmatter and headings exactly as the template has them {#from-template}
  e.g. a new decision -> `Context`, `Options`, `Decision`, `Consequences`, in that order
- Project files contain no guidance comments and no empty sections. Optional sections are deleted, never filled with "None" or "TBD" {#no-placeholders}
  e.g. a plan with no rollout concerns -> no Rollout heading
- Each file holds only its own job, and content that belongs elsewhere goes to the file docs-conventions names for it {#one-job}
  e.g. a business rule found while writing `glossary.md` -> it becomes a claim in `behavior/`
- Claims follow the claim format, 3 to 7 per capability. Tests and tasks reference a claim by `capability#id` whenever the bare ID is not unique in the spec {#claim-format}
  e.g. `- Saving the same product twice keeps one entry {#no-duplicates}` with an `e.g.` line under it, referenced as `wishlist/save-item#no-duplicates`
- `index.md` records the docs-format version, and a template change applies to new files only {#docs-format}
  e.g. a template gains a section -> shipped specs are never rewritten

### Add · pack/portability
- Every skill is a SKILL.md that follows the Agent Skills standard, so any agent that supports the standard can load it {#agent-skills}
  e.g. the same `spec-start` folder loads in Claude Code and Codex
- The installed plugin is only the plugin folder: skills, templates, manifests, the plugin's README and its eval cases, never this repo's docs, checks or CI {#plugin-folder}
  e.g. after install, the installed plugin folder holds no `docs/specs/` and no `checks/` from this repo
- The product name appears only in the manifests and README files. Skills, templates and the project-memory markers carry no name {#name-neutral}
  e.g. a private copy named canon differs from scrubjay only in those files, and a project set up with one works with the other
- A skill that uses a feature only some agents have states what to do without it {#fallbacks}
  e.g. no sub-agents -> "open a fresh session for the review"; no question tool -> ask in plain text

### Add · pack/quality
- Each skill has at least 3 cases that should trigger it, 2 that should not, and 1 behavior case, stored once as plain prompt and grader files, plus a scaffold script where the case needs a repo state. The behavior case covers the claim the skill can only instruct, not enforce {#case-minimum}
  e.g. "customers should be able to save items for later" triggers spec-start; "what does this regex do?" triggers nothing; docs-init's behavior case scaffolds an AGENTS.md with a client's rules and checks they are unchanged outside the markers
- Before v0.1 is released, every case passes on Claude Code through its eval command, and each command has been run once by hand on Codex {#two-agents}
  e.g. a trigger case that fails on Claude Code, or a command that doesn't load on Codex, blocks the release
- The claims the block drives, answers-from-docs, resumes and session-line, are checked by hand on `scrubjay-example` on both agents before release, and the transcripts are kept, since eval runs load no project instructions {#block-cases}
  e.g. a fresh Codex session on `add-wishlist` reports "T3 is next" unprompted -> the transcript is saved under the case
- Static checks run without any agent installed, and CI runs them on every pull request: skill frontmatter, manifests against their published formats, templates that parse and exist where docs-conventions lists them, the product name only in allowed files, and internal links that resolve {#static-checks}
  e.g. a PR with a SKILL.md missing its description -> CI fails on a machine with no agent CLI

### Add · pack/docs
- The README tells a new user what the pack is, the two bets, how to install it per tested agent (public and private), one line per command, and how to test a change {#readme}
  e.g. a Codex user finds their install steps without reading Claude-specific text
- A quickstart takes a user from install to a first spec on their own repo {#quickstart}
  e.g. docs-init, then spec-start, on an existing repo, in about five minutes
- CREDITS.md names the packs whose mechanics we learned from and what each gave us {#credits}
  e.g. grilling -> Matt Pocock's skills

## Not doing
- Everything in the backlog in `ROADMAP.md`: per-claim evidence (`verify.md`), a checker in a git hook and CI, computed change marks, a separate intent gate, approval by merge, `docs-status`, evals beyond the case minimum, a company docs repo template and a docs-init option to link it.
- A neutral case format with per-agent runners, a fixtures framework, and agent cases in CI. v0.1 runs cases with Claude Code's eval command and checks Codex by hand; a case that needs a repo state carries its own scaffold script.
- Monorepos with nested AGENTS.md files. The block is root-only, and docs-init names the nested files it finds.
- Archiving or importing Spec Kit, OpenSpec or Kiro files. docs-init only marks their folders never-write; docs-map reads them on touch.
- Migrating the docs format. Only format 1 exists, so `docs-format` is recorded and nothing else.
- Refactor and chore as kinds of their own. They are fixes that write "No behavior change."
- Company knowledge links from `index.md`.
- CHANGELOG.md and CONTRIBUTING.md. The README covers releases and how to test a change until a second contributor arrives.
- The stage 2 check engine, review routing, production watch, products spanning several repos, and the SaaS control plane.
- The script that exports a private client copy. The name-neutral rule keeps that possible later.
- An MCP server, a runtime, an npm package, telemetry.
- Merging pull requests.
- Commit message conventions. The branch names the spec; a company or project convention can sit alongside.
- Copilot, Cursor and Gemini CLI as tested targets. They should work through the standard, but v0.1 tests only Claude Code and Codex.
- Pre-writing `behavior/` or `architecture/` for this repo. They are created at ship from what proved true.
