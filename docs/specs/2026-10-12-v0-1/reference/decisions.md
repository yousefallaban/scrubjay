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
