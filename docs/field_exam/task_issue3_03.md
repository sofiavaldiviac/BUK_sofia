# Task: BUK Data Overview Slide

| Field | Value |
|---|---|
| **Task ID** | `issue3_03` |
| **Title** | Write the BUK data overview slide with pipeline diagram and key numbers |
| **Date opened** | 2026-04-26 |
| **GitHub Issue** | [#3 -- Field exam slides](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) |
| **Depends on** | `issue3_00` |

## Motivation

The pipeline diagram is one of the most effective slides in the existing deck. It conveys the data's uniqueness (hiring through separation) in a single visual. This slide must work for an audience unfamiliar with HR platform data.

## Specific goal

Adapt the BUK pipeline slide from `main.tex` (lines 136--176):
- Keep the tikz pipeline diagram (Hiring -> Contracts -> Payroll -> Promotions -> Separations) with sublabels
- Keep the three bullet points: worker-month panel, recruitment numbers, complementary survey
- Add `[label=bukslide]` for hyperlinks from appendix
- Ensure the survey `\beamergotobutton` links to the appendix survey slide

## Success criteria

- [x] One frame with tikz pipeline diagram rendering correctly
- [x] Three key bullets: panel structure, recruitment scale, survey complement
- [x] Hyperlink to survey appendix slide works
- [x] Compiles without errors
- [x] Bonus: added second slide with reform timeline figure (`rf_6_4_reform_timeline.png`)

## Inputs / relevant files

- `2_Writeup/slides/main.tex` -- lines 136--176

## Branch used

_TBD_

## Compute environment used

Local (LaTeX)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-26 | Inserted pipeline slide into Section B | Adapted from main.tex; updated sublabels with short_proposal detail (vacancies, supervisor, role changes). Added 4.7M/8.3M numbers to panel bullet. |
| 2026-04-26 | Added reform timeline slide | Included `rf_6_4_reform_timeline.png` at 0.60 width with three bullets on panel growth, reform timing, and Art. 203 RD. |
| 2026-04-26 | Fixed `\graphicspath` | Was `../../../../` (4 levels), corrected to `../../../` (3 levels). |
| 2026-04-26 | Compiled | 5 pages, no errors. |

## Outcome

Two slides inserted: pipeline diagram + reform timeline. Also fixed `\graphicspath` for all future figure includes. Deck now has 5 slides.

## Next recommended step

Proceed to `issue3_04` (summary statistics slides).

**Important:** After completing this task, post a comment on [Issue #3](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) summarizing what was done.
