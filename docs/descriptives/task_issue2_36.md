# Task: Plot 6.4 — Timeline of Reforms Overlaid on BUK Panel Coverage

| Field | Value |
|---|---|
| **Task ID** | `issue2_36` |
| **Title** | Plot timeline of labor reforms overlaid on BUK data panel coverage |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

The paper leverages three overlapping Chilean labor reforms (Ley 21.561, Ley 21.645, Art. 203) as institutional variation. A timeline showing when each reform took effect, overlaid on the BUK panel coverage window (2022-2026), helps readers understand which reforms can be studied in the data.

## Specific goal

Produce a timeline figure:
- X-axis: calendar time (2020-2026)
- Horizontal bar or shaded region: BUK panel coverage (2022-2026)
- Vertical lines or markers for each reform:
  - Ley 21.561 (40-hour workweek): implementation date
  - Ley 21.645 (work-life balance / parental leave): implementation date
  - Art. 203 (childcare mandate): implementation date
- Brief label for each reform
- Optionally show BUK firm/worker count growth over time as a background area chart

## Success criteria

- [ ] All three reforms correctly dated and labeled
- [ ] BUK panel window clearly marked
- [ ] Visual is clean and readable
- [ ] Saved to `1_Code/figures/` (matches existing plot output convention)

## Inputs / relevant files

- Reform dates from `2_Writeup/paper/main.tex` Setting section (some are PLACEHOLDER)
- BUK panel coverage dates from data documentation
- `2_Writeup/slides/main.tex` — slide 3 (Chile context)

## Branch used

_TBD_

## Compute environment used

Local (R or Python, or even LaTeX/TikZ)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Created `reducedform_context.R` | New script for context plots (organized by data source). Houses plot 6.4. |
| 2026-04-23 | Generated `rf_6_4_reform_timeline.png` | Timeline with Ley 21.561 phase-in (44h/42h/40h), Ley 21.645 effective date, BUK firm growth background, Art. 203 in caption. |

## Outcome

Plot produced and saved to `1_Code/figures/rf_6_4_reform_timeline.png`. Shows four reform event lines (Ley 21.645 Jan 2024, Ley 21.561 phases Apr 2024/2026/2028) overlaid on BUK firm growth area chart with panel window shading. Art. 203 noted in caption as in effect throughout. Trust: high — dates confirmed by user. Next action: iterate on visual polish if needed, then proceed to remaining Section 6 tasks.

## Next recommended step

This is the final task in Issue #2. After all tasks are complete, proceed to `issue1_05` (Reduced Form Evidence write-up) which references these plots.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
