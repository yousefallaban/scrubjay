# scrubjay

A spec workflow and project memory for coding agents, kept in your repo's `docs/`.

Scrub-jays hide food and remember what they hid, where and when. This pack gives coding agents the same kind of memory: what was decided, where it lives, and when it changed. It lives in your repo, so every new session starts from it instead of from scratch.

## The two bets

1. Agents keep project knowledge across sessions when it lives in `docs/` in the repo.
2. Agents build the right thing when the intent is grilled before any code.

v0.1 exists to test both on real work.

## Install

The pack needs `git` on your machine and nothing else. `gh` is optional and only used to open pull requests.

**Claude Code**

```
/plugin marketplace add yousefallaban/scrubjay
/plugin install scrubjay@yousefallaban
```

The commands appear as `/scrubjay:docs-init`, `/scrubjay:spec-start` and so on.

**Codex**

```
codex plugin marketplace add yousefallaban/scrubjay
codex plugin add scrubjay@yousefallaban
```

The commands appear as `$scrubjay:docs-init`, `$scrubjay:spec-start` and so on. Older Codex versions without `codex plugin add` install from the Plugins directory in the TUI or the desktop app after the marketplace is added.

**Any other agent that supports [Agent Skills](https://agentskills.io)**: copy `skills/` from this folder into the agent's skills directory. Updates are re-copied by hand.

**From a private copy**

Both agents use the git credentials already on your machine and never prompt. On GitHub, run `gh auth login` and then `gh auth setup-git` once, or load an SSH key in `ssh-agent`. A `GITHUB_TOKEN` variable alone is not enough; it has to go through a credential helper. To install a branch rather than the default, append `#<branch>` in Claude Code and `--ref <branch>` in Codex.

Catches: in Claude Code, auto-update is off per marketplace until you turn it on under Marketplaces in `/plugin`; without it, `/plugin marketplace update yousefallaban` fetches changes. Claude Code reads a `CLAUDE.md` anywhere above your repo in place of `AGENTS.md`, which is why docs-init writes a one-line `CLAUDE.md` import.

## The commands

| Command | Use it to |
| --- | --- |
| `docs-init` | add project memory to a repo: `docs/index.md`, `docs/architecture/stack.md`, the project-memory block in `AGENTS.md`, the `CLAUDE.md` import |
| `docs-map` | document one domain of an existing app from its code, the first time work touches it; the owner confirms before anything is written |
| `spec-start` | start a spec from a sentence, a ticket or commits; settles why and what by grilling, records the owner's go |
| `spec-plan` | decide how and break the work into tasks that fit one session each; waits for your OK |
| `spec-build` | build task by task, a failing test first when behavior changes; resumes from `tasks.md`; handles a change of course |
| `spec-ship` | run the tests, have a fresh reviewer compare the diff with the spec, update `docs/behavior/` and `docs/architecture/`, prepare the pull request |

Two practices load on their own: `grilling`, the question rounds, and `docs-conventions`, the file charter, the templates and the claim format.

## Quickstart, about five minutes

On an existing repo:

1. `docs-init`. Answer four things: what the product is, the first domain and its owner, your issue tracker if you have one, and whether the detected test command is right. It writes `docs/index.md`, `docs/architecture/stack.md`, the block in `AGENTS.md`, and the `CLAUDE.md` import.
2. Open a new session and ask "where does project memory live?". It answers with `docs/index.md`. That is bet one working.
3. `spec-start <one sentence about what you want>`. A feature is grilled in rounds, each question with a recommended answer; a fix is written in one pass. When the domain has no behavior docs yet, it offers `docs-map` first.
4. Say go. For a feature, `spec-plan`, then OK the plan. Then `spec-build`, one task per session if you like; a new session picks up from `tasks.md` without re-explaining.
5. `spec-ship`. Tests, a fresh review, the docs updated from the spec's claims, and a pull request title and description ready to paste.

## What it writes into your repo

```
AGENTS.md                              the managed block between markers; everything else is yours
CLAUDE.md                              @AGENTS.md, so Claude Code reads the block too
docs/
  index.md                             what the product is, its domains and owners
  glossary.md                          shared words, when the first one settles
  behavior/<domain>/<capability>.md    what the product does now, as claims with IDs
  architecture/<area>.md               how it is built now, one area per file
  decisions/<date>-<slug>.md           why a lasting choice was made
  specs/<date>-<slug>/                 one folder per change: spec.md, plan.md, tasks.md, reference/
```

Every file has one job. A claim is one testable sentence with an ID and an example, and tests carry the claim's reference in their name, so anyone can find the test behind a claim.

## Testing a change to the pack

Static checks: `sh checks/run.sh` from the repo root, no agent needed; CI runs the same on every pull request. Eval cases: `claude plugin eval . --scaffold --allow-tools Write Edit --trust-plugin` from this folder, see `evals/README.md`. Before a release, every case passes on Claude Code and each command is run once by hand on Codex.

## Credits and license

The mechanics we learned from other packs are in [CREDITS.md](CREDITS.md). MIT, see [LICENSE](LICENSE).
