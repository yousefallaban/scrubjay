---
capability: practice/grilling
---
# Grill the intent

- Questions come in numbered rounds, every question answerable now, each with a recommended answer {#rounds}
  e.g. `3. Does saving the same product twice keep one entry? Recommended: yes.`
- Facts are looked up in the code and docs, never asked {#looks-up-facts}
  e.g. "which database?" -> answered from `architecture/stack.md`, not put to the user
- Each answer is written where its topic belongs the moment it settles: why and what to `spec.md`, how to `plan.md` or `reference/`, lasting choices to `decisions/`, new terms to `glossary.md` {#writes-as-it-settles}
  e.g. storing wishlists on the server is agreed -> `decisions/2026-10-12-wishlist-stored-server-side.md` exists before the round ends
