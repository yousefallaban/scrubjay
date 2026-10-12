# AGENTS.md

Instructions for any coding agent working on this repo: Claude Code, Codex, Copilot, Cursor or another. CLAUDE.md only imports this file.

## What this repo is

scrubjay is a skill pack that gives coding agents a spec workflow and a project memory kept in `docs/`. It is pre-release: the pack doesn't exist yet, and you are building v0.1.

## Start here

1. Read `docs/specs/2026-10-12-v0-1/spec.md`. These are the requirements. Don't change Why or What changes without the owner's (Yousef's) go. The `approved` line in its frontmatter says whether the current text has it.
2. Read `reference/decisions.md`, which lists every decision with its reason. Where it disagrees with `design.md`, decisions.md wins.
3. Read `reference/design.md` for the full design, and `reference/research.md` for the standards, install facts and sources.
4. `reference/templates/` holds the agreed templates. They become the pack's templates.

## How to work

Use the pack's own flow by hand, since the skills don't exist yet.

- **Branch:** work on `v0-1`, the spec's slug.
- **Plan first:** write `plan.md` and `tasks.md` in the spec folder from the templates. Show them to Yousef and wait for an OK before writing any pack files. How to build it is your call; the spec says only what it must do.
- **Order:** the first task is the baseline run in `ROADMAP.md`. Then the docs layer, the AGENTS.md block and resume, which test bet A. Grilling and the rest come after.
- **Task by task:** each task fits one session and names the claim IDs, or the check, that prove it done. Tick it in `tasks.md` only when that proof holds. Keep notes under a task to two lines.
- **Every session:** read `tasks.md` first, add the session line, then continue from the next unticked task.
- **Skills test-first:** before writing a SKILL.md, run its scenario on `scrubjay-example` without the skill and keep that scenario as the skill's baseline case. Write the smallest skill that fixes it, then turn each loophole the agent finds into a rule or a red flag.
- **Skills instruct, they don't enforce:** a claim about what a command never touches or always does first is best-effort. The skill's behavior case covers it. Don't claim more.
- **Changing course:** update the file the change belongs to (`spec.md`, `plan.md` or `reference/`), recheck every task (keep, redo, new or drop), and wait for an OK. A change to `spec.md` removes the `approved` line and needs Yousef's go again. Scope growth becomes a follow-up spec.
- **Lasting choices:** record each one in `reference/decisions.md` (append, never edit an existing entry) the moment it is made.
- **Shipping:** run the checks, have a fresh reviewer compare the diff with `spec.md`, create `docs/behavior/`, `docs/architecture/` and `docs/decisions/` from what proved true, set the status to shipped, and prepare a PR whose title starts with `v0-1`. Never merge.

## Rules

- **Build only what the spec asks for.** Put new ideas to Yousef, or under the backlog in `ROADMAP.md` once he agrees.
- **Stay agent-neutral.** Nothing in the pack or its tests may require one particular agent, except adapter files such as manifests. A skill that uses a feature only some agents have states its fallback.
- **The product name goes only in the manifests and README files.** Skill names, templates and the `project-memory` markers carry no name.
- **Keep the plugin separate.** Users must not receive this repo's `docs/`, tests or CI.
- **No client material, ever.** No code, names, docs or details from client projects. Examples use the fictional webshop (wishlist, returns).
- **Write for the public.** The repo is private until v0.1 works, then goes public under MIT.
- **Don't map this repo up front.** `docs/behavior/` and `docs/architecture/` are created at ship, not before.
