---
type: regex
target:
  source: file
  path: test/wishlist.test.ts
pattern: '(test|it)\(\s*["''`][^"''`\n]*(keyFor|prefix|key for|helper)[^"''`\n]*\[wishlist/|(test|it)\(\s*["''`][^"''`\n]*\[wishlist/[^"''`\n]*(keyFor|prefix|key for|helper)'
match: not_contains
flags: i
---
