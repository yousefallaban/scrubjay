---
max_turns: 15
allowed_tools: [Read, Glob, Grep, Skill, Write]
---

Record this decision in our docs, as docs/decisions/2026-10-12-wishlist-stored-server-side.md: wishlists are stored on the server, one list per signed-in customer. Context: customers switch between phone and laptop, and a list kept in one browser is lost on the other. We considered browser storage only, which needs no backend but doesn't follow the customer. Consequence: one new table to migrate and back up; guests are not covered yet.
