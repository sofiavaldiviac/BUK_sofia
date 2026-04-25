# Task: Plot 1.5 — Turnover Intention by Gender (Survey)

| Field | Value |
|---|---|
| **Task ID** | `issue2_08` |
| **Title** | Plot turnover intention by gender from WiP survey |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

Turnover intention from the survey complements the admin J2J data. If women report wanting to stay at higher rates despite fewer transitions, it suggests constrained options rather than preferences. If they report wanting to leave but not doing so, the constraint interpretation is even stronger.

## Specific goal

Produce a bar chart of turnover intention by gender:
- Categories: stay and happy, considering change, actively searching (from survey question on job change plans)
- Bars grouped by gender
- Y-axis: share of respondents
- Filter to Chile subsample
- Report N per gender

## Success criteria

- [ ] Turnover intention categories correctly mapped from survey variable
- [ ] Chile filter applied
- [ ] Gender gap in intention clearly visible (or documented if not)
- [ ] Saved to `1_Code/figures/`

## Inputs / relevant files

- WiP 2026 survey data (cleaned in `1_Code/descriptives/survey2026.R`)
- `3_Documents/English/WiP_Survey_2026_Variables.md` — variable dictionary
- Related: `docs/survey/task_12_turnover_discrimination.md` (plot 2.7a covers same variable)

## Branch used

_TBD_

## Compute environment used

Local (R)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Plot created | Stacked bar chart in `1_Code/descriptives/reducedform_survey.R`. Chile subsample: N=693 women, N=309 men. |

## Outcome

**Outcome:** Stacked bar chart shows turnover intention is similar across gender: ~84-85% want to change (actively or passively), ~15-16% plan to stay. Men slightly more likely to be actively searching (58% vs 53%). No strong gender gap in stated turnover intention.

**Trust level:** High. Variable mapping verified against survey codebook (K1: 3-level recode).

**Evidence:** Figure saved as `1_Code/figures/rf_1_5_turnover_intention_by_gender.png`.

**Next action:** Combine with admin J2J data (task issue2_04) to test whether similar stated intentions translate to different realized transitions.

## Next recommended step

Proceed to `issue2_09` (Plot 1.6: reasons for wanting to leave).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
