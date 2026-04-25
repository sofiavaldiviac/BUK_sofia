# Task: Plot 1.2 — Job Spell Duration Distribution by Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_05` |
| **Title** | Plot distribution of job spell duration by gender |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None (computed directly from `shared_adm_job`) |

## Motivation

Longer job spells for women are consistent with fewer outside options: if women receive fewer competing offers, they stay at their current employer longer. This complements the J2J transition rate by showing the full duration distribution rather than just the transition margin.

## Specific goal

Produce three plots of job spell duration/count by gender:
- **Spell = each `job_id`** (not consolidated tenure). One employee can have multiple job_ids at the same employer.
- Duration = `end_date - start_date` per job_id

### Plot A: Completed spells histogram
- X-axis: spell duration (months, 3-month bins, capped at 48)
- Y-axis: density
- Overlapping histograms: Female vs Male, with mean lines
- Only completed spells (have `end_date`)

### Plot B: Kaplan-Meier survival curves
- All spells, ongoing censored at panel end (2026-04)
- X-axis: months since spell start
- Y-axis: % still in same job
- Median survival marked

### Plot C: Number of distinct jobs per employee (bonus)
- Grouped bar chart: number of job_ids per employee, by gender
- Shows within-employer role mobility

## Success criteria

- [x] Distribution clearly shows male vs. female comparison
- [x] Mean and median spell duration reported by gender
- [x] Right-censoring handled correctly (KM plot)
- [x] Saved to `1_Code/figures/`
- [x] Bonus: jobs-per-employee plot

## Inputs / relevant files

- `shared_adm_job` — job records with `job_id`, `start_date`, `end_date` (cached CSV)
- `shared_core_employee` — gender (cached CSV)
- `shared_core_rsch_company` — country filter (cached CSV)

## Branch used

_TBD_

## Compute environment used

Databricks (PySpark/Python)

## Compute environment used

Local (Python, cached CSVs from Dropbox)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Added Plot 1.2 to `reducedform_admin.py` | Uses cached CSVs. Each job_id = one spell. 8.2M spells (Chile), 86.9% completed. |
| 2026-04-24 | Generated 3 plots | `rf_1_2_spell_duration_completed.png`, `rf_1_2_spell_duration_km.png`, `rf_1_2b_jobs_per_employee.png` |

## Outcome

**Plot A (completed spells histogram):** Female mean 6.5 mo, Male mean 7.2 mo. Both median 2.0 mo. Heavy right-skew — most spells are short. Men stay slightly longer per spell.

**Plot B (KM survival):** Includes all 8.2M spells with 1.1M right-censored. Shows survival curves accounting for ongoing jobs.

**Plot C (jobs per employee):** Female mean 7.79 jobs, Male mean 6.96 jobs. Women have more distinct job_ids within the same employer, suggesting more role transitions.

Trust: high — N=8.2M spells, overall completion rate 86.9% consistent with 13.6% missing end_date.

## Next recommended step

Proceed to `issue2_06` (Plot 1.3: separation rates).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
