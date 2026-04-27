# Task: Scaffold the Field Exam Slide Deck

| Field | Value |
|---|---|
| **Task ID** | `issue3_00` |
| **Title** | Create field_exam.tex with preamble, theme, title slide, and section placeholders |
| **Date opened** | 2026-04-26 |
| **GitHub Issue** | [#3 -- Field exam slides](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) |
| **Depends on** | None |

## Motivation

All subsequent slide tasks need a .tex file to write into. Setting up the preamble, color definitions, and section structure once avoids duplication and ensures a consistent theme across the deck.

## Specific goal

Create `2_Writeup/slides/field_exam/field_exam.tex` with:
1. Documentclass `beamer` with `[aspectratio=169, 11pt]`
2. Full preamble copied from `2_Writeup/slides/main.tex` (lines 7--52): theme, colors, fonts, packages, `\bmark` command, frametitle rule template
3. Title block: "Market Power and the Gender Career Gap / Evidence from Matched HR Records in Chile / Sofia Valdivia / Duke University / Field Exam, [date]"
4. Title slide (plain frame, matching existing navy/white style)
5. Section comment placeholders for each section (A through H plus Appendix), with `% === SECTION X: Name ===` markers
6. `\end{document}` at the bottom
7. Verify the file compiles with only the title slide

## Success criteria

- [x] File created at `2_Writeup/slides/field_exam/field_exam.tex`
- [x] Preamble matches existing theme exactly (colors, fonts, packages, frametitle rule)
- [x] Title slide renders correctly
- [x] Section placeholders present for all 8 sections plus appendix
- [x] Compiles without errors

## Inputs / relevant files

- `2_Writeup/slides/main.tex` -- lines 1--79 (preamble + title slide)

## Branch used

_TBD_

## Compute environment used

Local (LaTeX)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-26 | Created `field_exam.tex` | Preamble, colors, fonts, frametitle rule, title slide, 8 section placeholders + appendix. Added `\graphicspath` for figure convenience. |
| 2026-04-26 | Compiled successfully | 1 page, no errors. |

## Outcome

File created and compiles. All section tasks (issue3_01--issue3_10) are now unblocked.

## Next recommended step

After completing this task, all section tasks (issue3_01 through issue3_10) are unblocked.

**Important:** After completing this task, post a comment on [Issue #3](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) summarizing what was done.
