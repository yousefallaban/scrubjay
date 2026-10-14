Purpose: lasting choices for the requested plugin metadata and workflow update configuration.

**D1. Keep OpenAI presentation in the portable manifest.**
Add listing text, links and starter prompts to extensions.com.openai.interface; put onboardingSkill alongside interface.
- Why: these are the documented fields and preserve one source of OpenAI-specific settings.

**D2. Reuse the existing setup skill and artwork.**
Point onboardingSkill at ./skills/docs-init/SKILL.md. Do not rewrite the skill or create another icon.
- Why: the existing skill already initializes project memory, and the owner supplied the artwork.

**D3. Schedule reviewed action updates weekly.**
Use the github-actions ecosystem at directory / in .github/dependabot.yml. Do not enable auto-merge.
- Why: pinned actions need an update process, while repository rules keep updates reviewable.

**D4. Retain the owner's requested version.**
Keep both manifests at 0.1.2 for this metadata completion; skill instructions are unchanged. A later released skill change still follows the normal version-bump rule.
- Why: the owner explicitly requested 0.1.2 earlier in this session.

**D5. Publish metadata through each supported client's documented format.**
Keep author, homepage and keywords equal in the portable and Claude manifests. Put Claude's directory icon, documentationUrl and supportUrl only in its manifest, using the existing packaged icon. Do not invent a Copilot icon field or claim directory fields control Claude's CLI display.
- Why: the owner extended the request to Claude Code and other agent clients; their supported fields differ.
