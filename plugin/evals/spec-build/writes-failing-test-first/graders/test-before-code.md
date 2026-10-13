---
type: tool_order
before:
  tool: Write
  input_match: 'test/wishlist'
after:
  tool: Write
  input_match: 'src/wishlist\.ts"[\s\S]*export function save'
---
