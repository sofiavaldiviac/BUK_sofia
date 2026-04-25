# Task: Plot 1.4 — Distinct Employers per Worker by Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_07` |
| **Title** | Plot number of distinct employers per worker by gender |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_01` (job spells) |

## Motivation

The number of distinct employers a worker has held is a cumulative measure of labor market mobility. Fewer employers for women over the same time horizon reinforces the lower outside-option story and rules out composition effects from shorter careers.

## Specific goal

Produce a histogram or density plot of distinct employers per worker, by gender:
- Count unique `tenant_id` per `employee_id` across the sample period
- X-axis: number of distinct employers (1, 2, 3, ...)
- Y-axis: share of workers
- Two distributions: male vs. female
- Report mean and median by gender

## Success criteria

- [ ] Distribution clearly shows male vs. female comparison
- [ ] Mean and median distinct employers reported by gender
- [ ] Conditional on sample period length (workers observed for at least X months)
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- Output of `issue2_01` (job spell dataset with `n_employers`)

## Branch used

_TBD_

## Compute environment used

Databricks (PySpark/Python)

## Status

`blocked`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Attempted implementation in `reducedform_admin.py` | Loaded `shared_adm_job.csv` (8.3M Chile records), counted unique `tenant_id` per `employee_id`. Result: every worker has exactly 1 employer. |
| 2026-04-23 | Diagnosed data limitation | `employee_id` is tenant-specific in BUK — the same person at two different companies gets two different `employee_id` values. No universal person identifier (e.g., RUT) exists in the current data export. |
| 2026-04-23 | Checked `company_id` alternative | ~2.8% of workers have multiple `company_id` within a tenant (intra-group subsidiary mobility), but `company_id` is 69.5% missing. Not a viable alternative. |
| 2026-04-23 | Marked as blocked, deleted uninformative plot | |

## Blocking issue

**No cross-tenant person identifier.** BUK assigns `employee_id` per tenant (company). A worker who leaves Company A and joins Company B gets a new `employee_id` at Company B. Without a universal person ID (like RUT/national ID) linking records across tenants, cross-employer mobility cannot be measured.

This also blocks `issue2_01` (job spell construction) which assumed `n_employers = distinct tenant_id per employee_id`.

### Possible resolutions

1. **Request RUT or hashed person ID** from BUK in a future data export
2. **Probabilistic matching** on (gender, year_of_birth, start_contract) across tenants — noisy, not recommended
3. **Redefine the plot** to measure intra-group mobility (`company_id` within tenant) — but 69.5% of records are missing `company_id`

## Outcome

Blocked — cannot produce this plot with current data. The plot requires a cross-tenant person identifier that does not exist in the BUK data export.

## Next recommended step

Proceed to `issue2_08` (Plot 1.5: turnover intention, survey) — this task does not depend on issue2_01.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
