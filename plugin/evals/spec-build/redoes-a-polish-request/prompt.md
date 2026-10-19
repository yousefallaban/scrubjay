---
max_turns: 20
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit]
---

Small polish on T2, nothing else changes: store `addedAt` as an ISO string instead of a Date, and name the exported function `listSaved` instead of `list`. Same behavior, same claims. Update the spec folder for this, keep the data model sketch in reference/ current, and stop before touching src/ or test/; I run the tests myself. We are on branch add-wishlist, and this session cannot run commands.
