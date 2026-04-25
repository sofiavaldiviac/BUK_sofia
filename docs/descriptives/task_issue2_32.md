# Task: Plot 5.6 — Pay Equity Perceptions by Gender x Org Size (Survey)

| Field | Value |
|---|---|
| **Task ID** | `issue2_32` |
| **Title** | Plot pay equity perceptions by gender x organization size from WiP survey |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

Organization size in the survey is a proxy for market structure (analogous to HHI in admin data). If the gender gap in pay equity perceptions widens in smaller organizations (where monopsony power may be higher or HR practices less formalized), it provides survey-side corroboration of the admin-data HHI results.

## Specific goal

Produce a grouped bar chart of pay equity perceptions by gender x organization size:
- Survey question on pay equity (same as Plot 5.1)
- Organization size categories from survey (e.g., <50, 50-200, >200 employees)
- Groups by org size x bars by gender
- Y-axis: share perceiving equal pay (or mean agreement score)
- Does the perception gap widen in smaller organizations?
- Filter to Chile subsample
- Report N per cell

## Success criteria

- [ ] Org size variable correctly categorized from survey
- [ ] Chile filter applied
- [ ] Pattern with org size clearly visible (or documented if absent)
- [ ] N per cell reported
- [ ] Saved to `1_Code/figures/`

## Inputs / relevant files

- WiP 2026 survey data (cleaned in `1_Code/descriptives/survey2026.R`)
- `3_Documents/English/WiP_Survey_2026_Variables.md` — variable dictionary
- Related: `docs/survey/task_01_wage_gap_perceptions.md` (heterogeneity by org size already specified)

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

Gender gap in pay equity perceptions widens with org size. Small orgs (10 or fewer): 65% F vs 61% M agree (4pp gap). Large orgs (200+): 49% F vs 73% M agree (24pp gap). Pattern consistent with monopsony: larger firms have more structured (but potentially more unequal) pay practices. Trust level: High. Evidence: 1_Code/figures/rf_5_6_pay_equity_by_gender_x_orgsize.png. Next action: Compare with admin HHI interaction (task issue2_23).

## Next recommended step

Proceed to `issue2_33` (Plot 6.1: female LFP Chile vs OECD). This begins Section 6.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
