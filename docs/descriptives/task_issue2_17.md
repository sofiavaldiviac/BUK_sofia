# Task: Plot 3.2 — Conversion Rate by Gender x HHI Tercile

| Field | Value |
|---|---|
| **Task ID** | `issue2_17` |
| **Title** | Plot hiring conversion rate by candidate gender x market concentration |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_02` (HHI construction) |

## Motivation

This is the key screening test: does the gender gap in hiring conversion widen in concentrated markets? The model predicts that firms with more market power can afford to screen more aggressively, but the sign of the gender differential at hiring is theoretically ambiguous (two opposing forces). This plot provides the empirical answer.

## Specific goal

Produce a grouped bar chart of application-to-hire conversion rate by gender x HHI tercile:
- Merge vacancy's HHI tercile (from `issue2_02` output) to applications via firm identifier
- Three groups (low, medium, high HHI) x two bars (male, female)
- Y-axis: conversion rate (applied to hired)
- Report N applicants per cell
- Filter to Chile

## Success criteria

- [ ] HHI tercile correctly merged to application data
- [ ] Clear visual: does gender gap widen or narrow with concentration?
- [ ] N per cell reported (flag if any cell is small)
- [ ] Chile filter applied
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- `do_application` — application records (Databricks)
- `do_candidate` — candidate gender (Databricks)
- Output of `issue2_02` (HHI by occupation x region, with terciles)

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

Proceed to `issue2_18` (Plot 3.3: referral source by gender).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
