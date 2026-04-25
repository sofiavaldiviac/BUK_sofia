# Task: Plot 2.4 — HHI Distribution Across Occupation x Region Cells

| Field | Value |
|---|---|
| **Task ID** | `issue2_14` |
| **Title** | Plot HHI distribution across occupation x region cells |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_02` (HHI construction) |

## Motivation

This is the key market power measure. Showing meaningful variation in HHI across labor market cells justifies the empirical strategy of comparing outcomes across concentration levels. This plot is referenced throughout Sections 3 and 4.

## Specific goal

Produce a histogram or density plot of HHI values:
- X-axis: HHI (0 to 1, or 0 to 10,000 depending on scale convention)
- Y-axis: frequency or density (weighted by employment in each cell)
- Mark tercile cutoffs used in downstream analyses
- Report: number of cells, min, P25, median, P75, max
- Optionally overlay a reference line for "concentrated" threshold (e.g., HHI > 2,500)

## Success criteria

- [x] Distribution shows meaningful variation (not all concentrated or all competitive)
- [x] Tercile cutoffs clearly marked and documented
- [x] Summary statistics reported
- [x] Employment-weighted distribution (not just cell count)
- [x] Saved to `1_Code/figures/`

## Inputs / relevant files

- Output of `issue2_02` (HHI dataset by occupation x region cell)

## Branch used

`main`

## Compute environment used

Local (Python, pre-computed HHI parquets)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Added Plot 2.4 to `reducedform_admin.py` | 4 plots: weighted + unweighted histograms for both employment-based and vacancy-based HHI |
| 2026-04-24 | Generated plots | `rf_2_4_hhi_distribution_employment.png`, `rf_2_4_hhi_distribution_vacancy.png`, plus unweighted variants |

## Outcome

**4 HHI distribution plots produced (2 measures x 2 weightings).**

**Employment-based HHI (1,017 cells):**
- Weighted distribution heavily left-skewed — most employment in competitive cells (weighted mean = 565)
- Unweighted distribution shows meaningful variation across full 0–10,000 range
- Tercile cutoffs: Low/Medium at HHI 35, Medium/High at HHI 390
- Santiago dominates low-HHI mass; peripheral regions provide high-HHI variation

**Vacancy-based HHI (618 cells):**
- More spread across entire HHI range, weighted mean = 2,379
- Median cell at 5,612 — most vacancy markets are concentrated
- Many monopoly cells (28.5% have only 1 firm posting)

**Key takeaway for paper:** There IS meaningful variation in concentration to exploit — especially in the unweighted cell-level distribution. The weighted distribution is conservative (dominated by competitive Santiago), but the variation across cells supports the identification strategy.

Trust: medium — same caveats as HHI construction (BUK firms only, 8-area occupation taxonomy).

## Next recommended step

Proceed to `issue2_15` (Plot 2.5: HHI by region).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
