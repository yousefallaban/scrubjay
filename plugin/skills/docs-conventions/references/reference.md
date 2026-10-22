Purpose: rules for `specs/<id>/reference/*`. No template.

Free format. The first line says what the file is: `Purpose: ...`. Data model sketches, contract drafts, API examples, research, mockups: anything the spec needs while it is being planned and built.

A reference file describes the current state of its subject, not a log. A new run, draft or measurement replaces the paragraph it supersedes; git holds the history. What a run did not cover stays as one Limits section. `reference/decisions.md` is the exception: appended, never edited. `reference/follow-ups.md` holds the changes the user deferred while building, one line each as `- <the change>, raised while building T<n>`. The lines stay there as deferred work for later specs, and spec-ship asks nothing about them.

Never the why, the plan or progress; those live in spec.md, plan.md and tasks.md. A reference file is not edited at ship; the architecture files plan.md lists are updated from it, and the reference file stays as it was when the spec shipped.
