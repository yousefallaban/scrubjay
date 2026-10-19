---
type: regex
target:
  source: file
  path: test/wishlist.test.ts
pattern: '^import \{ beforeEach, describe, expect, test \} from "bun:test";\nimport \{ _reset, list, save \} from "\.\.\/src\/wishlist";\ndescribe\("wishlist", \(\) => \{\n  beforeEach\(\(\) => _reset\(\)\);\n  test\("saves a product \[wishlist\/save-item#saves-item\]", \(\) => \{ save\("sanne", "rain-jacket"\); expect\(list\("sanne"\)\)\.toEqual\(\["rain-jacket"\]\); \}\);\n  test\("keeps one entry \[wishlist\/save-item#no-duplicates\]", \(\) => \{ save\("sanne", "rain-jacket"\); expect\(\(\) => save\("sanne", "rain-jacket"\)\)\.not\.toThrow\(\); \}\);\n  test\("lists in save order \[wishlist\/save-item#lists-saved\]", \(\) => \{ save\("sanne", "rain-jacket"\); save\("sanne", "trail-map"\); expect\(list\("sanne"\)\)\.toEqual\(\["rain-jacket", "trail-map"\]\); \}\);\n\}\);\n$'
---
