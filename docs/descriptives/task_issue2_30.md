# Task: Plot 5.4 — Burnout and Work-Life Interference by Gender (Survey)

| Field | Value |
|---|---|
| **Task ID** | `issue2_30` |
| **Title** | Plot burnout and work-life interference by gender from WiP survey |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

If women report more burnout despite fewer career opportunities, it highlights a paradox consistent with the monopsony story: constrained outside options mean women cannot leave bad situations, leading to worse wellbeing outcomes even as they receive fewer rewards.

## Specific goal

Produce a grouped bar chart of burnout and work-life interference by gender:
- Burnout frequency (from survey question on burnout/exhaustion)
- Work-life interference frequency (from survey question on work intruding on personal life)
- Bars grouped by gender
- Y-axis: share reporting frequent burnout / interference
- Filter to Chile subsample
- Report N per gender

## Success criteria

- [ ] Burnout and work-life variables correctly identified from survey
- [ ] Chile filter applied
- [ ] Gender gap in burnout clearly visible (or documented if not)
- [ ] Saved to `1_Code/figures/`

## Inputs / relevant files

- WiP 2026 survey data (cleaned in `1_Code/descriptives/survey2026.R`)
- `3_Documents/English/WiP_Survey_2026_Variables.md` — variable dictionary
- Related: `docs/survey/task_11_worklife_balance.md` (plots 2.6a-h cover same variables in more detail)

## Branch used

_TBD_

## Compute environment used

Local (R)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Plot created | Grouped bar in reducedform_survey.R. N=1,002. |

## Outcome

Women report more burnout (19% vs 14% 'often/always') and more work-life interference (26% vs 23%). Despite fewer career rewards, women experience worse wellbeing. Trust level: High. Evidence: 1_Code/figures/rf_5_4_burnout_wlb_by_gender.png. Next action: Consistent with constrained outside options -- women cannot leave bad situations.

## Next recommended step

Proceed to `issue2_31` (Plot 5.5: most valued job attributes).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
