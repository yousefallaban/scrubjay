Purpose: what the baseline run of OpenSpec and grill-me on "add a wishlist" in scrubjay-example found, so v0.1 builds less where they already work and fixes what they break. Run on 2026-10-12 on a throwaway branch, since deleted. OpenSpec 1.14.1, grill-me from mattpocock/skills as installed at user level.

## How it was run

OpenSpec: `openspec init --tools claude,codex` on a branch from tag `baseline`, then its propose flow driven by hand as the agent, following `openspec-propose/SKILL.md` and the CLI's `instructions --json` for each artifact, then `openspec validate --strict`, then `openspec archive --yes`. grill-me: read in full and compared with what our grilling practice must do; not run with an owner, since its 25 lines leave nothing to discover by running and the replay in ROADMAP is where grilling gets measured.

## Findings per command

**openspec init**
- Writes its skills into the project: 18 files, 292k characters, under `.claude/commands/opsx/`, `.claude/skills/` and `.agents/skills/`. The pack lives in every repo, not once per user. Updating means `openspec update` in each repo.
- Writes no AGENTS.md and no CLAUDE.md. Nothing tells an unprompted session that `openspec/specs/` exists. Memory works only when a user runs an opsx command or the agent auto-selects one. This is the gap bet A targets, and it confirms the AGENTS.md block is the piece no studied pack has.
- Creates `openspec/config.yaml` with optional project context and per-artifact rules, both as free text for the agent. A thinner cousin of our file charter, with no file for what the product is or who owns what.

**opsx:propose**
- One command produces proposal, delta spec, design and tasks, with the CLI handing the agent a template, rules and an instruction per artifact. The schema is code: `openspec status --json` computes which artifact is ready and which is blocked.
- Clarification is one rule: ask only on "material ambiguity", otherwise assume and record. No rounds, no recommended answer, no end condition. On this task, "who saves" is material in a codebase with no accounts, and the flow would have asked one open question. Our grilling asks in rounds with a recommended answer and stops when only owner questions remain. Keep as specified.
- It inspects the code before drafting, which matches looks-up-facts.
- design.md is conditional and was skipped here, which matches our fix path with no plan.md. Keep.
- The delta spec format, ADDED, MODIFIED with full text, REMOVED with reason and migration, is our Add, Change with was, Remove with reason. Same idea, four headers against three words. Keep ours.
- Requirements use SHALL and scenarios use WHEN/THEN with a strict four-hash rule the validator enforces. Ours is one sentence with an ID and an e.g. line. Theirs is more machine-checkable, ours is readable by an owner. Keep ours, and note that a later checker can parse the claim line.
- Resident tokens before any code is read: the propose skill, about 4,100 tokens, plus four instruction payloads, about 5,300, plus config, about 300. Roughly 9,700 tokens to produce 640 tokens of artifacts. Every OpenSpec skill repeats the same store-selection and project-check boilerplate, about 1,000 tokens each. D46's budget, charter plus claim format in one small practice and per-file rules loaded on demand, is the right call.

**openspec validate --strict**
- Checks structure only: headers, scenario hashes, description length, purpose length. Passed on artifacts that describe a feature no code implements. Nothing links a requirement to a test.

**openspec archive**
- Archived the change and merged the delta into `openspec/specs/wishlist/spec.md` with zero tasks ticked and no code written. The truth folder now states behavior the system does not have. There is no gate on tests, tasks or an owner's go. This is the drift failure in one command, and it is why ships-with-go and runs-tests exist.
- The merge itself is code, deterministic, "+ 4 added". Ours is an instruction to copy claims verbatim, best-effort, with the checker in the backlog. Theirs is stronger on this one step; ours is gated on the steps before it.

**grill-me**
- 392 tokens. One question at a time, highest value first, with why it matters, a recommended answer and what changes if the answer differs. Explore the codebase instead of asking. A fixed topic order from goal to operations. A synthesis at the end.
- It writes nothing. Decisions, terms and scope live in the chat and are gone with the session. Our writes-as-it-settles is the missing half.
- No end condition other than "major branches resolved or the user asks to stop", and no notion of which questions only the owner can answer. Our grills claim adds both.
- The recommended-answer mechanic is the thing to learn, in our words, as D2 says.

## What this means for the spec

No claim is cut. OpenSpec covers artifact generation and a truth folder, and grill-me covers the question mechanic, but neither covers what the bets test: an entry point every session reads, resume from tasks.md, a go recorded before planning and before ship, truth updated only after tests pass, terms and decisions written as they settle, and a claim ID that reaches a test name. Two of our decisions are confirmed by the run: the ship gate, and the small resident footprint.

One thing to carry into building: OpenSpec's sync and validate are code, and they are the two places it is stronger than instruction. Our checker in the backlog is the same move, and the claim format must stay parseable so it stays cheap.
