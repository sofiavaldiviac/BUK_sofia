# Task: Plot 1.6 — Reasons for Wanting to Leave by Gender (Survey)

| Field | Value |
|---|---|
| **Task ID** | `issue2_09` |
| **Title** | Plot reasons for wanting to leave current job by gender |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

The reasons behind turnover intention help distinguish between mechanisms. If women disproportionately cite "growth opportunities" or "compensation," it supports the career-progression channel of monopsony. If they cite "work-life balance," it points to a different (though possibly complementary) constraint.

## Specific goal

Produce a horizontal bar chart of reasons for wanting to leave, by gender:
- Reason categories from survey (growth opportunities, compensation, work-life balance, discrimination, burnout, other)
- Bars grouped by gender
- Y-axis: reason category; X-axis: share citing that reason
- Highlight whether "growth opportunities" or "compensation" differs significantly by gender
- Filter to Chile subsample, conditional on wanting to change jobs

## Success criteria

- [ ] Reason categories correctly mapped from survey variable
- [ ] Chile filter applied; conditional on turnover intention != "stay"
- [ ] Gender differences in "growth" and "compensation" reasons highlighted
- [ ] Saved to `1_Code/figures/`

## Inputs / relevant files

- WiP 2026 survey data (cleaned in `1_Code/descriptives/survey2026.R`)
- `3_Documents/English/WiP_Survey_2026_Variables.md` — variable dictionary
- Related: `docs/survey/task_12_turnover_discrimination.md` (plot 2.7b covers same variable)

## Branch used

_TBD_

## Compute environment used

Local (R)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Plot created | Horizontal bar chart in `1_Code/descriptives/reducedform_survey.R`. Conditional on wanting to change: N=581 women, N=264 men. |

## Outcome

**Outcome:** Horizontal bar chart of 8 turnover reasons by gender. "Lack of growth" is top for both genders but cited more by women (58% vs 51%). Men cite "inadequate compensation" more (49% vs 40%). Burnout slightly higher for men (28% vs 24%). Discrimination low overall but higher for women (5% vs 3%).

**Trust level:** High. Variables mapped from K1_1 multiple-selection items, conditional on turnover_intent_rec2 in {1, 2}.

**Evidence:** Figure saved as `1_Code/figures/rf_1_6_turnover_reasons_by_gender.png`.

**Next action:** The growth-opportunity gap (58% F vs 51% M) supports the career-progression channel. Cross-reference with admin promotion data (task issue2_21).

## Next recommended step

Proceed to `issue2_10` (Plot 1.7: perceived promotion opportunities).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
