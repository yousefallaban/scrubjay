---
id: 2026-10-19-the-code-is-read-on-doubt-and-a-mismatch-is-named
status: accepted
spec: 2026-10-19-claim-evidence
date: 2026-10-19
---
# The block's answer rule has two exceptions: a question about the code or a doubt is answered from the code, and a mismatch is stated with its fix spec

## Context
The block told a session to answer what the product does from `behavior/` and to open the code only to change it. That is the lookup rule answers-from-docs proves, and it holds when the docs are accurate. On 2026-10-19 both agents, asked about a refund of 5.69 where the claim promised 5.70, answered from the claim alone and did not open the code; Claude Code said it had not opened the code because "the project memory rules say to answer from the behavior docs". A change made outside the flow, or a bug the claim never knew about, produced a confident wrong answer with no path to a fix.

## Options
- Compare the code on every documented question: lost, since it spends the lookup savings the docs exist for.
- Leave the rule and rely on fix specs to surface mismatches: lost, because nothing told the session to look for one.
- Two exceptions in the block: a question about what the code does now, or a doubt about a claim, is answered from the code with the claim quoted beside it, and a disagreement is stated as documented versus observed with the fix spec named or offered: won.

## Decision
The block keeps answers-from-docs as the default and adds the two exceptions, so a doubt reads the code and a mismatch names the claim, the code's behavior and a fix spec.

## Consequences
A mismatch report gets both sides and a next step instead of a confident restatement of the docs. Sessions read code more often when users voice doubt, which costs tokens only on those questions. The behavior file still holds the claim as written; a mismatch lives in the fix spec that restores it, never as a status line in `behavior/`. Watch for sessions treating every question as doubt; the by-hand check keeps answers-from-docs as a pass condition beside these two.
