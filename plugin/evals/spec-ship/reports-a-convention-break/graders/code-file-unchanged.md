---
type: regex
target:
  source: file
  path: src/wishlist.ts
pattern: '^const lists = new Map<string, string\[\]>\(\);\nexport function save\(customerId: string, productId: string\): void \{\n  if \(!productId\) throw new Error\("A product id is required"\);\n  const list = lists\.get\(customerId\) \?\? \[\];\n  if \(!list\.includes\(productId\)\) list\.push\(productId\);\n  lists\.set\(customerId, list\);\n\}\nexport function list\(customerId: string\): string\[\] \{ return \[\.\.\.\(lists\.get\(customerId\) \?\? \[\]\)\]; \}\nexport function _reset\(\): void \{ lists\.clear\(\); \}\n$'
---
