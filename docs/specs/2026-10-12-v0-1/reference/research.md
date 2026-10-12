Purpose: what we found about standards, other packs, installing per agent, testing patterns and the name, as of October 2026. Check the facts marked "verify" before relying on them, since these tools change fast.

## Standards

| Standard | What it is | Our use |
| --- | --- | --- |
| [Agent Skills](https://agentskills.io/) | `SKILL.md` folders with `name` and `description` frontmatter. An open standard started by Anthropic and supported by Claude Code, Codex, Copilot and VS Code, Cursor, Gemini CLI, Kiro and many others | The format of every skill |
| [Agent Plugins](https://agent-plugins.org/) | Cross-agent packaging with a `plugin.json` manifest. Only `$schema` and `name` are required, and `mcp.json` is optional ([manifest](https://agent-plugins.org/plugin-authors/manifest)) | The neutral manifest |
| Claude Code plugins | `.claude-plugin/plugin.json`, plus `marketplace.json` so a repo can be its own marketplace ([marketplaces](https://code.claude.com/docs/en/plugin-marketplaces), [hosting](https://code.claude.com/docs/en/plugins/host-marketplace)). Claude Code isn't on the Agent Plugins [client list](https://agent-plugins.org/compatible-clients) | The Claude Code adapter |
| [AGENTS.md](https://agents.md/) | Project instructions for agents. The nearest file to the edited file wins, and an explicit chat message overrides it. Claude Code reads CLAUDE.md, which can import AGENTS.md | Where the project-memory block lives; this repo's own instructions |

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
| Claude Code | `/plugin marketplace add yousefallaban/scrubjay`, then `/plugin install scrubjay@yousefallaban`. Skills appear as `/scrubjay:<skill>` | Uses the git credentials already on the machine, without prompting ([hosting](https://code.claude.com/docs/en/plugins/host-marketplace)) | Run `gh auth login && gh auth setup-git` once, or load an SSH key in `ssh-agent`. A `GITHUB_TOKEN` variable alone isn't enough; it must go through a credential helper. Auto-update is off per marketplace until turned on |
| Codex CLI | Install from the git URL. Skills are invoked as `$<skill>` | A full HTTPS or SSH git URL covers private repos ([article](https://codex.danielvaughan.com/2026/05/08/codex-cli-plugin-marketplace-remote-install-workspace-sharing-bundled-hooks/)) | How credentials are supplied isn't documented; expect the normal git setup. Verify the exact command against the [Codex docs](https://developers.openai.com/codex/skills) |
| Copilot CLI / VS Code | `copilot plugin marketplace add <owner/repo>` ([guide](https://awesome-copilot.github.com/learning-hub/installing-and-using-plugins/)) | Marketplaces can come from internal repos | Auth for private repos isn't documented there |
| Cursor | Team marketplaces from repos | Supported, with a known auth bug: the loader disables git credential helpers, mainly on Windows ([forum](https://forum.cursor.com/t/private-repo-marketplace-plugin-install-fails-authentication/162084)) | Workarounds: a `_netrc` file with a GitHub token, or a dedicated SSH key |
| Any other agent | Copy the skills folder into the agent's skills directory | Same, after cloning | No updates; the user re-copies |

## Testing patterns

| Pattern | Source | In v0.1 |
| --- | --- | --- |
| Test-first skills: watch the agent fail without the skill (with pressure such as time, sunk cost or authority), record its excuses, write the smallest skill that fixes them, then turn each new excuse into a rule or red flag | Superpowers | Yes |
| At least 3 trigger cases, 2 non-trigger cases and 1 behavior case per skill, with frontmatter checked in CI | Addy Osmani | Yes |
| `claude plugin eval`: realistic prompts with graders (regex, tool called, or a model-judged rubric), compared against a run without the plugin, and able to gate CI. `claude plugin eval init` drafts cases ([docs](https://code.claude.com/docs/en/plugin-evals)) | Anthropic | As the Claude Code runner only, since it runs in Claude Code alone |
| Codex non-interactive mode | OpenAI | As the Codex runner |
| Rubric graders or human-reviewed dialogue for conversational skills such as grilling | Addy Osmani | Deferred |
| Behavior evals in CI, a fixtures framework, release gates | Several | Deferred until contributors arrive |

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
