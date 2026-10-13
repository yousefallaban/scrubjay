---
capability: repository/contributions
---
# Contribute to the repository

- Contributors can propose changes; merging requires a passing static check, and the normal merge path requires the owner's review {#reviewed-contributions}
  e.g. an outside pull request -> the owner reviews it and the `static` check passes; the administrator can deliberately bypass the review through a PR
- Outside contributors need maintainer approval before their fork workflows run, and those workflows receive no secrets or write token {#fork-approval}
  e.g. a fork pull request -> its workflow waits for approval
- The default branch rejects force pushes and deletion {#protected-history}
  e.g. a force push to master -> GitHub rejects it
