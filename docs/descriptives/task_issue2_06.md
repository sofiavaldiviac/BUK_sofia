# Task: Plot 1.3 — Separation Rates by Gender and Exit Reason

| Field | Value |
|---|---|
| **Task ID** | `issue2_06` |
| **Title** | Plot separation rates by gender and exit reason |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None (computed directly from `shared_adm_job`) |

## Motivation

Distinguishing voluntary from involuntary separations sharpens the outside-option story. If women have lower voluntary quit rates but similar involuntary separation rates, that points to constrained outside options rather than lower job match quality.

## Specific goal

Produce a grouped bar chart of separation rates by gender and exit reason:
- Categories: voluntary quit, involuntary separation (layoff/dismissal), other/unknown
- Bars grouped by gender (male vs. female)
- Y-axis: separation rate (share of workers separating per year)
- Report sample sizes per category

## Success criteria

- [x] Separation types correctly classified (voluntary vs. involuntary vs. contract end)
- [x] Clear visual comparison across gender and exit reason
- [x] Exit reason data is sparse — coverage rate documented (1.3%)
- [x] Saved to `1_Code/figures/`

## Inputs / relevant files

- `shared_adm_job` — `exit_reason` field (cached CSV)
- `shared_core_employee` — gender (cached CSV)
- `shared_core_rsch_company` — country filter (cached CSV)

## Compute environment used

Local (Python, cached CSVs)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Checked exit_reason coverage | Only 1.3% populated (96K / 7.1M completed spells). Proceeded with available data. |
| 2026-04-24 | Added Plot 1.3 to `reducedform_admin.py` | Classified exit reasons into Voluntary / Involuntary / Contract end. |
| 2026-04-24 | Generated `rf_1_3_separation_by_gender.png` | Grouped bar chart by gender. |

## Outcome

**Key findings (N=96K separations with exit_reason, 1.3% coverage):**
- **Women:** 81% contract end, 14% voluntary, 5% involuntary
- **Men:** 73% contract end, 17% voluntary, 9% involuntary
- Women have *lower* voluntary quit rates (14% vs 17%) AND lower involuntary separation rates (5% vs 9%)
- Women are more concentrated in contract-end separations (81% vs 73%)

**Interpretation for monopsony story:** Lower voluntary quit rate for women is consistent with fewer outside options — women are less likely to quit because they have fewer competing offers. The higher contract-end share for women may reflect more fixed-term/temporary contracts.

Trust: low — only 1.3% of completed spells have exit_reason. The firms that record exit reasons may not be representative.

## Next recommended step

Proceed to remaining Section 1 tasks. Note: `issue2_07` (distinct employers) is blocked — no cross-tenant person ID.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
