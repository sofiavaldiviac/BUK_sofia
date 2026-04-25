# Task: Plot 5.3 — Job Satisfaction Heatmap by Gender (Survey)

| Field | Value |
|---|---|
| **Task ID** | `issue2_29` |
| **Title** | Plot job satisfaction heatmap by gender from WiP survey |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

A heatmap of satisfaction across multiple dimensions reveals which aspects of work drive the overall gender gap in job quality. If women are less satisfied specifically with promotions and recognition (but not, say, flexibility), it points directly to the career-progression channel.

## Specific goal

Produce a heatmap of satisfaction scores by gender across multiple dimensions:
- Dimensions: salary, promotions, recognition, flexibility, workload (from survey satisfaction questions)
- Rows: satisfaction dimensions; Columns: male, female
- Color: mean satisfaction score (or share satisfied)
- Highlight dimensions with the largest gender gap
- Filter to Chile subsample
- Report N per gender

## Success criteria

- [ ] All satisfaction dimensions correctly mapped from survey
- [ ] Chile filter applied
- [ ] Heatmap clearly shows which dimensions have largest gender gaps
- [ ] Saved to `1_Code/figures/`

## Inputs / relevant files

- WiP 2026 survey data (cleaned in `1_Code/descriptives/survey2026.R`)
- `3_Documents/English/WiP_Survey_2026_Variables.md` — variable dictionary
- Related: `docs/survey/task_03_promotions_meritocracy.md` (promotion satisfaction) and `docs/survey/task_11_worklife_balance.md` (workload satisfaction)

## Branch used

_TBD_

## Compute environment used

Local (R)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Plot created | Heatmap in reducedform_survey.R. N=1,002. |

## Outcome

Heatmap of mean satisfaction (1-5) across 7 dimensions by gender. Women score lower on every dimension. Largest gaps: salary (2.97 F vs 3.28 M), promotions (2.99 F vs 3.23 M). Smallest gap: D&I (3.56 vs 3.71). Trust level: High. Evidence: 1_Code/figures/rf_5_3_satisfaction_heatmap_by_gender.png. Next action: Salary and promotion gaps are the career-progression dimensions predicted by the model.

## Next recommended step

Proceed to `issue2_30` (Plot 5.4: burnout and work-life interference).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
