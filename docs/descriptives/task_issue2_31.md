# Task: Plot 5.5 — Most Valued Job Attributes by Gender (Survey)

| Field | Value |
|---|---|
| **Task ID** | `issue2_31` |
| **Title** | Plot most valued job attributes by gender from WiP survey |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

If women value flexibility and proximity more than men, it is consistent with constrained outside options: women may accept lower wages or fewer promotions in exchange for non-wage amenities. This connects to the model's prediction that firms exploit gender differences in outside option sensitivity.

## Specific goal

Produce a horizontal bar chart of most valued job attributes by gender:
- Attributes from survey (salary, benefits, flexibility, growth opportunities, proximity, social impact, etc.)
- Bars grouped by gender
- Y-axis: attribute; X-axis: share ranking it as top priority (or mean ranking)
- Highlight whether flexibility/proximity differ significantly by gender
- Filter to Chile subsample
- Report N per gender

## Success criteria

- [ ] Job attribute variables correctly identified from survey
- [ ] Chile filter applied
- [ ] Gender differences in flexibility/proximity highlighted
- [ ] Saved to `1_Code/figures/`

## Inputs / relevant files

- WiP 2026 survey data (cleaned in `1_Code/descriptives/survey2026.R`)
- `3_Documents/English/WiP_Survey_2026_Variables.md` — variable dictionary
- Related: `docs/survey/task_14_job_attributes.md` (plots 3.1a-c cover same variables)

## Branch used

_TBD_

## Compute environment used

Local (R)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Plot created | Horizontal bar in reducedform_survey.R. N=1,002. |

## Outcome

Salary top priority for both (78% M vs 65% F). Women value growth opportunities more (44% vs 38%), flexibility more (32% vs 25%), and proximity more (23% vs 21%). Men value salary and work environment more. Trust level: High. Evidence: 1_Code/figures/rf_5_5_job_attributes_by_gender.png. Next action: Women's higher valuation of flexibility/proximity consistent with constrained outside options model.

## Next recommended step

Proceed to `issue2_32` (Plot 5.6: pay equity perceptions by org size).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
