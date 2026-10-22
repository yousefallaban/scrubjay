---
max_turns: 40
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit, Agent]
---

spec-ship the wishlist spec. I ran `bun test` a minute ago: 17 pass, 0 fail. For the fresh review, use a sub-agent if you have one; otherwise say so. If the review finds anything optional, my answer is go on to the pull request. We are on branch add-wishlist. This session cannot run commands, so say what you would run instead. If the review removes anything, I run the suite right after and I confirm in advance that it is green.
