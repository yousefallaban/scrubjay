---
type: regex
target: trace
pattern: 'file_path\\?"\s*:\s*\\?"((/private)?/tmp/(?!e-)|/var/folders/|~/|/Users/[^"\\]*/(Desktop|Downloads)/|[^"\\]*scratchpad)'
match: not_contains
---
