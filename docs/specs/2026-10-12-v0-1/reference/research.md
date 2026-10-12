Purpose: what we found about standards, other packs, installing per agent, testing patterns and the name, as of October 2026. Rows marked "verified 2026-10-12" were checked against the official docs on that date. Rows marked "verify" were not, since these tools change fast.

## Standards

| Standard | What it is | Our use |
| --- | --- | --- |
| [Agent Skills](https://agentskills.io/) | `SKILL.md` folders with `name` and `description` frontmatter. An open standard started by Anthropic. Its client list names Claude Code, Codex, Copilot and VS Code, Cursor, Gemini CLI and Kiro, among many others (verified 2026-10-12) | The format of every skill |
| [Agent Plugins](https://agent-plugins.org/) | Cross-agent packaging with a root `plugin.json`. Only `$schema` and `name` are required ([manifest](https://agent-plugins.org/plugin-authors/manifest), verified 2026-10-12). Codex's own plugin docs use this manifest. Whether Claude Code is on the [client list](https://agent-plugins.org/compatible-clients) is unverified; the page needs a browser to render | The plugin manifest for both tested agents |
| Claude Code plugins | `.claude-plugin/marketplace.json` lets a repo be its own marketplace, with a relative `source` path into a plugin subfolder ([create](https://code.claude.com/docs/en/plugin-marketplaces), [host](https://code.claude.com/docs/en/plugins/host-marketplace), verified 2026-10-12). The plugin manifest at `.claude-plugin/plugin.json` is optional: without it the plugin name comes from the marketplace entry and `skills/` loads from the standard layout. A root `plugin.json` is not read. The validator warns on unknown entry fields, so `--strict` fails on a file that carries Codex's fields ([manifest](https://code.claude.com/docs/en/plugins/manifest-reference), verified 2026-10-12) | The Claude Code marketplace file; no Claude Code manifest |
| [AGENTS.md](https://agents.md/) | Project instructions for agents. The nearest file to the edited file wins, and an explicit chat message overrides it. Claude Code 2.1.277 and later reads AGENTS.md when no CLAUDE.md exists in the folder or above it; with a CLAUDE.md present it reads only CLAUDE.md unless that file imports AGENTS.md. Not on Bedrock, Vertex or Foundry ([memory](https://code.claude.com/docs/en/memory), verified 2026-10-12) | Where the project-memory block lives; this repo's own instructions |

Per-agent skill docs: [Claude Code](https://code.claude.com/docs/en/skills), [Codex](https://developers.openai.com/codex/skills), [VS Code Copilot](https://code.visualstudio.com/docs/copilot/customization/agent-skills), [GitHub Copilot](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills), [Cursor](https://cursor.com/docs/context/skills), [Gemini CLI](https://geminicli.com/docs/cli/skills/), [Kiro](https://kiro.dev/docs/skills/).

## Packs and tools studied

| Source | What we learned | Taken into |
| --- | --- | --- |
| [Matt Pocock's skills](https://github.com/mattpocock/skills) | `grill-me`: question rounds with a recommended answer each. The split between commands (typed by a person) and practices (loaded by the agent) | `grilling`; the command/practice split |
| [Addy Osmani's agent-skills](https://github.com/addyosmani/agent-skills) | Skill anatomy: process, rationalizations, red flags, verification. Small tasks with acceptance criteria. A minimum number of cases per skill, enforced in CI ([CONTRIBUTING](https://github.com/addyosmani/agent-skills/blob/main/CONTRIBUTING.md)). Its [comparison](https://github.com/addyosmani/agent-skills/blob/main/docs/comparison.md) concludes that none of the three big packs solves durable memory across sessions, and warns against two packs acting as routers | Skill sections; the case minimum; one router |
| [Superpowers](https://github.com/obra/superpowers) | Project instructions outrank skills ([using-superpowers](https://smithery.ai/skills/obra/using-superpowers)). Skills written test-first: RED, GREEN, REFACTOR ([testing skills with subagents](https://skillselion.com/skills/obra/superpowers-skills/testing-skills-with-subagents)) | The AGENTS.md block outranking optional skills; test-first skills |
| [OpenSpec](https://openspec.dev/docs/core-concepts) | A truth folder that each change updates when it ships | `behavior/` updated by spec-ship |
| Spec Kit, [Kiro](https://kiro.dev/docs/specs/best-practices/) | Spec, then plan, then tasks; a folder per feature | The spec folder |
| [AI-SDLC](https://ai-sdlc.io) | A lifecycle framing for AI-native development | Background only |

Matt Pocock publishes no testing method for his skills that we could find.

## Installing per agent

| Agent | Public repo | Private repo | Catch |
| --- | --- | --- | --- |
| Claude Code (verified 2026-10-12) | `/plugin marketplace add yousefallaban/scrubjay`, then `/plugin install scrubjay@yousefallaban`. The marketplace name comes from the `name` field in `marketplace.json`. Skills appear as `/scrubjay:<skill>`. The plugin source is copied into the user's cache | Claude Code runs `git` with prompts off and uses whatever credentials the machine holds; it has no token of its own ([host](https://code.claude.com/docs/en/plugins/host-marketplace)) | Run `gh auth login && gh auth setup-git` once, or load an SSH key in `ssh-agent`. A `GITHUB_TOKEN` variable alone isn't enough; it must go through a credential helper. Auto-update is off per marketplace until a user turns it on. Evals need Claude Code 2.1.269 or later |
| Codex (verified 2026-10-12) | `codex plugin marketplace add yousefallaban/scrubjay`. Codex reads `.agents/plugins/marketplace.json` and accepts `.claude-plugin/marketplace.json` as a legacy path; every entry must carry `policy.installation`, `policy.authentication` and `category`, which Claude Code's validator flags, so each agent gets its own file. A plugin in a subfolder uses a `git-subdir` source, and the plugin's manifest is a root `plugin.json` in the Agent Plugins format. Codex 0.154 installs from the command line, `codex plugin marketplace add owner/repo --ref <branch>` then `codex plugin add plugin@marketplace`, verified 2026-10-13 against a private repo; the docs still describe the TUI and desktop route ([build plugins](https://developers.openai.com/codex/plugins/build.md)). Skills are invoked as `$<skill>` and live under `.agents/skills` | HTTPS and SSH URLs are accepted as marketplace sources. How credentials are supplied isn't documented; expect the normal git setup | Skills inside an installed plugin are named `$<plugin>:<skill>`, so `$scrubjay:spec-start` (verified 2026-10-13). `codex exec` reads stdin when it isn't a terminal, so scripted runs need `< /dev/null` (found 2026-10-12) |
| Copilot CLI / VS Code (not checked, not a tested target) | `copilot plugin marketplace add <owner/repo>` ([guide](https://awesome-copilot.github.com/learning-hub/installing-and-using-plugins/)) | Marketplaces can come from internal repos | Auth for private repos isn't documented there |
| Cursor (not checked, not a tested target) | Team marketplaces from repos | Supported, with a known auth bug: the loader disables git credential helpers, mainly on Windows ([forum](https://forum.cursor.com/t/private-repo-marketplace-plugin-install-fails-authentication/162084)) | Workarounds: a `_netrc` file with a GitHub token, or a dedicated SSH key |
| Any other agent | Copy the skills folder into the agent's skills directory | Same, after cloning | No updates; the user re-copies |

## Testing patterns

| Pattern | Source | In v0.1 |
| --- | --- | --- |
| Test-first skills: watch the agent fail without the skill (with pressure such as time, sunk cost or authority), record its excuses, write the smallest skill that fixes them, then turn each new excuse into a rule or red flag | Superpowers | Yes, as a practice in AGENTS.md, not as a claim |
| At least 3 trigger cases, 2 non-trigger cases and 1 behavior case per skill, with frontmatter checked in CI | Addy Osmani | Yes, stored as plain prompt and criteria files |
| `claude plugin eval`: realistic prompts with graders (regex, tool called, or a model-judged rubric), compared against a run without the plugin, and able to gate CI. `claude plugin eval init` drafts cases. Runs are isolated: no CLAUDE.md, `.claude/` or other project instructions load, each run starts in an empty directory, and a case that needs files or git state names a `scaffold_script` run with `--scaffold` ([docs](https://code.claude.com/docs/en/plugin-evals), verified 2026-10-12) | Anthropic | The Claude Code runner for command cases. Needs Claude Code 2.1.269 or later. The block-driven claims are checked by hand instead |
| Codex non-interactive mode, `codex exec` ([docs](https://developers.openai.com/codex/noninteractive), verified 2026-10-12) | OpenAI | Not used as a runner, since Codex plugin installs are UI-only. Codex is checked by hand before release |
| Rubric graders or human-reviewed dialogue for conversational skills such as grilling | Addy Osmani | Deferred |
| A neutral case format with one runner per agent, fixture projects, behavior evals in CI, release gates | Several | Deferred until contributors arrive |

## Existing spec tools: where they keep files

| Tool | Folders docs-init looks for | Most useful on touch |
| --- | --- | --- |
| Spec Kit | `.specify/`, `specs/` | The constitution, as input for `conventions` and `invariants` |
| OpenSpec | `openspec/` | `openspec/specs/`, which is already a truth folder |
| Kiro | `.kiro/specs/` | Requirements per feature |

## Name

- **`scrubjay`:** scrub-jays cache food and remember what they hid, where and when. They are the classic example of episodic memory in animals. We found no dev or AI-agent tool using the name, and it was free on npm when checked. Before going public, run a trademark check on [EUIPO TMview](https://www.tmdn.org/tmview/).
- **`canon`:** collides publicly with two Claude Code plugins in the same niche ([canonhq](https://pypi.org/project/canonhq/), [erclx/canon](https://github.com/erclx/canon)). That doesn't matter for private client copies.
- **Rejected:** `ledger` (the placeholder), `lore`, `groundtruth`, `stele`, `vellum`, `waggle` (taken on npm), plus `corvid`, `collie`, `nutcracker`, `matriarch` and `tusker`, which were taken or too generic. `honeyguide` and `bowerbird` were runners-up.
- Claude Code prefixes skills with the plugin name (`/scrubjay:spec-start`). The marketplace name only appears at install (`scrubjay@yousefallaban`).
