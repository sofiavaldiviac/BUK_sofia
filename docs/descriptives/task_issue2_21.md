# Task: Plot 4.1 — Promotion Rate by Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_21` |
| **Title** | Plot annual promotion rate by gender |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_03` (promotion events) |

## Motivation

The promotion rate is the direct empirical counterpart to the model's promotion threshold (theta). A lower promotion rate for women is the baseline fact the model explains through the retention trade-off mechanism.

## Specific goal

Produce a bar chart of annual promotion rate by gender:
- Use promotion events from `issue2_03` output
- Promotion rate = promotions / person-years at risk, by gender
- Bar chart: male vs. female promotion rate
- Report: N promotions, N person-years, promotion rate by gender
- Can also show time series (annual promotion rate by gender over 2022-2026)
- Filter to Chile

## Success criteria

- [x] Promotion rate correctly computed (events / person-years at risk)
- [x] Clear gender gap visible (small: F 2.10% vs M 2.04%)
- [x] Sample sizes reported
- [x] Chile filter applied
- [x] Saved to `1_Code/figures/`

## Inputs / relevant files

- Output of `issue2_03` (promotion event dataset)

## Branch used

`main`

## Compute environment used

Local (Python, pre-computed promotions parquet + cached CSVs)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Added Plot 4.1 to `reducedform_admin.py` | Bar chart + time series. Person-years from year-end snapshots (2018–2025). |
| 2026-04-24 | Generated plots | `rf_4_1_promotion_rate_by_gender.png`, `rf_4_1_promotion_rate_timeseries.png` |

## Outcome

**2 plots: overall bar chart + annual time series.**

**Overall (2018–2025):**
- Female: 2.10% (31,081 / 1,476,600 person-years)
- Male: 2.04% (42,360 / 2,077,673 person-years)
- Gender gap is small (0.06pp) and women are *slightly above* men

**Time series pattern:**
- Near-zero in 2018–2019 (data ramp-up / BUK platform adoption)
- Rises steadily from 2020 (0.5%) to 2025 (3.1–3.2%)
- Women consistently slightly above men from 2020–2023
- Converge by 2024–2025

**Interpretation:** The raw unconditional promotion rate shows no disadvantage for women — if anything, women are promoted slightly more often. But this is the *unconditional* rate. The monopsony prediction is about the *conditional* gap (controlling for occupation, tenure, market concentration). Plots 4.3/4.4 will test whether the gap widens with HHI.

Trust: medium — uses Definition C (role ID change + salary >5%) with theoretical salary. Early years (2018–2019) have near-zero rates due to data coverage, not true absence of promotions.

## Next recommended step

Proceed to `issue2_22` (Plot 4.2: time to first promotion).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
