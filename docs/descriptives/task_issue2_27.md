# Task: Plot 5.1 — Pay Equity Perceptions by Gender (Survey)

| Field | Value |
|---|---|
| **Task ID** | `issue2_27` |
| **Title** | Plot pay equity perceptions by gender from WiP survey |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

Perceptions of pay equity complement the admin wage data. If women perceive less equal pay, it suggests awareness of the gap and connects to satisfaction and retention mechanisms.

## Specific goal

Produce a bar chart of pay equity perceptions by gender:
- Survey question on whether men and women are paid equally at their organization
- Bars grouped by gender
- Y-axis: share of respondents per response category (e.g., agree/disagree scale)
- Filter to Chile subsample
- Report N per gender

## Success criteria

- [ ] Pay equity perception variable correctly identified from survey
- [ ] Chile filter applied
- [ ] Gender gap in perceptions clearly visible
- [ ] Saved to `1_Code/figures/`

## Inputs / relevant files

- WiP 2026 survey data (cleaned in `1_Code/descriptives/survey2026.R`)
- `3_Documents/English/WiP_Survey_2026_Variables.md` — variable dictionary
- Related: `docs/survey/task_01_wage_gap_perceptions.md` (plots 1.1a-f cover same variable in more detail)

## Branch used

_TBD_

## Compute environment used

Local (R)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Plot created | Stacked bar in reducedform_survey.R. N=1,002. |

## Outcome

Stacked bar shows stark gender gap: 20% of women disagree that pay is equal vs only 8% of men. 71% of men agree vs 55% of women. Trust level: High. Evidence: 1_Code/figures/rf_5_1_pay_equity_by_gender.png. Next action: Cross-reference with admin wage gap data (task issue2_34).

## Next recommended step

Proceed to `issue2_28` (Plot 5.2: salary negotiation funnel).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
