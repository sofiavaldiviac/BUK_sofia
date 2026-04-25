# Task: Plot 1.1 — Job-to-Job Transition Rates by Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_04` |
| **Title** | Plot job-to-job transition rates by gender (monthly) |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_01` (job spells) |

## Motivation

Job-to-job (J2J) transitions are a direct measure of outside option realization. If women have lower outside offer arrival rates (lambda_F < lambda_M), we expect lower J2J transition rates for women. This is the first stylized fact in Section 1: "Women have fewer outside options."

## Specific goal

Produce a line chart showing monthly J2J transition rates by gender:
- J2J = share of workers moving from firm A to firm B within 1-3 months
- X-axis: calendar month
- Y-axis: J2J transition rate
- Two lines: male vs. female
- Variant: same plot broken out by tenure buckets (<1yr, 1-3yr, 3+yr)

## Success criteria

- [ ] Main plot: monthly J2J rate by gender, clear gender gap visible (or documented if not)
- [ ] Variant plot: J2J rate by gender x tenure bucket
- [ ] Sample sizes reported (N workers per gender per period)
- [ ] Saved to `5_Output/descriptives/` or equivalent

## Inputs / relevant files

- Output of `issue2_01` (job spell dataset with `j2j_transition` flag)

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

Proceed to `issue2_05` (Plot 1.2: spell duration distribution).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
