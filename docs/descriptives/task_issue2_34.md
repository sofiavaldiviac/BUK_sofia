# Task: Plot 6.2 — Gender Wage Gap in BUK Data

| Field | Value |
|---|---|
| **Task ID** | `issue2_34` |
| **Title** | Plot gender wage gap distribution from BUK admin data |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

The raw gender wage gap in BUK data establishes the baseline inequality the paper seeks to explain. Showing the distribution (not just the mean) and breaking it by sector reveals where the gap is largest.

## Specific goal

Produce two plots:

**Main plot:** Overlapping density plots of base salary by gender
- From `shared_adm_salary`, most recent observation per worker
- Two densities: male vs. female
- Report median salary by gender and raw gap

**Variant:** Median gender wage gap by sector
- Bar chart: sectors on Y-axis, wage gap on X-axis
- Wage gap = (median_male - median_female) / median_male

Filter to Chile.

## Success criteria

- [ ] Salary data correctly pulled (base salary, most recent per worker)
- [ ] Main plot: clear gender distribution comparison
- [ ] Variant: sector-level gaps shown
- [ ] Chile filter applied
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- `shared_adm_salary` — salary records (Databricks)
- `shared_core_rsch_employee` — gender (Databricks)
- `shared_core_rsch_company` — sector (Databricks)
- `4_Code/summary_stats_salary.py` — PySpark pattern for salary data

## Branch used

_TBD_

## Compute environment used

Databricks (PySpark)

## Status

`planned`

## Action log

| Date | Action | Notes |
|---|---|---|

## Outcome

_TBD_

On closeout, record: outcome, trust level, evidence, next action.

## Next recommended step

Proceed to `issue2_35` (Plot 6.3: gender composition of BUK firms).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
