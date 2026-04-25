# Task: Plot 2.3 — Gender Composition of Applicant Pools

| Field | Value |
|---|---|
| **Task ID** | `issue2_13` |
| **Title** | Plot gender composition of applicant pools by functional area |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

The share of female applicants varies across functional areas. Areas with few female applicants may reflect supply-side sorting or demand-side discouragement. This plot sets the baseline for interpreting hiring conversion gaps in Section 3.

## Specific goal

Produce a bar chart of the share of female applicants by functional area:
- Merge candidate gender from `do_candidate` via `candidate_id`
- Group by `category_area` (from `do_recruitment`, linked through `do_application`)
- X-axis: share female among applicants; Y-axis: functional area
- Sort by female share
- Filter to Chile
- Report N applicants per area

## Success criteria

- [ ] Gender correctly merged from candidate data
- [ ] Functional areas sorted by female share
- [ ] N applicants per area reported
- [ ] Chile filter applied
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- `do_application` — application records (Databricks)
- `do_candidate` — candidate gender (Databricks)
- `do_recruitment` — vacancy-level data with `category_area` (Databricks)

## Branch used

_TBD_

## Compute environment used

Databricks (PySpark/Python)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Rewrote in `reducedform_admin.py` | Share female by functional area (English labels). Gender coverage 35.2% (Chile). Local CSV data. Style matches `reducedform_survey.R`. |

## Outcome

Horizontal bar chart of % female among applicants by functional area (Chile, N=835,417 applications with gender+area). Medical/Health highest (65%), IT lowest (32%). 50% parity line shown. Gender coverage is 35.2% — most applications lack gender data. Trust level: High. Evidence: `1_Code/figures/rf_2_3_gender_applicant_pools.png`. Next action: proceed to issue2_14.

## Next recommended step

Proceed to `issue2_14` (Plot 2.4: HHI distribution).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
