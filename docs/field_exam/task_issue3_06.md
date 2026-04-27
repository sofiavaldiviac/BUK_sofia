# Task: Research Directions Slides

| Field | Value |
|---|---|
| **Task ID** | `issue3_06` |
| **Title** | Write the research directions slides: three questions, then highlight monopsony |
| **Date opened** | 2026-04-26 |
| **GitHub Issue** | [#3 -- Field exam slides](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) |
| **Depends on** | `issue3_00` |

## Motivation

These two slides show the audience that the dataset supports multiple research agendas, then narrow to the specific question (monopsony and career dynamics) that the rest of the talk develops. The "fade out" technique on the second slide is already implemented in `main.tex`.

## Specific goal

Adapt the two research directions slides from `main.tex` (lines 288--345):
1. **Full menu** (lines 288--316): three numbered items (broken rung, monopsony + career dynamics, mandate response) plus "and many more"
2. **Highlighted version** (lines 321--345): same structure but items 1, 3, and 4 are `\textcolor{faded}{}`, item 2 stays bold navy

Ensure the content of each research question is accurate and up to date with the short proposal framing.

## Success criteria

- [x] Two frames: full menu, then highlighted version
- [x] Five research directions clearly stated with sub-bullets (expanded from original 3)
- [x] Fading effect works correctly on the second slide
- [x] Compiles without errors

## Inputs / relevant files

- `2_Writeup/slides/main.tex` -- lines 288--345

## Branch used

_TBD_

## Compute environment used

Local (LaTeX)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-26 | Expanded from 3 to 5 research questions | Added: (2) bonuses vs promotions as retention tools (uses adm_assign), (3) 40-hour workweek and Art. 22 flexible schedule workers (uses workday_type), (5) wage growth over the life cycle. Kept: (1) monopsony + career dynamics, (4) broken rung. Dropped: mandate response (subsumed by the more specific 40-hr question). |
| 2026-04-26 | Inserted two slides into Section D | Full menu + highlighted version with fade effect. Used `\small` to fit 5 items. |
| 2026-04-26 | Compiled | 13 pages, no errors. |

## Outcome

Two research directions slides inserted with 5 questions. Monopsony highlighted on slide 2. Deck now has 13 slides.

## Next recommended step

Proceed to `issue3_07` (literature slide).

**Important:** After completing this task, post a comment on [Issue #3](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) summarizing what was done.
