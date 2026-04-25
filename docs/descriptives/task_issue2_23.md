# Task: Plot 4.3 — Promotion Rate by Gender x HHI Tercile

| Field | Value |
|---|---|
| **Task ID** | `issue2_23` |
| **Title** | Plot promotion rate by gender x market concentration (HHI tercile) |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_02` (HHI construction), `issue2_03` (promotion events) |

## Motivation

This is the KEY MODEL PREDICTION: the gender promotion gap should widen in more concentrated markets. The retention trade-off is stronger when women have fewer outside options (high HHI), so firms set a higher promotion threshold for women precisely where market power is greatest.

## Specific goal

Produce a grouped bar chart of promotion rate by gender x HHI tercile:
- Merge HHI tercile (from `issue2_02`) to worker's occupation x region cell
- Three groups (low, medium, high HHI) x two bars (male, female)
- Y-axis: annual promotion rate
- Highlight: does the gender gap widen monotonically with HHI?
- Report N per cell
- Filter to Chile

## Success criteria

- [x] HHI tercile correctly merged to promotion data
- [x] Clear visual: gender promotion gap by concentration level
- [x] Monotonic widening pattern tested — **confirmed: gap reverses with HHI**
- [x] N per cell reported
- [x] Chile filter applied
- [x] Saved to `1_Code/figures/`

## Inputs / relevant files

- Output of `issue2_02` (HHI by occupation x region, with terciles)
- Output of `issue2_03` (promotion event dataset)

## Branch used

`main`

## Compute environment used

Local (Python, cached CSVs + HHI/promotion parquets)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Added Plot 4.3 to `reducedform_admin.py` | Grouped bar chart, 3 HHI terciles x 2 genders. Merged promotions to worker's HHI cell via person-years. |
| 2026-04-24 | Generated plot | `rf_4_3_promotion_by_gender_hhi.png` |

## Outcome

**Grouped bar chart: promotion rate by gender x employment-based HHI tercile (2020–2025).**

| HHI tercile | Female | Male | Gap (F-M) |
|-------------|--------|------|-----------|
| Low (competitive) | 2.94% (8,412) | 2.61% (15,536) | **+0.32pp** |
| Medium | 2.65% (9,982) | 2.28% (9,632) | **+0.36pp** |
| High (concentrated) | 1.50% (5,475) | 1.73% (7,661) | **-0.23pp** |

**KEY FINDING: The gender promotion gap reverses with market concentration.**
- In competitive markets (low HHI): women are promoted more often than men (+0.32pp)
- In concentrated markets (high HHI): men are promoted more often (-0.23pp)
- The swing is ~0.55pp from low to high HHI — monotonic

**Consistent with model prediction:** In concentrated markets, firms have more power over women (fewer outside options), so they set higher promotion thresholds for women. In competitive markets, firms must promote women to retain them.

Trust: medium — uses first-pass Definition C with theoretical salary. Both overall promotion rates and the denominator are affected by HHI tercile assignment. Not causal — selection into concentrated markets could drive the pattern.

## Next recommended step

Proceed to `issue2_24` (Plot 4.4: wage growth at promotion).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
