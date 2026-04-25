# Task: Plot 2.2 — Applicants per Vacancy by Functional Area

| Field | Value |
|---|---|
| **Task ID** | `issue2_12` |
| **Title** | Plot applicants per vacancy by functional area |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

Market tightness varies across job categories. Showing which functional areas are tight vs. loose helps readers understand where screening matters most and motivates the heterogeneity analysis.

## Specific goal

Produce a bar chart or box plot of applicants per vacancy by functional area:
- Group vacancies by `category_area` (from `do_recruitment`)
- Y-axis: functional area; X-axis: median applicants per vacancy (or box plot distribution)
- Sort by tightness to show the range
- Filter to Chile
- Report N vacancies per functional area

## Success criteria

- [ ] Functional areas sorted by tightness
- [ ] Clear visual distinction between tight and loose job categories
- [ ] N vacancies per area reported
- [ ] Chile filter applied
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- `do_recruitment` — vacancy-level data with `category_area` (Databricks)
- `do_application` — for counting applicants per vacancy (Databricks)

## Branch used

_TBD_

## Compute environment used

Databricks (PySpark/Python)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Rewrote in `reducedform_admin.py` | Horizontal bar chart, 8 functional areas translated to English. Local CSV data. Style matches `reducedform_survey.R`. |

## Outcome

Horizontal bar chart of median applicants per vacancy by functional area (Chile, N=123,799 vacancies with area). Education/Academia highest (median=3), Customer Service and Medical/Health tightest (median=1). Trust level: High. Evidence: `1_Code/figures/rf_2_2_applicants_by_area.png`. Next action: proceed to issue2_13.

## Next recommended step

Proceed to `issue2_13` (Plot 2.3: gender composition of applicant pools).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
