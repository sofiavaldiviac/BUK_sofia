# Task: Literature Slide

| Field | Value |
|---|---|
| **Task ID** | `issue3_07` |
| **Title** | Write the literature slide: two parallel literatures and the missing intersection |
| **Date opened** | 2026-04-26 |
| **GitHub Issue** | [#3 -- Field exam slides](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) |
| **Depends on** | `issue3_00` |

## Motivation

The literature slide needs to efficiently convey to a field exam committee that the paper sits at a genuine intersection that nobody has explored. This is a single slide that must do heavy lifting.

## Specific goal

Adapt the literature slide from `main.tex` (lines 352--369):
- Four items: monopsony x gender (but only wages), gender x career dynamics (but no market structure), the missing intersection, contribution
- Use `\bmark{}` for the "but only studied for wages" and "but no connection to market structure" punchlines
- Keep citations concise: Webber 2016, Sharma 2023, Caldwell & Danieli 2022, Benson et al. 2026, Bertrand & Mullainathan 2004
- Ensure the contribution bullet is sharp: "Connect monopsony to career dynamics at both margins, using application-level data to measure market power directly"

## Success criteria

- [x] One frame with four items clearly separating the three literatures and the gap
- [x] `\bmark{}` highlights on the key gaps
- [x] Fits at `\small` (11pt was too tight for three lit sections + contribution)
- [x] Compiles without errors

## Inputs / relevant files

- `2_Writeup/slides/main.tex` -- lines 352--369
- `2_Writeup/paper/short_proposal/short_proposal.tex` -- Introduction paragraphs on related literature

## Branch used

_TBD_

## Compute environment used

Local (LaTeX)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-26 | Wrote literature slide following short_proposal structure | Three lit sections (imperfect competition, outside options + gender, career dynamics) instead of two from main.tex. Each ends with `\bmark{}` gap. Added Morchio & Moser 2024, Sokolova & Sorensen 2021. |
| 2026-04-26 | Compiled | 14 pages, no errors. |

## Outcome

Literature slide inserted into Section E. Uses the three-paragraph structure from the short proposal, which is stronger than the two-section version in main.tex. Deck now has 14 slides.

## Next recommended step

Proceed to `issue3_08` (model slides).

**Important:** After completing this task, post a comment on [Issue #3](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) summarizing what was done.
