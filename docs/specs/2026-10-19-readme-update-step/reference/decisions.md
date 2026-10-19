Purpose: lasting choices made while fixing readme-update-step, appended as they are made, never edited.

## D1 From master at 0.2.0, with no version bump
2026-10-19. Pull request 6 merged while this fix was being started, so the branch is cut from master, which is at 0.2.0. The fix has no claims, which spec-ship's scheme calls "No release impact", and the sentence reaches its readers on GitHub, not through the updater that the version exists for; so the version stays 0.2.0 and the next change with release impact bumps it. The root README is unchanged: it sends the reader to the pack README for how updates arrive.

## D2 Why a README edit is not a released change
2026-10-19. The fresh review read D1 against the conventions line that every released change to `plugin/` raises the version, and asked for the reason or a bump. The version exists so the updater delivers changed skill text to installed copies; a README sentence changes nothing an agent loads, and four earlier README-only commits to `plugin/` shipped without a bump. So a change under `plugin/` that touches only its README has no release impact and keeps the version, and the conventions line is read as changes to what the pack installs.
