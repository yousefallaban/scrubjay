---
type: regex
target: trace
pattern: 'Sessions?: ?\d|\d+ sessions|re-explain'
flags: i
match: not_contains
---
