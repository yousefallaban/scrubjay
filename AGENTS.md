# AGENTS.md

Instructions for any coding agent working on this repo: Claude Code, Codex, Copilot, Cursor or another. CLAUDE.md only imports this file.

## What this repo is

scrubjay is a skill pack that gives coding agents a spec workflow and a project memory kept in `docs/`. The installable pack lives in `plugin/`; this repo's docs, checks and CI support its development.

## Start here

1. Read the current version from `plugin/plugin.json` and confirm that `plugin/.claude-plugin/plugin.json` agrees. The manifests are the version source; branch names and old specs are not.
2. Find the active spec in `docs/specs/` from the branch's purpose: `chore/public-repo-setup` maps to `docs/specs/<date>-public-repo-setup/`. Read its `tasks.md` first when it exists. The original first-release spec is history, not the default task for every session.
3. Read that spec's `spec.md` and `plan.md` when it has one. Don't change Why or What changes without the owner's (Yousef's) go. The `approved` line says whether the current requirements have it.
4. Read the relevant files in `docs/behavior/`, `docs/architecture/` and `docs/decisions/`. Load the active spec's `reference/` files as needed; where a decision disagrees with a design draft, the decision wins. Templates live in `plugin/skills/docs-conventions/assets/`.

## How to work

Use the pack's own spec workflow. If the skills are not installed in the agent, follow their steps from `plugin/skills/` by hand. This repo's branch and PR naming rules override the skills' generic defaults.

- **Branch:** use `<type>/<purpose>`, with one of the types below and a short lowercase kebab-case purpose. Use the purpose to match the spec slug; strip the type prefix when a skill looks up the active spec. Name the work, not an agent or a version. Create branches from the repository's default branch. On the default branch or without a matching spec, start a spec for the requested change.
- **Plan first:** plan a feature or a fix that needs several build steps. Write `plan.md` and `tasks.md` in the spec folder from the templates and wait for Yousef's OK before building a planned change. A small fix can use one task with a named check. How to build it is your call; the spec says what it must do.
- **Task by task:** each task fits one session and names the claim IDs, or the check, that prove it done. Tick it in `tasks.md` only when that proof holds. Keep notes under an open task to two lines.
- **Every session:** read `tasks.md` first, then continue from the next unticked task. A tick is a commit whose message is the task line; a ticked task carries nothing under it.
- **Skills test-first:** before writing a SKILL.md, run its scenario on `scrubjay-example` without the skill and keep that scenario as the skill's baseline case. Write the smallest skill that fixes it, then turn each loophole the agent finds into a rule or a red flag.
- **Skills instruct, they don't enforce:** a claim about what a command never touches or always does first is best-effort. The skill's behavior case covers it. Don't claim more.
- **Changing course:** update the file the change belongs to (`spec.md`, `plan.md` or `reference/`). A change to `spec.md` or to the plan's Scope rechecks every task (keep, redo, new or drop), rewrites the list in place and waits for an OK before building; nothing is written above the tasks. A change to Why or What changes removes the `approved` line and needs Yousef's go again. A polish that changes no claim and no Scope reopens its task with a `redo:` line and no recheck. Growth beyond the spec becomes a follow-up spec; a change Yousef defers becomes one line in the spec's `reference/follow-ups.md`.
- **Lasting choices:** record each one in the active spec's `reference/decisions.md` (append, never edit an existing entry) the moment it is made.
- **Shipping:** run `sh checks/run.sh`, have a fresh reviewer compare the diff with the active spec and plan, update the relevant behavior, architecture and decisions from what proved true, and set the spec's status to shipped inside the PR. Title the PR `<type>(<purpose>): <description>`, for example `docs(clarify-readme): Explain the first-use steps`. Never merge.

| Branch type | Use for | Example |
| --- | --- | --- |
| `feature` | Adding or changing product behavior | `feature/add-wishlist` |
| `fix` | Fixing a bug | `fix/refund-rounding` |
| `docs` | Documentation changes only | `docs/clarify-readme` |
| `chore` | Repository settings, tooling and maintenance | `chore/public-repo-setup` |
| `refactor` | Restructuring code without changing behavior | `refactor/split-validator` |

## Rules

- **Build only what the spec asks for.** Put new ideas to Yousef; agreed work gets its own spec. Do not create a separate roadmap or backlog document without a request.
- **Stay agent-neutral.** Nothing in the pack or its tests may require one particular agent, except adapter files such as manifests. A skill that uses a feature only some agents have states its fallback.
- **The product name goes only in the manifests and README files.** Skill names, templates and the `project-memory` markers carry no name.
- **Keep the plugin separate.** Users must not receive this repo's `docs/`, `checks/` or CI. The eval cases ship inside the pack under `plugin/evals/` (D52).
- **No client material, ever.** No code, names, docs or details from client projects. Examples use the fictional webshop (wishlist, returns).
- **Write for the public.** This repository is public under MIT.
- **Keep current docs current.** Update the relevant behavior and architecture at ship. Old specs and decisions record history; do not rewrite them to look like the latest version.
