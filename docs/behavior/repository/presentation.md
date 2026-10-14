---
capability: repository/presentation
---
# Present the repository and plugin

- People can read and install the public repository without being invited {#public-repository}
  e.g. an unauthenticated visitor -> the repository is readable
- Shared GitHub links use the owner's existing preview image {#social-preview}
  e.g. the repository link is shared -> the blue bird image appears
- Codex loads the bird artwork from the plugin's own assets, and both manifests retain version 0.1.2 {#plugin-artwork}
  e.g. the plugin is loaded -> its interface has a logo and composer icon
- The plugin metadata provides a concise subtitle, a detailed description, and project and support links {#plugin-listing}
  e.g. a listing consumer reads the package -> the subtitle fits 30 characters and the description explains the workflow and its limits
- The plugin metadata provides three starter prompts for setup, planning and resuming work {#plugin-starters}
  e.g. a user needs an entry point -> the package includes a prompt for each of those tasks
- The Codex package declares the existing docs-init skill as its setup entry point {#plugin-onboarding}
  e.g. a host resolves onboardingSkill -> it points to the packaged docs-init/SKILL.md
