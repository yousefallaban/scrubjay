---
max_turns: 15
allowed_tools: [Read, Glob, Grep, Skill, Write]
---

Write the plan for the wishlist spec in docs/specs/2026-10-12-add-wishlist. Approach: one wishlist table keyed by customer and product with a unique pair, a small module in src/wishlist.ts with save, remove and list, and a Save button on the product page. Scope: src/wishlist.ts new, src/components/SaveButton.tsx new, db/migrations/0042_wishlist.sql new. The data model goes to architecture at ship. There are no rollout concerns and no risks worth noting.
