# Task: Plot 2.1 — Distribution of Applicants per Vacancy

| Field | Value |
|---|---|
| **Task ID** | `issue2_11` |
| **Title** | Plot distribution of applicants per vacancy |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

The number of applicants per vacancy is a direct measure of labor market tightness at the job level. The heavy right tail (median=2, mean=18.7, P90=42) shows BUK can distinguish tight from loose labor markets, which is essential for the screening mechanism.

## Specific goal

Produce a histogram of applicants per vacancy:
- Count applications per `selection_process_id` (from `do_application` and `do_recruitment`)
- X-axis: number of applicants (log scale recommended given heavy right tail)
- Y-axis: frequency or density
- Report: median, mean, P10, P90
- Filter to Chile

## Success criteria

- [ ] Histogram clearly shows the heavy right tail
- [ ] Log scale used for readability
- [ ] Summary statistics reported (median, mean, P10, P90)
- [ ] Chile filter applied
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- `do_recruitment` — vacancy-level data (Databricks)
- `do_application` — application-level data (Databricks)

## Branch used

_TBD_

## Compute environment used

Databricks (PySpark/Python)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Rewrote in `reducedform_admin.py` | Switched from delta_sharing to local CSV. Linear histogram capped at P99 (~267), caption notes excluded 1%. English labels. Style matches `reducedform_survey.R`. |

## Outcome

Linear histogram of applicants per vacancy (Chile, N=145,650 vacancies). Median=2, mean=18.7, P10=1, P90=42. Distribution highly skewed — 1,454 vacancies (1%) with >267 applicants excluded from plot and noted in caption. Trust level: High. Evidence: `1_Code/figures/rf_2_1_applicants_per_vacancy.png`. Next action: proceed to issue2_12.

## Next recommended step

Proceed to `issue2_12` (Plot 2.2: applicants by functional area).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
