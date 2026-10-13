---
id: 2026-10-13-codex-spawns-a-fresh-reviewer-the-shell-fallback-stays-stated
status: accepted
spec: 2026-10-13-sessions
date: 2026-10-13
---
# Codex 0.162 spawns a fresh reviewer, so the shell-started review session stays a stated fallback and is not claimed

## Context
The Codex dogfood on 0.154 had no sub-agent, so Codex reviewed its own diff and the fix, D61, was to stop and hand the user the review prompt. The sessions spec set out to replace that stop with a session the agent starts itself from the shell, `codex exec --sandbox read-only "<prompt>"`. Checked by hand on Codex 0.162.1, the ship spawned a reviewer with a fresh context on its own, `spawn_agent` with `fork_turns: none`, took its findings and updated the docs; the multi-agent feature is on by default and an override did not turn it off. A nested Codex session is blocked inside the sandbox, with or without network, and answers only outside it.

## Options
- Claim the shell-started session and prove it by hand: lost, no tested agent reaches the path, Claude Code and Codex 0.162 both spawn a fresh reviewer.
- Drop the fallback text and keep D61's stop: lost, a session the agent can start is better than a stop for any agent that has a shell and no sub-agents.
- State the fallback in spec-ship without a claim, the way AGENTS.md asks for agent-specific features, and record what Codex does now: won.

## Decision
spec-ship's no-sub-agent fallback names a separate read-only session started from the shell before the stop-and-hand-over, with the Codex command and its need for escalated permissions, and the spec claims nothing for it.

## Consequences
Why: a claim without a run that proves it is a sentence, and the pack does not claim more than its cases cover.
Revisit when: a tested agent without sub-agents arrives; then the fallback gets a by-hand check and a claim, or goes.
