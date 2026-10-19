---
type: regex
target: trace
pattern: '## Review[\s\S]{0,1500}(no-duplicates|keeps one entry)[\s\S]{0,300}(weak|does ?n.t prove|not prove|only (asserts|checks)|proves nothing|lacks|fails to prove|does ?n.t exercise|not exercise|insufficient)|## Review[\s\S]{0,1500}(weak|does ?n.t prove|not prove|only (asserts|checks)|proves nothing|lacks|fails to prove)[\s\S]{0,300}(no-duplicates|keeps one entry)'
flags: i
---
