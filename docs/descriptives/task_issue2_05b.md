# Task: Plot 1.2b — Job Transitions with Salary Increases by Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_05b` |
| **Title** | Count job transitions that come with a salary increase, by gender |
| **Date opened** | 2026-04-24 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_05` (spell duration / jobs per worker) |

## Motivation

Plot 1.2b shows that women have more distinct `job_id`s per employer than men. But role changes without a pay increase (lateral moves, title changes) are not the same as promotions. This task checks how many of those job transitions actually come with a salary bump.

## Specific goal

For each worker, order their job_ids chronologically and compare salary across consecutive jobs. Count how many transitions involve a salary increase.

- **Salary source**: `theoretical_liquid_salary` in `shared_adm_job` (available per job record). If this field is too sparse, fall back to a cached `shared_adm_salary` table (not currently cached — may need download from Databricks).
- **Transition**: consecutive job_ids for the same `employee_id`, ordered by `start_date`
- **Salary increase**: salary in job N+1 > salary in job N (use a threshold, e.g., >1% increase, to filter out rounding noise)

### Plot

Grouped bar chart by gender:
- X-axis: number of job transitions with a salary increase (0, 1, 2, 3, 4+)
- Y-axis: share of workers (%)
- Compare to Plot 1.2b (all job transitions) to see what fraction of role changes are "real" moves

### Summary stats

- Mean and median salary-increase transitions by gender
- % of all transitions that come with a salary increase, by gender

## Success criteria

- [ ] `theoretical_liquid_salary` coverage checked (if too sparse, flag as blocked pending salary table download)
- [ ] Salary increase defined with a reasonable threshold
- [ ] Grouped bar chart produced by gender
- [ ] Comparison to total job transitions noted
- [ ] Saved to `1_Code/figures/`

## Inputs / relevant files

- `shared_adm_job` — `job_id`, `employee_id`, `start_date`, `theoretical_liquid_salary`, `country` (cached CSV)
- `shared_core_employee` — gender (cached CSV)
- `shared_core_rsch_company` — country filter (cached CSV)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Checked `theoretical_liquid_salary` coverage | 100% populated, 94.7% non-zero in Chile. No need for separate salary table. |
| 2026-04-24 | Added Plot 1.2b to `reducedform_admin.py` | Uses same job table load as Plot 1.2 (added salary column to usecols). |
| 2026-04-24 | Generated `rf_1_2b_salary_increase_transitions.png` | 6.8M transitions, 40.3% come with >1% salary increase. |

## Outcome

**Key findings:**
- 40.3% of all job transitions come with a salary increase (>1%)
- Female: mean 3.48 salary-increase transitions, 80.6% of women had at least one
- Male: mean 2.84 salary-increase transitions, 73.5% of men had at least one
- Women have more salary-increase transitions than men — consistent with Plot 1.2b showing more total job_ids for women, and a higher fraction of those transitions are "real" moves with pay bumps

Trust: medium — uses `theoretical_liquid_salary` (theoretical, not actual payroll). A future pass with actual salary data would strengthen this.

## Next recommended step

Consider comparing salary *magnitude* of increases by gender (are women's raises smaller even when they get one?).
