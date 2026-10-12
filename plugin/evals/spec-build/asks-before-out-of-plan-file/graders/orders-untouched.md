---
type: regex
target:
  source: file
  path: src/orders.ts
pattern: 'wishlist|saved'
match: not_contains
flags: i
---
