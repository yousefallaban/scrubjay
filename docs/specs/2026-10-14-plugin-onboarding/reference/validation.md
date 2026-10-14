Purpose: evidence for the plugin metadata, setup declaration and weekly action-update configuration.

# Metadata and update configuration validation

Baseline: the subtitle was 50 characters; longDescription, websiteURL, supportURL, defaultPrompt, onboardingSkill and Dependabot version-update configuration were absent.

Client metadata baseline: the portable manifest lacked author, homepage and keywords; Claude's manifest lacked a profile URL, homepage, keywords and directory icon/documentation/support fields.

After the change, package checks confirmed a 24-character subtitle, a description below 4000 characters, three distinct prompts below 128 characters each, HTTPS project/support links, and setup/icon paths that resolve inside the plugin. onboardingSkill is alongside interface, not nested inside it. Both manifests remain 0.1.2.

Ruby's YAML parser loaded the Dependabot configuration and checks confirmed version 2, ecosystem github-actions, directory / and interval weekly. sh checks/run.sh passed static checks and both strict Claude Code validators; git diff --check passed.

Extended checks confirmed matching name, version, description, author, homepage, repository, license and keywords across both manifests. Claude's icon resolves to the same existing packaged SVG as both Codex icon fields. Claude Code 2.1.296 passed strict plugin and marketplace validation. Copilot is not installed locally; its portable fields were checked against GitHub's documented closed Agent Plugins 1.0 schema. No Copilot-specific icon field is documented.

Installed Codex setup and icon rendering were not exercised. The local Codex plugin CLI has no validation subcommand. Dependabot's first update PR can only be observed after the configuration reaches the default branch; automatic merging remains disabled.

Claude's icon is directory metadata; the CLI ignores it. Warning-free strict validation of those directory fields requires Claude Code 2.1.281 or later. Existing Claude caches do not receive same-version metadata changes automatically while both manifests remain 0.1.2.

Field locations and limits: [OpenAI plugin submission](https://developers.openai.com/plugins/deploy/submission). Setup declaration: [OpenAI plugin packaging](https://developers.openai.com/plugins/build/plugins). Update schedule: [GitHub Dependabot configuration](https://docs.github.com/en/code-security/how-tos/secure-your-supply-chain/secure-your-dependencies/auto-update-actions).

Claude's supported metadata and directory fields: [Claude manifest reference](https://code.claude.com/docs/en/plugins-reference). Portable metadata and supported root fields: [Copilot plugin reference](https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-plugin-reference), [Agent Plugins 1.0 schema](https://agent-plugins.org/schemas/1.0.0/plugin.schema.json).
