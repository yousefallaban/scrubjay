---
id: 2026-10-12-d24-the-product-name-appears-only-in-the
status: accepted
spec: 2026-10-12-v0-1
date: 2026-10-12
---
# The product name appears only in the manifests and README files. Skill names, templates and the markers are name-neutral (<!-- project-memory:start --> / <!-- project-memory:end -->)

## Context


## Options
- The alternative named in Context, where one existed: it lost for the reason under Why

## Decision
The product name appears only in the manifests and README files. Skill names, templates and the markers are name-neutral (<!-- project-memory:start --> / <!-- project-memory:end -->).

## Consequences
Why: a client copy differs from the public pack only in those files, so a project set up with one works with the other, and switching never leaves stale markers.
Revisit when: never. This is what keeps client copies cheap.
Changed in part by D56.
