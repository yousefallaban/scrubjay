---
type: regex
target: trace
pattern: '## Review[\s\S]{0,1500}?(ShopError|errors\.ts|(bare|plain|generic|native|built-in|raw) `?Error)[\s\S]{0,300}?(save|wishlist)|## Review[\s\S]{0,1500}?(save|wishlist)[\s\S]{0,300}?(ShopError|errors\.ts|(bare|plain|generic|native|built-in|raw) `?Error)'
flags: i
---
