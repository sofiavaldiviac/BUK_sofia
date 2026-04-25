# Task: Plot 3.1 — Application-to-Hire Conversion Rate by Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_16` |
| **Title** | Plot application-to-hire conversion rate by candidate gender |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

The hiring funnel is where firms exercise their screening threshold (q* in the model). If firms set different thresholds for men and women, conversion rates will differ by gender. This is the baseline screening fact before interacting with market concentration.

## Specific goal

Produce a funnel chart or grouped bar chart of the hiring pipeline by candidate gender:
- Stages: applied -> shortlisted -> hired
- Use `do_application` with `application_status` to track stage progression
- Merge candidate gender from `do_candidate` via `candidate_id`
- Two funnels: male vs. female
- Report: N applicants, conversion rate at each stage, overall applied-to-hired rate
- Filter to Chile

## Success criteria

- [ ] Funnel stages correctly identified from application status field
- [ ] Gender correctly merged from candidate data
- [ ] Conversion rates reported at each stage
- [ ] Chile filter applied
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- `do_application` — application records with status (Databricks)
- `do_candidate` — candidate gender (Databricks)

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

Proceed to `issue2_17` (Plot 3.2: conversion rate by gender x HHI).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
