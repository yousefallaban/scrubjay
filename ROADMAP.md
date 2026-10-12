# Roadmap

Each step comes in only when real use shows it is needed.

## Before building

- **Sandbox:** a separate `scrubjay-example` repo, a small app tagged `baseline`, with one branch per experiment. Skills are written test-first against it, and the block-driven claims are checked by hand on it. It later becomes the public example and the eval fixtures.
- **Baseline:** run OpenSpec plus Matt Pocock's `grill-me` on one real task before any skill is written. Where they already work, build less. Where they break, v0.1 must fix it. The same run measures the tokens the docs layer keeps resident.
- **Order:** bet A (memory in `docs/`) is built and tested first, since no pack has solved it. Bet B (grilling) has prior art, so it comes second.
- **Dogfood:** build this pack with its own flow, by hand until the skills exist.

## Now: v0.1

Six commands, two practices, the templates, installable on Claude Code and Codex. See [the spec](docs/specs/2026-10-12-v0-1/spec.md).

## Before going public

- **Replay:** take ten merged PRs from a past project, run the flow from each original ticket, and compare. Did the spec capture what the real PR did, and did grilling surface what later caused rework?
- **Measure every spec** from the files the flow already writes: the `request:` line in `spec.md`, the session lines in `tasks.md`, and the outcome in each PR description. They give how often a new session needed re-explaining, what grilling changed before any code, and sessions per spec by kind.
- **Kill or rethink if** specs take longer than the change itself for small work, new sessions still need the same re-explaining, or `docs/behavior/` is wrong after a month.
- **Go public:** run a trademark check on the name, flip the repo to public, and add listings (skills.sh, and possibly Anthropic's plugin directory).

## Backlog: added when the signal shows up

| Signal from real use | Add | What it gives |
| --- | --- | --- |
| Bugs escape after ship | `verify.md`: evidence per claim; claim IDs required in test names | The owner sees what was proven |
| `docs/` drifts from the code | A checker in a git hook and a one-line CI job | Malformed or stale docs are blocked, and best-effort claims become enforced |
| Hand-written Add, Change and Remove lists go wrong or conflict | The checker computes them against main | The change list can't drift from the truth |
| The owner wants the why agreed before the what | A separate intent file and its own gate | No exact-behavior work before the why is settled |
| A second person approves work | Approval by merging a proposal PR | Nobody approves their own work |
| A refactor or chore needs its own steps | Refactor and chore as kinds, with their own approver | A path per kind instead of two |
| Many specs in flight at once | `docs-status` | Where each spec stands, stray files, duplicate slugs |
| Users arrive from Spec Kit, OpenSpec or Kiro | An archive option in docs-init, then a guided migration | Old specs move out of the way without being lost |
| The docs format changes | A migration offered by docs-init, keyed on `docs-format` | Existing docs move to the new templates on request |
| Skills misfire after a model change | Behavior evals in CI, rubric graders for grilling | Proof the skills still fire and behave |
| Contributors use other agents | Copilot, Cursor and Gemini CLI as tested targets; a neutral case format with one runner per agent, fixture projects, CHANGELOG and CONTRIBUTING | More agents with tested support |
| Several products share knowledge | A company docs repo template, and a docs-init option to link it from `index.md` | Shared facts written once |

## Company knowledge

Direction, not v0.1 work. Knowledge shared by every project sits one layer above `docs/`: company rules in a company skill pack, company facts in a company docs repo shaped like `docs/`, project memory in the project's `docs/`. Projects link to it and never copy it. Company policies always win; company defaults can be overridden only with a decision record. For a freelancer, a client's rules come from the client's pack or docs repo, and your own way of working is your personal pack.

## Private client copies

`canon` is made by one-way export: the public release with the manifests and README renamed, pushed into the client's own org. Nothing from client work ever flows back. The name-neutral rule in v0.1 keeps this a rename and not a fork.

## Stage 2: the check engine

Deterministic confirmation of behavior: replay, diff and coverage against the claims. This is for when trust needs proof, not review.

## Later

- Review routing and CODEOWNERS from domain owners.
- Production watch: claims checked against live behavior.
- Products that span several repos.
- A control plane: the multi-persona, AI-native SDLC platform this can grow into as a standalone SaaS product.
