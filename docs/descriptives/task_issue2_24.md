# Task: Plot 4.4 — Wage Growth at Promotion by Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_24` |
| **Title** | Plot wage growth at promotion by gender, with HHI variant |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_03` (promotion events), `issue2_02` (HHI, for variant) |

## Motivation

Wage growth at promotion measures the return to career advancement. If women receive smaller wage increases upon promotion (conditional on being promoted), it suggests firms extract more surplus from women even at the promotion margin.

## Specific goal

Produce two plots:

**Main plot:** Bar chart or box plot of wage growth at promotion by gender
- Wage growth = (post_salary - pre_salary) / pre_salary from `issue2_03` output
- Two bars/boxes: male vs. female
- Report median wage growth by gender

**Variant:** Wage growth at promotion by gender x HHI tercile
- Merge HHI tercile from `issue2_02`
- Three groups x two bars
- Does the wage growth gap vary with market concentration?

Filter to Chile.

## Success criteria

- [ ] Wage growth correctly computed from pre/post salary
- [ ] Main plot: clear gender comparison
- [ ] Variant: HHI interaction shown
- [ ] Outliers handled (trim extreme wage changes)
- [ ] Chile filter applied
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- Output of `issue2_03` (promotion events with `pre_salary`, `post_salary`)
- Output of `issue2_02` (HHI terciles, for variant)

## Branch used

_TBD_

## Compute environment used

Databricks (PySpark/Python)

## Status

`planned`

## Action log

| Date | Action | Notes |
|---|---|---|

## Outcome

_TBD_

On closeout, record: outcome, trust level, evidence, next action.

## Next recommended step

Proceed to `issue2_25` (Plot 4.5: women in supervisory roles).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
