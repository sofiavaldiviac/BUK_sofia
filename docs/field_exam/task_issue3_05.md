# Task: Sample Selection Slides

| Field | Value |
|---|---|
| **Task ID** | `issue3_05` |
| **Title** | Write the sample selection slides: BUK vs SII comparison table and coverage heatmap |
| **Date opened** | 2026-04-26 |
| **GitHub Issue** | [#3 -- Field exam slides](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) |
| **Depends on** | `issue3_00` |

## Motivation

A field exam committee will ask about external validity. These slides preempt the question by showing how BUK compares to the SII universe on firm size and sector, and where coverage is strong vs weak. This is new content not in the existing `main.tex` slides but present in the short proposal.

## Specific goal

Create two new slides:
1. **BUK vs SII comparison** (adapt from short proposal Table 2, lines 109--123):
   - Table: firm size rows (Micro/Small, Medium, Large), columns for BUK % firms, SII % firms, BUK % workers, SII % workers
   - Bullets: large firms over-represented (advantage for internal labor markets), micro/small under-represented, public admin absent
   - Note: over-representation of large firms is a feature for studying structured promotion ladders
2. **Coverage heatmap** (from `4_Code/images/heatmap_coverage.png`):
   - Include the heatmap figure showing BUK/SII coverage rate by ISIC sector x firm size
   - Brief bullets: which sectors/sizes are well-covered, which are not
   - Figure path from field_exam/: verify the correct relative path to `4_Code/images/heatmap_coverage.png`

## Success criteria

- [x] Two frames: comparison table + coverage heatmap
- [x] Table numbers match short proposal Table 2
- [x] Heatmap figure renders at readable size
- [x] Bullets address external validity concern head-on
- [x] Compiles without errors

## Inputs / relevant files

- `2_Writeup/paper/short_proposal/short_proposal.tex` -- Table 2, lines 107--127
- `2_Writeup/paper/main.tex` -- Section 3.5 (Sample selection), lines 231--292
- `4_Code/images/heatmap_coverage.png`

## Branch used

_TBD_

## Compute environment used

Local (LaTeX)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-26 | Inserted BUK vs SII comparison slide | Table from short proposal; 3 bullets on firm size advantage, gender (37.2% vs ~42% in formal employment), and sector gaps. |
| 2026-04-26 | Inserted coverage heatmap slide | Side-by-side layout (columns) with figure + bullets. Path: `../../../../4_Code/images/heatmap_coverage.png`. |
| 2026-04-26 | Compiled | 11 pages, no errors. |

## Outcome

Two sample selection slides inserted into Section C. Gender under-representation bullet included (BUK 37.2% F vs ~42% formal employment). Deck now has 11 slides.

## Next recommended step

Proceed to `issue3_06` (research directions slides).

**Important:** After completing this task, post a comment on [Issue #3](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) summarizing what was done.
