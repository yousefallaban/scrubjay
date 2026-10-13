Purpose: every decision made while designing v0.1, with its reason and when to revisit it. Where this file and design.md differ, this file wins.

At ship, the decisions that outlive v0.1 are promoted to `docs/decisions/`, one record each.

## Scope

**D1. v0.1 tests two bets and nothing else.**
The bets: agents keep project knowledge across sessions when it lives in `docs/`, and they build the right thing when intent is grilled before any code.
- Why: everything else waits until real use shows it is needed. That keeps the pack small enough to learn from.
- Revisit when: a backlog signal in `ROADMAP.md` shows up in real use.

**D2. We own the workflow skills, learn mechanics from other packs, and leave specialist skills to the team.**
- Why: one voice and our own paths, so the workflow and the memory can't drift apart. Addy Osmani's comparison warns against running two packs as routers at once, so ours is the only router. Learning means rewriting a mechanic in our own words, never copying text. CREDITS.md names the sources.
- Revisit when: a specialist skill needs to write workflow files.

## Workflow

**D3. Six commands and two practices.**
The commands are `docs-init`, `docs-map`, `spec-start`, `spec-plan`, `spec-build` and `spec-ship`. The practices are `grilling` and `docs-conventions`.
- Why: commands are typed by a person, and practices are loaded by the agent. That split comes from Matt Pocock. Commands start with `spec-` or `docs-` so they don't collide with the commands of the packs we studied.
- Revisit when: a step is skipped in most real specs (merge it), or a step keeps growing past one job (split it).

**D4. The steps are skills, not agents.**
Sub-agents are used only where a fresh context is the point: fact lookups while grilling, reading a domain's code in docs-map, and the reviewer in spec-ship.
- Why: grilling needs the user in the conversation, and a sub-agent can't hold that conversation.
- Revisit when: agents can hold a conversation with the user from a sub-agent.

**D5. Every skill has the same sections: overview, when to use, process, common rationalizations, red flags, verification.**
- Why: this is Addy Osmani's skill anatomy. Rationalizations and red flags make steps harder for an agent to skip.
- Revisit when: test-first skill writing (D26) shows a section never changes behavior.

**D6. The kind decides the flow.**

| Kind | Steps | Who says go |
| --- | --- | --- |
| feature | start, plan, build, ship | the owner, after spec-start |
| fix | start, build with a failing test first, ship; a plan only when it takes several steps | the owner of the affected capability, before ship |
| refactor | start, plan, build, ship; the spec says "No behavior change." | engineering |
| chore | start, build, ship | nobody |

The statuses are draft, approved, building, shipped and cancelled.
- Why: small work needs a fast path, or people skip the flow entirely.
- Revisit when: real specs show a kind's overhead is larger than the change itself.

**D7. One branch per spec, named after the slug. The commit-prefix rule is dropped, and the PR title starts with the slug.**
- Why: the branch already ties every commit to the spec while the work is open. Squash merges replace commit messages with the PR title anyway, so `git log --grep <slug>` on main finds the commit, then the PR, then the spec. One less rule for agents to forget.
- Revisit when: a team doesn't squash-merge and needs a commit-level link.

**D8. The owner's go can come from any channel, and it is recorded as `approved: {by, via}` only when the user reports it.**
When Why or What changes changes, the agent removes the line, and the owner's new go writes it back.
- Why: the owner is often not in the session. `via` (in session, a message link, or a PR) lets anyone check the approval later. The agent never infers a go. There is no date field: git dates the line, and removing the line on change means its presence alone says the go is current, with no date comparison. A date key `on` was dropped, partly because YAML 1.1 parsers read an unquoted `on` as boolean `true`.
- Revisit when: a second person must approve. Approval by merge is in the backlog.

**D9. A change mid-spec never restarts the flow.**
The agent updates the file the change belongs to, rechecks every task (keep, redo, new or drop), and waits for an OK. If Why or What changes changed, the `approved` line is removed until the owner says go again. A change that grows the scope becomes a follow-up spec.
- Why: people change their minds. Restarting wastes work, and silent edits break the link between the spec and the code.
- Revisit when: rechecks become noisy in practice.

**D10. spec-ship runs the tests, has a fresh reviewer compare the diff with the spec, updates `behavior/` and `architecture/`, and sets shipped inside the PR. It asks whether to create the PR or show the text to paste, and it never merges.**
- Why: shipped becomes true on main exactly when the code merges. Merging is the team's decision, and without `gh`, showing the text is the only option.
- Revisit when: a team wants spec-ship to open draft PRs automatically.

## Docs layer

**D11. Project memory lives in `docs/`, with a file charter: one job per file, and a "never contains" column for each.**
The files are `index.md`, `glossary.md`, `behavior/<domain>/<capability>.md`, `architecture/` (an index plus area files created when needed) and `decisions/`, plus one folder per spec.
- Why: small files with one job each stay true and cheap to load. The "never contains" column says where content goes instead.
- Revisit when: agents regularly load more than three docs files for an ordinary task.

**D12. `spec.md` holds both why and what. There is no separate `intent.md`.**
- Why: a separate intent file adds a gate and a file for a split most specs don't need. Why stays short (2 to 5 lines), and the owner approves both together.
- Revisit when: owners want the why agreed before any exact behavior is written. A separate intent file with its own gate is in the backlog.

**D13. `plan.md` and `tasks.md` stay separate files.**
- Why: the plan is how (it changes when the approach changes), and the tasks are progress (they change every session). Each step reads and writes one file.
- Revisit when: real plans are consistently a few lines.

**D14. Each spec has `reference/` for working material, which is promoted rather than linked at ship.**
- Why: architecture always holds the complete current state, so no agent has to read old specs to learn how the system works. The reference file stays behind as the record of the draft.
- Revisit when: promotion is regularly skipped or done wrong.

**D15. Claims follow one format, 3 to 7 per capability, and test names carry the claim reference.**
```
- <Actor> <does or sees something observable, present tense> {#claim-id}
  e.g. <a concrete situation> -> <the observable result>
```
- Why: one testable sentence per claim, readable by owners. The claim ID in the test name lets anyone find the test behind a claim.
- Revisit when: owners can't read the claims, or tests can't be linked to them.

**D16. What changes uses the words `Add`, `Change` and `Remove`, not `+`, `~` or `-` marks.**
A Change carries a `was:` line, and a Remove carries a `reason:` line.
- Why: plain words are clear to everyone, and the marks were confusing when someone changed their mind within a session. Computing the marks against main is in the backlog.
- Revisit when: hand-written change lists go wrong or conflict.

**D17. Templates hold frontmatter and fixed headings only. Guidance comments are removed when a file is written, optional sections are deleted when empty, and `index.md` records the docs-format version.**
- Why: placeholder text gets treated as real content by later agents, and agents find content by heading.
- Revisit when: a template change needs to migrate existing files.

**D18. Company knowledge sits one layer above `docs/`. Projects link to it and never copy it.**
Company rules live in a company skill pack, company facts in a company docs repo shaped like `docs/`, and project memory in the project's `docs/`. Company policies always win. Company defaults can be overridden only with a decision record. For a freelancer, a client's rules come from the client's pack or docs repo, and your own way of working is your personal pack.
- Why: copies drift, and links don't.
- Revisit when: several products share knowledge. A company docs repo template is in the backlog.

**D19. When Spec Kit, OpenSpec or Kiro files exist, docs-init asks whether to archive them (the default) or leave them in place.**
Archiving moves the content to `docs/archive/<tool>/` with a README. Either way their folders join the never-write list, the choice is recorded in `index.md`, and docs-map reads them on touch. The tools' setup files are listed for the user to remove, never touched.
- Why: bulk conversion turns stale specs into "truth." Work already in flight in the old tool can finish there.
- Revisit when: users ask for a guided migration.

## Packaging and names

**D20. The pack builds on open formats: Agent Skills (SKILL.md), Agent Plugins (`plugin.json`), the Claude Code plugin and marketplace manifests, and AGENTS.md.**
- Why: formats, not code dependencies. Agent Skills is supported by Claude Code, Codex, Copilot and VS Code, Cursor, Gemini CLI, Kiro and others. Claude Code isn't on the Agent Plugins client list, so it gets its own manifests.
- Revisit when: an agent we test drops one of these formats, or a standard absorbs another.

**D21. Users need git and nothing else. `gh` is optional, and there is no MCP server, runtime, npm package or telemetry.**
- Why: nothing to run, nothing to break, nothing to trust beyond markdown.
- Revisit when: the stage 2 engine needs code.

**D22. The plugin lives in its own subfolder of the repo.**
- Why: Claude Code copies the whole plugin source into each user's cache. A subfolder keeps this repo's docs, tests and CI out of users' installs.
- Revisit when: never, unless the agents change how they install plugins.

**D23. The public pack is named `scrubjay`. Private client copies are named `canon`.**
The public repo is `yousefallaban/scrubjay`, and its marketplace name is `yousefallaban`. It stays private until v0.1 works, then goes public under MIT. Client copies are made by one-way export into the client's org, and nothing from client work ever flows back.
- Why: scrub-jays remember what they hid, where and when, which is the product in one sentence. No dev or agent tool uses the name. `canon` collides publicly (canonhq, erclx/canon), which doesn't matter inside a private client org.
- Revisit when: a trademark check (EUIPO TMview) before going public flags the name.

**D24. The product name appears only in the manifests and README files. Skill names, templates and the markers are name-neutral (`<!-- project-memory:start -->` / `<!-- project-memory:end -->`).**
- Why: a client copy differs from the public pack only in those files, so a project set up with one works with the other, and switching never leaves stale markers.
- Revisit when: never. This is what keeps client copies cheap.

## Building and testing

**D25. Building the pack is not tied to any agent.**
Repo instructions live in AGENTS.md, and CLAUDE.md only imports it. Agent-specific files sit in adapter locations. No skill depends on a feature only one agent has without stating a fallback.
- Why: Yousef may build with Codex as easily as with Claude Code, and the pack itself must work in both.
- Revisit when: never.

**D26. v0.1 uses two testing patterns: skills written test-first, and a minimum number of cases per skill.**
Test-first (from Superpowers) means you watch the agent fail without the skill, write the smallest skill that fixes it, then close the loopholes the agent finds. The case minimum (from Addy Osmani) is 3 trigger cases, 2 non-trigger cases and 1 behavior case per skill.
- Why: both are cheap and work in any agent. Behavior evals in CI, rubric graders for grilling, a fixtures framework and release gates are deferred until contributors arrive.
- Revisit when: contributors arrive, or skills regress after a model change.

**D27. Cases are plain, neutral data, with one runner per agent. Static checks need no agent CLI. v0.1 runs the cases on Claude Code and Codex.**
- Why: `claude plugin eval` and `claude plugin validate` only run in Claude Code. Neutral cases plus thin runners keep testing possible from any agent, and adding an agent means adding a runner, never rewriting cases.
- Revisit when: a cross-agent eval standard appears.

**D28. A separate repo, `scrubjay-example`, serves as the sandbox now and as the public example and eval fixtures later.**
It is a small app with its starting state tagged `baseline`. Experiments run on branches, and a messy branch is deleted and restarted from `baseline`.
- Why: one repo does three jobs (sandbox, fixtures, documentation by example) without putting experiments in this repo.
- Revisit when: fixtures need more than one app shape.

**D29. This repo uses its own flow by hand until the skills exist.**
The building agent writes `plan.md` and `tasks.md` for this spec and works task by task. At ship, `behavior/`, `architecture/` and `decisions/` are created from what proved true.
- Why: building the pack with the pack gives daily friction feedback, and it avoids mapping everything up front, which the design itself forbids.
- Revisit when: v0.1 ships. From then on, the pack's own commands run here.

## Review of 2026-10-12

Appended after a fresh review of the spec against the two bets. Each entry says which earlier decision it supersedes or extends.

**D30. v0.1 testing is static checks in CI, cases as plain files, Claude Code as the eval runner, and Codex by hand.**
Supersedes the neutral case format, per-agent runners, fixture projects and the Codex release gate in D26 and D27. Static checks (frontmatter, manifests, templates, name, links) run on every PR. Cases are the plain prompt and criteria files that `claude plugin eval init` writes, so any agent or person can read them. Before release, every case passes on Claude Code and each command is run once by hand on Codex.
- Why: a case format, two runners and fixtures test the pack, not the bets, and they were the largest block of work in the spec. Codex plugin installs are UI-driven, so a Codex runner can't be scripted anyway.
- Revisit when: a second contributor arrives, or skills regress after a model change.

**D31. The bets are measured in files the flow already writes.**
`spec.md` records what the spec started from as `request:`. Every session writes one line above the tasks in `tasks.md`: date, where it resumed, whether it needed re-explaining. spec-ship puts the session count, the re-explain count and what changed between the request and the shipped claims into the PR description.
- Why: v0.1 exists to test the bets, and nothing recorded whether they held. The kill-or-rethink rule in ROADMAP needs numbers, not an impression.
- Revisit when: the measures are never read, or a measure is needed that these lines can't give.

**D32. Two kinds, feature and fix. Three statuses, draft, building and shipped. One go rule.**
Supersedes the kind table and status list in D6. A feature is grilled and planned and needs the owner's go before planning. A fix takes the fast path, writes a failing test first, and needs the owner's go before ship only when it has claims. A fix with no claims writes "No behavior change." Refactor and chore are fixes. The owner is whoever `index.md` lists for the domain; when that is the user, their OK in session is the go. The go is the `approved` line, never a status.
- Why: the bets need one distinction, whether the change alters behavior. Four kinds with four approvers was where a first-time user got lost, refactor's "engineering" go was recorded nowhere, and `status: approved` duplicated the line D8 already made the single source of truth.
- Revisit when: a real refactor or chore shows it needs its own steps.

**D33. Changing course lives in spec-build, and ambiguous claim IDs are written as `capability#id`.**
The five change-course claims sit under spec/build, since that is where a change arrives. Tests and tasks reference a claim by `capability#id` whenever the bare ID is not unique in the spec.
- Why: a claim no skill owns won't be written. Bare IDs collided across capabilities and broke the task-to-claim link.
- Revisit when: a change arrives so often outside building that it needs its own command.

**D34. Existing Spec Kit, OpenSpec or Kiro folders are only marked never-write.**
Supersedes the archive option in D19. docs-init lists the folders it finds in the block's never-write slot and says so. Nothing is moved, imported or recorded in `index.md`. docs-map still reads them as input on touch.
- Why: the archive flow was four artifacts for users of other tools, on a release that tests the bets on our own work, and the riskiest file operation docs-init did.
- Revisit when: users arrive from those tools and ask for a guided migration.

**D35. Skills instruct, they don't enforce. Best-effort claims say so, and each is its skill's behavior case.**
Claims such as "leaves everything outside the markers untouched", "only refreshes the block", "asks before touching a file not in the plan", "copies without rewording" and "writes a failing test first" are best-effort. The spec says so once, up front. The `safe-update` claim is dropped: only docs-format 1 exists, so there is no migration to test, and a pack update runs nothing in the project.
- Why: a markdown skill can only change what the agent is told. Ticking an unenforceable claim as done gives false confidence. Enforcement is the backlog checker.
- Revisit when: the checker arrives.

**D36. docs-init writes `index.md` and `architecture/stack.md`. There is no `architecture/index.md`, folders are created on first write, and `index.md` has no company-knowledge section in v0.1.**
Supersedes the skeleton in D11 and defers D18 to the roadmap as direction. stack.md holds the project's commands from the start, so spec-ship can run the tests on a repo that never ran docs-map. The architecture folder listing is its own index.
- Why: every file three skills must keep in sync is a place for docs/ to go stale, which is bet A's failure mode. Empty folders don't survive a commit. The test command had no source on the quickstart path.
- Revisit when: an architecture folder grows past what a listing explains.

**D37. docs-init adds the CLAUDE.md import only when a CLAUDE.md exists.**
Claude Code 2.1.277 and later reads AGENTS.md when no CLAUDE.md exists in the folder or above it. With a CLAUDE.md present it reads only CLAUDE.md, unless that file imports AGENTS.md. Bedrock, Vertex, Foundry and older versions still need the import; the README says so.
- Why: the earlier claim targeted the case that now needs nothing and missed the case that silently drops the block.
- Revisit when: Claude Code reads both files by default.

**D38. One marketplace file serves both agents, and the plugin manifest is a root `plugin.json` in the Agent Plugins format.**
Extends D20 and D22. `.claude-plugin/marketplace.json` lists the plugin with a relative source into the plugin subfolder; Codex accepts that path as a legacy location and supports `git-subdir`. The plugin root carries `plugin.json` with the Agent Plugins schema, which Codex reads. A `.claude-plugin/plugin.json` is added only if Claude Code refuses a root manifest; its eval docs name both locations, so this is checked at build.
- Why: one file per concern instead of one per agent, and fewer manifests for the static checks and the name rule to cover.
- Revisit when: either agent drops support for the shared location.

**D39. spec-ship updates exactly the architecture files plan.md lists, and reference files are not marked.**
Supersedes the promotion mechanics in D14. plan.md's "Architecture to update at ship" names each area file and the reference file it comes from. spec-ship applies that list. The reference file stays as it was.
- Why: a "stays true" judgment at ship was the step most likely to be skipped or done wrong, and the plan already made the call. Bet A needs architecture/ to be true, not reference files to be annotated.
- Revisit when: plans regularly miss an architecture update that ship then has to find.

**D40. The baseline run comes before any skill, and bet A is built before bet B.**
Extends D29. The first task runs OpenSpec plus Matt Pocock's `grill-me` on one real task. The docs layer, the block and resume come next. Grilling comes after.
- Why: the baseline says how much to build, and it checks bet B's premise for free since grill-me exists. Bet A is the riskier bet: the comparison we cite says no pack has solved it.
- Revisit when: never. This is the order for v0.1.

**D41. Every skill has overview, when to use, process and verification. Rationalizations and red flags only where an agent is tempted to skip.**
Supersedes D5. docs-init and spec-ship need no rationalization table; spec-start, spec-build and grilling do.
- Why: fixed sections bloat the simple skills, and D5's own revisit clause said to drop a section that never changes behavior.
- Revisit when: test-first writing shows a simple skill being skipped.

## Second review of 2026-10-12: architecture and best practices

**D42. docs-init always makes a root CLAUDE.md import AGENTS.md, and ends by confirming the block loads.**
Supersedes D37. Claude Code counts a `CLAUDE.md`, `.claude/CLAUDE.md` or `CLAUDE.local.md` in the working directory or any directory above it, so a parent folder's file, an older version, or Bedrock, Vertex and Foundry hide AGENTS.md with no error. docs-init writes the import into an existing CLAUDE.md or creates a one-line one, an adapter file the neutrality rule allows, and its last step is to start a session and confirm the block is in context.
- Why: the block is the only thing that sends an unprompted session to `docs/`. If it isn't loaded, bet A fails for a reason that has nothing to do with the bet, and the measures in D31 mean nothing.
- Revisit when: Claude Code reads AGENTS.md regardless of CLAUDE.md files above the repo.

**D43. The block-driven claims are checked by hand on `scrubjay-example`, on both agents, with transcripts kept. Cases that need a repo state carry a scaffold script.**
Extends D30. `claude plugin eval` runs load no project instructions: no CLAUDE.md, no `.claude/` directory, nothing from above or inside the workspace. So `answers-from-docs`, `resumes` and `session-line` can't be graded by the eval runner; a prompt that tells the agent to read tasks.md tests nothing about the block. Each eval run starts in an empty directory, so a behavior case that needs files or git state names a Bash scaffold script in its case folder, run with `--scaffold`.
- Why: these three claims are bet A. The runner gives trigger and behavior coverage for the commands and zero evidence for the block.
- Revisit when: the eval runner can load project instructions, or a cross-agent runner appears.

**D44. `index.md` lists at least one domain from init, and the row for a new domain is added the moment it is named. The Behavior column is dropped.**
Extends D32 and D36. docs-init asks for the first domain and its owner. spec-start and docs-map add a row when they meet a domain that has none, before any go is asked. The path to a domain's behavior is a rule stated once above the table, not a column.
- Why: an empty required table broke the no-placeholders rule, the owner lookup had no row to find for a new domain when the go was needed, and a derived column drifts.
- Revisit when: a domain needs more than a name, a scope and an owner.

**D45. Two marketplace files, one per agent, each validated against its own schema. One root `plugin.json` for Codex. No Claude Code manifest.**
Supersedes the one-file half of D38. Codex requires `policy.installation`, `policy.authentication` and `category` on every entry at `.agents/plugins/marketplace.json`; Claude Code's validator warns on those as unknown fields, so one shared file never passes `--strict`. Claude Code's own manifest is optional: without `.claude-plugin/plugin.json` it loads `skills/` from the standard layout and takes the plugin name from the marketplace entry. A root `plugin.json` is not read by Claude Code and is read by Codex, so it is Codex's manifest. Manifests are adapter files. The marketplace clone in a user's cache is the whole repo; only the installed plugin folder is clean, and the spec says so.
- Why: each agent reads its own documented path, and CI can run each validator strictly.
- Revisit when: either agent reads the other's location without warnings.

**D46. Templates live under `assets/` in the docs-conventions skill. Command skills never name a template path. docs-conventions holds the charter and the claim format; per-file rules are references loaded by the command that writes the file.**
The Agent Skills standard keeps file references one level deep from a skill's root, and Claude Code's skill directory variable points at the skill's own folder, not the plugin root. A `../docs-conventions/templates/x.md` reference works only when the pack is installed whole. So a command says "load docs-conventions and write from its template for `<file>`", and docs-conventions lists its templates under `assets/`. Its SKILL.md holds only the charter table and the claim format; section rules per file go to `references/<file>.md`, loaded on demand. The baseline task measures resident tokens and records the number.
- Why: a broken template reference makes the agent improvise a file shape, which is bet A's drift failure. docs-conventions is loaded by every command, so every line in it is a recurring cost.
- Revisit when: an agent resolves plugin-root paths from a skill, or the measured cost is small.

**D47. The block is root-only in v0.1. docs-init names nested AGENTS.md files it finds, and monorepos with nested files are under Not doing.**
The AGENTS.md convention says the closest file to the edited file wins. Claude Code concatenates; whether Codex and others drop the root file inside a package is unverified.
- Why: the design cited the nearest-wins rule as the reason for one root block without noticing it cuts the other way.
- Revisit when: a monorepo user arrives. The fix is the same block, same markers, in each nested file, which `rerun-safe` already covers.

**D48. The session line records facts, and the re-explain count comes from the user at ship.**
Supersedes the session line in D31. Each session writes the date, where it resumed, and the gist of the user's first message. spec-ship asks the user which sessions needed re-explaining and puts that count in the PR description.
- Why: "whether it needed re-explaining" was the agent grading itself, and the kill-or-rethink rule keys on that number.
- Revisit when: a transcript-based measure exists that needs no one's verdict.

**D49. A skill body starts with the process, then verification, then red flags where D41 allows. What and when live in the description. Practices are marked not user-invocable.**
Supersedes the section order in D41. The standard puts what and when in `description` and recommends a body of steps, examples and edge cases; Claude Code keeps only the start of a skill after compaction, so an overview at the top spends the lines that survive. Practices carry Claude Code's `user-invocable: false`; if an agent's validator rejects an unknown top-level key, the key moves under `metadata`. Checked at build, and the frontmatter check whitelists the keys each agent reads.
- Why: no duplicated text at the top of every skill, and the slash menu shows commands only.
- Revisit when: the standard adds an invocation field of its own.

**D50. Frontmatter carries no comments. Frontmatter rules live in docs-conventions, and the templates README until then.**
Extends D17. The removal rule covered `<!-- -->` comments only, so a skill following it literally would leave YAML `#` guidance in every project file.
- Why: placeholder text gets treated as real content by later agents, and the no-placeholders claim forbids it.
- Revisit when: never.

## Building, from T3 on

**D51. The plugin carries a small Claude Code manifest after all, kept in sync with the Agent Plugins one by the static check.**
Supersedes the "no Claude Code manifest" half of D45. Loading does not need `plugin/.claude-plugin/plugin.json`, but `claude plugin validate` refuses a plugin directory without one, and under `--strict` it wants `version`, `description` and `author` too. The file holds name, version, description, author, repository and license; `checks/check.py` fails when its name, version or description differ from `plugin/plugin.json`.
- Why: CI runs the strict validator, and a `version` lets Claude Code users pin a release once there is one.
- Revisit when: the validator accepts a plugin without a manifest.

**D52. Eval cases live under `plugin/evals/` and ship with the plugin. By-hand protocols and transcripts live under `checks/by-hand/`.**
Settles the trade-off left open in plan.md. `claude plugin eval` refuses an `--eval-dir` outside the plugin root, tested on 2.1.272: "must stay inside the plugin root (no ..)". Cases are plain prompt and grader files, so shipping them costs users nothing but a folder. The by-hand protocols for the block-driven claims are not eval cases and stay in the repo next to the checks.
- Why: the runner decides where cases go. The `plugin-folder` claim now names eval cases as part of what users receive.
- Revisit when: the runner accepts a cases directory outside the plugin.

**D53. The PR title is `type(scope): objective`, and the description fills the repo's own template when it has one, else spec-ship's with Links, Description, Unrelated changes, Release impact, Review and Outcome.**
Supersedes the title half of D7; the branch stays the link to the spec while work is open. Type is the kind, feature or fix, with `refactor` for a fix that changes no behavior. Scope is the ticket key from the spec's `issue:` line, else the slug. Objective is the spec's title. The ticket link joins the `issue-tracker` address in `index.md` to the key. Unrelated changes are the files the fresh review found outside plan.md. Release impact is proposed from the kind and the claims, MINOR for a feature, PATCH for a fix with claims, no release impact for a fix without, MAJOR when a claim is removed, and confirmed by the user in one question. Nothing is asked that the spec folder already holds.
- Why: this is the shape teams already use for pull requests, so a shipped spec lands in a review queue looking like every other PR, and the ticket key reaches the main branch history. A repo with its own template keeps it.
- Revisit when: a team needs commit message conventions from the pack as well; for now a company skill can add them.

**D54. A slot in template frontmatter is quoted, so every template is valid YAML before it is filled.**
Extends D17 and D50. GitHub renders a markdown file's frontmatter and shows "Error in user YAML" when `{{slot}}` opens a flow mapping. `key: "{{slot}}"` parses, and the filled value is valid with or without the quotes. The static check fails an unquoted slot.
- Why: a template that errors in the repo browser looks broken, and a parser-valid template is what a later checker needs anyway.
- Revisit when: never.

**D55. `index.md` carries a one-line Behavior section pointing at `behavior/`.**
Extends D44. The by-hand check on Codex showed the gap: with the Behavior column gone and the path rule living in a template comment that is removed on write, the written `index.md` pointed at nothing under `behavior/`, and an agent following the block's "load only what they link to" answered from the code without ever opening the behavior file. One real line fixes it without bringing back a per-row column that drifts.
- Why: the block only works if the first file it names leads to the claims.
- Revisit when: never.

**D56. The block tells agents to answer what the product does from `behavior/` and to open the code only to change it.**
Extends D24's block. The by-hand check on Claude Code found the block alone was not enough: the agent read the behavior file first, cited the claim, then opened the code to compare, three runs out of three. One bullet added to the block, and the next run answered from the docs and said so, with no code read. Codex had already done so after D55.
- Why: bet A is only worth something if a documented answer stops the agent from re-deriving it. The bullet states the rule the block implied.
- Revisit when: a release check shows agents still opening the code for documented behavior.

**D57. A fix for code that breaks a claim `behavior/` already states changes no claim. It writes "No behavior change.", names the claim it restores, and needs no new go.**
Extends D32. Found while testing spec-start on "partial refunds are one cent off" against a behavior file that already stated the half-up rule: the agent wrote no Change claim, since the documented behavior was right and the code was wrong. That is the model working as designed. The spec carries `restores: returns/submit-return#partial-refund`, spec-build's one task names that claim, and the failing test carries its reference. The owner approved the claim when it was written, so the fix needs no second go.
- Why: a Change with a `was:` line equal to the new text says nothing, and a go for restoring what the owner already approved is ceremony.
- Revisit when: a fix changes what a claim says as well; that is a Change, with a go.

**D58. spec-start writes `spec.md` and the `index.md` row only; `tasks.md` is written at planning. A required section not yet settled keeps its heading alone.**
Found in the Codex dogfood: the block's "every session adds its line to tasks.md" made spec-start create a `tasks.md` with a session line and two invented tasks, one of them "create the branch", and write "awaiting Sanne's answer" under Why before the first round. A spec-start session has nothing to resume, and a pending-answer sentence is "TBD" in more words. The rule is a red flag in spec-start and a line in the conventions; the block keeps its line, since every session on a planned spec does add one.
- Why: `tasks.md`'s job is where the work stands, and the work starts at the plan's OK.
- Revisit when: the block line causes it again on another agent; then the block says "once the spec has a tasks.md".

**D59. Tasks cover the build only, and a plan's Files lists code, test and config files only. The docs the flow itself writes, the block and the import included, are never in Files and never unrelated.**
Found in both dogfood runs: Codex's spec-plan added a fifth task "ship with spec-ship" and listed the behavior, architecture and spec files under Files; Claude Code's fresh reviewer counted `AGENTS.md` and `CLAUDE.md` from the docs-init commit as code outside the plan. A ship task would make spec-build ship on its last tick, and docs under Files or under Unrelated changes would make the review report the flow's own writes.
- Why: spec-build's "stay inside Files" and spec-ship's "unrelated changes" both read Files, so it holds only what the build touches.
- Revisit when: never.

**D60. spec-build stops when every task is ticked and names spec-ship as the next step; "continue" never ships.**
Found in the Claude Code dogfood: a fresh session told "continue" with all four tasks ticked went on to ship, by the book, tests, a fresh review, `behavior/`, `architecture/`, `status: shipped`, and ran out of turns in the PR text. Nothing in it was wrong except that nobody asked. Shipping asks two questions and offers a choice; it is a command the user runs, not the next turn of a loop.
- Why: a step with gates and questions is asked for by name, so the user is there to answer them.
- Revisit when: never.

**D61. A review done in the shipping session is never written up as fresh. Without a sub-agent, spec-ship stops before any docs change, hands over the review prompt and waits for the findings.**
Found in the Codex dogfood: `codex exec` has no sub-agent, so Codex reviewed its own diff and wrote "fresh independent review" into the PR. The fallback said to ask the user and the red flag said a self-review is not fresh; neither stopped it. Both now say stop and wait, and the PR names the separate session. The dogfood's review was rerun as a separate read-only session and pasted back.
- Why: the review's worth is a context that didn't write the code; a label can't give it that.
- Revisit when: every tested agent has sub-agents; then the fallback is never reached.
