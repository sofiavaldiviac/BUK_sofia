# Task: Plot 4.6 — Promotion Rate by Gender x Firm Size

| Field | Value |
|---|---|
| **Task ID** | `issue2_26` |
| **Title** | Plot promotion rate by gender x firm size |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_03` (promotion events) |

## Motivation

Firm size is a proxy for market power and internal labor markets. Large firms (>250 employees) may have more structured promotion ladders, while small firms rely on informal advancement. Comparing the gender promotion gap across firm sizes provides a robustness check on the HHI interaction.

## Specific goal

Produce a grouped bar chart of promotion rate by gender x firm size:
- Define firm size from employee count per `tenant_id` (e.g., <50, 50-250, >250)
- Three groups x two bars (male, female)
- Y-axis: annual promotion rate
- Report N per cell
- Filter to Chile

## Success criteria

- [x] Firm size correctly computed from employee counts (year-end snapshot)
- [x] Clear visual: gender gap reverses with firm size (same pattern as HHI)
- [x] N per cell reported
- [x] Chile filter applied
- [x] Saved to `1_Code/figures/`

## Inputs / relevant files

- Output of `issue2_03` (promotion event dataset)
- `shared_adm_job` — for computing firm size (Databricks)

## Branch used

`main`

## Compute environment used

Local (Python, cached CSVs + promotions parquet)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Added Plot 4.6 to `reducedform_admin.py` | Grouped bar chart. Firm size from employee count per tenant at year-end snapshot. |
| 2026-04-24 | Generated plot | `rf_4_6_promotion_by_gender_firmsize.png` |

## Outcome

**Grouped bar chart: promotion rate by gender x firm size (2020–2025).**

| Firm size | Female | Male | Gap (F-M) |
|-----------|--------|------|-----------|
| Small (<50) | 1.59% (2,572) | 1.37% (3,583) | **+0.22pp** |
| Medium (50-250) | 2.54% (8,114) | 2.28% (11,744) | **+0.26pp** |
| Large (>250) | 2.45% (19,953) | 2.53% (26,433) | **-0.08pp** |

**Same pattern as Plot 4.3 (HHI):** Women promoted more in small/medium firms, gap flips in large firms. Reinforces the market power story — larger firms have more monopsony power and promote women relatively less.

The reversal is smaller here (-0.08pp vs -0.23pp for high HHI) because firm size is a noisier proxy for market power than HHI.

Trust: medium — same caveats as other promotion plots. Firm size computed from BUK employee counts, which may undercount total firm employment.

## Next recommended step

Proceed to `issue2_27` (Plot 5.1: pay equity perceptions). This begins Section 5.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
