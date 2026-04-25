# Task: Plot 1.2d — Net Salary and Bonus Decomposition by Gender at Job Transitions

| Field | Value |
|---|---|
| **Task ID** | `issue2_05d` |
| **Title** | Compare net salary and bonuses per job_id by gender |
| **Date opened** | 2026-04-24 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_05c` (salary magnitude analysis) |

## Motivation

Plot 1.2c shows no gender gap in *theoretical* salary increase magnitude. But monopsony power may operate through **bonuses and variable pay** rather than base salary. Men with more outside options may receive larger bonuses, retention pay, or performance incentives — components not captured by `theoretical_liquid_salary`. This task decomposes total compensation into base salary and bonuses to see where the gender gap hides.

## Specific goal

For each `job_id` in Chile, pull:
1. **Net salary** from `shared_adm_salary` — actual take-home pay per period
2. **Bonus/variable components** from `shared_adm_assign` — individual line items (bonuses, commissions, allowances)

Then:
- Compare net salary vs theoretical salary by gender (is the gap in the variable component?)
- Decompose total compensation: base share vs bonus share, by gender
- At job transitions: compare changes in net salary and bonuses separately by gender
- Test: do men get bigger bonus bumps at transitions even though base salary bumps are equal?

## Data sources

| Table | Size | Key columns | Environment |
|-------|------|-------------|-------------|
| `shared_adm_salary` | Large | `job_id`, `employee_id`, net salary fields | Databricks (PySpark) |
| `shared_adm_assign` | Very large | `job_id`, `employee_id`, assignment type, amount | Databricks (PySpark) |
| `shared_adm_job` | 7.4 GB | `job_id`, `employee_id`, `start_date`, `theoretical_liquid_salary` | Cached CSV or Databricks |

## Compute environment

**Databricks (PySpark)** — both `shared_adm_salary` and `shared_adm_assign` are too large for local CSV processing.

## Status

`planned`

## Action log

| Date | Action | Notes |
|---|---|---|

## Outcome

_TBD_
