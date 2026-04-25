# Task: Plot 2.5 — HHI by Region

| Field | Value |
|---|---|
| **Task ID** | `issue2_15` |
| **Title** | Plot HHI by region (map or bar chart) |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_02` (HHI construction) |

## Motivation

Geographic variation in market concentration is intuitive for readers: remote regions should have fewer employers and higher HHI. This validates the measure and connects to Chile's geographic structure (Santiago metro vs. mining regions vs. rural south).

## Specific goal

Produce a map or bar chart of average HHI by Chilean region:
- Aggregate HHI values (employment-weighted mean) per administrative region
- Option A: choropleth map of Chile with regions colored by HHI
- Option B: horizontal bar chart with regions sorted by HHI
- Highlight Santiago metro vs. non-metro contrast
- Report N cells and N workers per region

## Success criteria

- [x] All Chilean regions represented (16 of 16)
- [x] Clear geographic pattern visible (Santiago least concentrated, periphery most)
- [x] Employment-weighted aggregation
- [x] Saved to `1_Code/figures/`

## Inputs / relevant files

- Output of `issue2_02` (HHI dataset by occupation x region cell)
- Chilean region shapefiles (if using map option)

## Branch used

`main`

## Compute environment used

Local (Python, pre-computed HHI parquets)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Added Plot 2.5 to `reducedform_admin.py` | Horizontal bar chart, both HHI measures, Santiago highlighted in red |
| 2026-04-24 | Generated plots | `rf_2_5_hhi_by_region_employment.png`, `rf_2_5_hhi_by_region_vacancy.png` |

## Outcome

**2 horizontal bar charts showing employment-weighted mean HHI by Chilean region.**

All 16 regions represented. Clear geographic gradient:

**Employment-based:** Santiago Metropolitana (HHI=121, 1.9M workers) is most competitive. Secondary cities moderate (Los Lagos 443, Biobío 610). Remote regions highly concentrated (Aysén 5,719, Ñuble 3,828, Tarapacá 3,561).

**Vacancy-based:** Same pattern shifted upward. Santiago 1,098. Most peripheral regions above 6,000. Aysén and Arica y Parinacota at 10,000 (monopoly).

Validates the HHI measure: geographic pattern matches priors about Chilean labor market structure.

Trust: medium — same caveats as HHI construction.

## Next recommended step

Proceed to `issue2_16` (Plot 3.1: hire conversion rate). This begins Section 3.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
