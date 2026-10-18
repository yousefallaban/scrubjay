Purpose: lasting choices made while building this spec, appended in order, never edited.

## D1 Polish is a second door in spec-build, not a smaller recheck
2026-10-18. D9 said to revisit when rechecks become noisy in practice; they did, seventeen times in one spec. A request that changes no claim and adds no file to the plan is polish: it reopens its task with a `redo:` line and writes nothing above the tasks. Change of course keeps its recheck. Rejected: shortening the recheck for every change, since a change to a claim still has to be checked against every task.

## D2 The recheck list is spoken, the recheck line is written with changed tasks only
2026-10-18. Step 9 said "mark each keep, redo, new or drop with a one-line reason" and the template showed `T2 redo, T4 new, T5 dropped`; the agent wrote all reasons into the line. The reasons are shown in the session for the OK; the line names only redo, new and dropped tasks.

## D3 A reference file is state; `reference/decisions.md` is the one append-only file
2026-10-18. D14 made reference/ working material with no shape; a verification file grew to nine runs. A new run, draft or measurement replaces the paragraph it supersedes. Decisions keep their append-only rule from the repository conventions, so the two rules are stated together.

## D4 Deferred changes live in `reference/follow-ups.md` and are settled at ship
2026-10-18. The repository has no backlog by decision, and a change the user defers mid-build had no home, so it was lost in a reference file. One line per deferred change in the spec's own reference folder; spec-ship asks about each in its outcome question, and the PR Outcome records kept for a spec or dropped. This is not a backlog: the file belongs to one spec and is empty of open items once that spec ships.

## D5 One spec for the five rules, version 0.2.0
2026-10-18. The five rules share one cause, mid-build requests, and mostly one skill, spec-build. One branch and one PR keep the eval reruns together. The parked docs-check branch also carries 0.2.0; whichever ships second moves to the next minor.

## D6 Three rule gaps the fresh review found, closed in the skill text
2026-10-18. The review compared the diff with the spec and found three places where the rules contradicted each other or left a case without a home. A file added after "Add it?" is a change to the plan's Files, so it goes through the recheck, with the yes as the OK and a line ending `No task changed.` when nothing moved. A task holds one `redo:` line, the newest, so a second polish replaces it instead of growing past the two-line cap. Any change the user defers goes to `reference/follow-ups.md`, not only one that grows the scope. The claims did not change; the ship-case graders now require the fixture's own follow-up names so the skill's template line cannot satisfy them.
