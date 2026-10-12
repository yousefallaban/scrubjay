Purpose: how every SKILL.md in the pack is shaped, so the eight skills read the same way and load the same way in Claude Code and Codex.

Frontmatter: `name`, equal to the folder name in kebab-case, and `description`, one or two sentences saying what the skill does and when to use it. The description is all an agent sees before it loads the skill, so it carries the trigger. Practices add `user-invocable: false`; if an agent's validator rejects the key, it moves under `metadata` (D49).

Body, in this order (D49):
1. Process. Numbered steps, each naming the file it reads or writes. The first step of a command loads docs-conventions.
2. Verification. How the skill knows it is done, as observable checks.
3. Red flags and rationalizations. Only in spec-start, spec-build, spec-ship and grilling (D41), as a short table: the excuse, then the rule.
4. Fallbacks. For any feature not every agent has, such as sub-agents or a question tool, what to do without it.

Size: under the standard's recommended 5000 tokens of instructions, most under 150 lines. Detail goes in references/ next to the skill, one level deep, referenced by a relative path.

Templates: a command never names a template path. It loads docs-conventions and writes from the template for that file (D46).

Name: the product name never appears in a SKILL.md, a reference or a template.
