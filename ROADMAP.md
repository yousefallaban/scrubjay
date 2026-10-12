# Roadmap

Each step comes in only when real use shows it is needed.

## Now: v0.1

Six commands, two practices, the templates, installable on Claude Code and Codex. See [the spec](docs/specs/2026-10-12-v0-1/spec.md).

## Before going public

- **Baseline:** run OpenSpec plus Matt Pocock's `grill-me` on one real task. Where they already work, build less. Where they break, v0.1 must fix it.
- **Replay:** take ten merged PRs from a past project, run the flow from each original ticket, and compare. Did the spec capture what the real PR did, and did grilling surface what later caused rework?
- **Dogfood:** build this pack with its own flow.
- **Measure every spec:** how often a new session needed re-explaining, how many wrong turns planning caught before any code, and minutes per spec by kind.
- **Kill or rethink if** specs take longer than the change itself for small work, new sessions still need the same re-explaining, or `docs/behavior/` is wrong after a month.
- **Sandbox:** a separate `scrubjay-example` repo, a small app tagged `baseline`, with one branch per experiment. It later becomes the public example and the eval fixtures.
- **Go public:** run a trademark check on the name, flip the repo to public, and add listings (skills.sh, and possibly Anthropic's plugin directory).

## Backlog: added when the signal shows up

| Signal from real use | Add | What it gives |
| --- | --- | --- |
| Bugs escape after ship | `verify.md`: evidence per claim; claim IDs required in test names | The owner sees what was proven |
| `docs/` drifts from the code | A checker in a git hook and a one-line CI job | Malformed or stale docs are blocked |
| Hand-written Add, Change and Remove lists go wrong or conflict | The checker computes them against main | The change list can't drift from the truth |
| The owner wants the why agreed before the what | A separate intent file and its own gate | No exact-behavior work before the why is settled |
| A second person approves work | Approval by merging a proposal PR | Nobody approves their own work |
| Many specs in flight at once | `docs-status` | Where each spec stands, stray files, duplicate slugs |
| Skills misfire after a model change | Behavior evals in CI, rubric graders for grilling | Proof the skills still fire and behave |
| Several products share knowledge | A company docs repo template, and a docs-init option to link it | Shared facts written once |
| Contributors use other agents | Copilot, Cursor and Gemini CLI as tested targets | More agents with tested support |

## Private client copies

`canon` is made by one-way export: the public release with the manifests and README renamed, pushed into the client's own org. Nothing from client work ever flows back. The name-neutral rule in v0.1 keeps this a rename and not a fork.

## Stage 2: the check engine

Deterministic confirmation of behavior: replay, diff and coverage against the claims. This is for when trust needs proof, not review.

## Later

- Review routing and CODEOWNERS from domain owners.
- Production watch: claims checked against live behavior.
- Products that span several repos.
- A control plane: the multi-persona, AI-native SDLC platform this can grow into as a standalone SaaS product.
