---
type: regex
target: trace
pattern: 'new_string\\?"\s*:\s*\\?"[^"]{0,80}status: shipped[\s\S]*(feature\(add-wishlist\): Add wishlist|(create|open)[^\n]{0,160}?(show|paste)[^\n]{0,100}?\?)'
flags: i
---
