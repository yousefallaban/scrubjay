# scrubjay

A spec workflow and project memory for coding agents.

> **Status: pre-release.** v0.1 is being built from [`docs/specs/2026-10-12-v0-1/`](docs/specs/2026-10-12-v0-1/spec.md). The installable pack lives in [`plugin/`](plugin/README.md), which holds the install steps per agent, the commands and the quickstart.

Scrub-jays hide food and remember what they hid, where and when. scrubjay gives coding agents the same kind of memory: what was decided, where it lives, and when it changed. It lives in your repo's `docs/`, so every new session starts from it instead of from scratch.

## The two bets

1. Agents keep project knowledge across sessions when it lives in `docs/` in the repo.
2. Agents build the right thing when the intent is grilled before any code.

v0.1 exists to test both on real work.

## What v0.1 will be

| Command | Use it to |
| --- | --- |
| `docs-init` | add the docs layer and the project-memory block to a repo |
| `docs-map` | document one domain of an existing app the first time work touches it |
| `spec-start` | settle why and what through a grilling interview |
| `spec-plan` | decide how, and break the work into small tasks |
| `spec-build` | build task by task, with a failing test first when behavior changes |
| `spec-ship` | check the work, update the docs, prepare the pull request |

There are also two practices the agent loads itself: `grilling` and `docs-conventions`.

- It works with any agent that supports [Agent Skills](https://agentskills.io/), is tested on Claude Code and Codex, and installs as a plugin on GitHub Copilot CLI too.
- It needs git. `gh` is optional. There is no MCP server, runtime, npm package or telemetry.

## In this repo

| Path | What it is |
| --- | --- |
| `AGENTS.md` | instructions for any agent building the pack |
| `ROADMAP.md` | what comes after v0.1 |
| `plugin/` | the pack users install: skills, templates, manifests, eval cases |
| `checks/` | the static checks CI runs, and the by-hand protocols with their transcripts |
| `docs/specs/` | the specs this pack is built from, in its own format |

## Developing the pack

Any coding agent can build it: the instructions are in `AGENTS.md`. Run `sh checks/run.sh` before a pull request; CI runs the same. Eval cases run with `claude plugin eval plugin --scaffold --allow-tools Write Edit --trust-plugin`, see [`plugin/evals/README.md`](plugin/evals/README.md).

## License

[MIT](LICENSE)
