# Task: Plot 5.2 — Salary Negotiation Funnel by Gender (Survey)

| Field | Value |
|---|---|
| **Task ID** | `issue2_28` |
| **Title** | Plot salary negotiation funnel by gender from WiP survey |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

The negotiation funnel (asked for raise -> outcome -> denial reasons) reveals where in the bargaining process women lose out. A "leaky pipeline" where women ask less, succeed less, or face different denial reasons connects to the monopsony mechanism: firms with market power can deny raises to workers with fewer outside options.

## Specific goal

Produce a funnel or waterfall chart of the salary negotiation process by gender:
- Stage 1: share who asked for a raise
- Stage 2: among those who asked, share who received it
- Stage 3: among those denied, reasons for denial
- Two funnels: male vs. female
- Filter to Chile subsample
- Report N at each stage by gender

## Success criteria

- [ ] Funnel stages correctly mapped from survey variables
- [ ] Chile filter applied
- [ ] Leaky pipeline clearly visible at each stage
- [ ] Denial reasons broken out by gender
- [ ] Saved to `1_Code/figures/`

## Inputs / relevant files

- WiP 2026 survey data (cleaned in `1_Code/descriptives/survey2026.R`)
- `3_Documents/English/WiP_Survey_2026_Variables.md` — variable dictionary
- Related: `docs/survey/task_02_salary_negotiations.md` (plots 1.2a-e cover same variables)

## Branch used

_TBD_

## Compute environment used

Local (R)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Plot created | Funnel + denial reasons in reducedform_survey.R. N=1,002 base, 381 asked. |

## Outcome

Two plots. Funnel: women less likely to ask (37% vs 41%) AND less likely to receive when asking (61% vs 71%). Denial reasons: 'lack of budget' cited most (84% F vs 66% M). Trust level: High. Evidence: 1_Code/figures/rf_5_2_negotiation_funnel_by_gender.png, rf_5_2_denial_reasons_by_gender.png. Next action: Leaky pipeline at both stages supports monopsony mechanism.

## Next recommended step

Proceed to `issue2_29` (Plot 5.3: satisfaction heatmap).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
