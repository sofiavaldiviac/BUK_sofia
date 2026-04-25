# Task: Plot 4.2 — Time to First Promotion by Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_22` |
| **Title** | Plot time to first promotion by gender (Kaplan-Meier) |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_03` (promotion events) |

## Motivation

Time to first promotion captures the speed of career progression. The model predicts that women face a higher promotion threshold, which translates to longer wait times. A Kaplan-Meier curve is the standard way to show this in a duration analysis framework.

## Specific goal

Produce a Kaplan-Meier survival curve for time to first promotion by gender:
- Time zero = start of first spell at a given firm
- Event = first promotion (from `issue2_03` output)
- Censoring = spell ends without promotion
- Two curves: male vs. female
- Report median time to first promotion by gender (if reached)
- Filter to Chile

## Success criteria

- [x] Kaplan-Meier curves correctly computed with censoring
- [x] Clear separation between male and female curves (or documented if not) — no separation found
- [x] Median time to promotion reported by gender — not reached for either
- [x] Chile filter applied
- [x] Saved to `1_Code/figures/`

## Inputs / relevant files

- Output of `issue2_03` (promotion event dataset with `tenure_at_promotion`)
- Output of `issue2_01` (job spells for censoring information)

## Branch used

`main`

## Compute environment used

Local (Python, cached CSVs + promotions parquet)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Added Plot 4.2 to `reducedform_admin.py` | KM survival curve, manual implementation (no lifelines). Time zero = first job start at tenant. |
| 2026-04-24 | Generated plot | `rf_4_2_time_to_promotion_km.png` |

## Outcome

**KM survival curve for time to first promotion, by gender.**

- 1,125,617 employee-tenant spells (453K female, 672K male)
- 74,207 promoted (6.6%), 1,051,410 censored (93.4%)
- Median time to promotion: **not reached** for either gender (>50% never promoted under this definition)
- Curves nearly identical — virtually **no gender gap** in unconditional time to first promotion
- By 10 years: ~85% of both genders still not promoted

**Interpretation:** Same story as Plot 4.1 — no raw unconditional gender gap. The monopsony prediction is about the *conditional* gap by HHI (Plot 4.3). The unconditional similarity may mask heterogeneity across concentrated vs. competitive markets.

Trust: medium — Definition C is strict (role ID change + salary >5%), so most workers never "promote." Time-zero is first job at tenant, not career start.

## Next recommended step

Proceed to `issue2_23` (Plot 4.3: promotion rate by gender x HHI).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
