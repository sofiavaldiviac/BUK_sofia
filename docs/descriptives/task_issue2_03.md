# Task: Define and Flag Promotion Events

| Field | Value |
|---|---|
| **Task ID** | `issue2_03` |
| **Title** | Define promotion events from admin data |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

Six Section 4 plots (4.1-4.6) require a consistent definition of promotion events. The definition is non-trivial: Issue #2 specifies two possible approaches (role title change vs. `is_boss` transition), and data quality issues (potentially null occupation columns) require investigation before downstream tasks can proceed.

## Specific goal

Build a promotion-event dataset for Chile:
1. Filter `shared_adm_job` to Chile (`country == 'CL'`)
2. Investigate column availability: check `standard_role_name`, `role_name_category`, `is_boss` population rates
3. Define promotion as:
   - Primary: change in `standard_role_name` or `role_name_category` within same `tenant_id` (if populated)
   - Secondary: transition from `is_boss == False` to `is_boss == True` within same `tenant_id`
   - Document which definition is used and why
4. Merge gender from `shared_core_rsch_employee`
5. Merge pre- and post-promotion salary from `shared_adm_salary`
6. Output columns: `employee_id`, `tenant_id`, `gender`, `promotion_date`, `promotion_type`, `from_role`, `to_role`, `pre_salary`, `post_salary`, `tenure_at_promotion`
7. Save as intermediate dataset (parquet)

## Success criteria

- [x] Promotion definition documented with justification
- [x] Column availability reported (population rates for role columns and `is_boss`)
- [x] Promotion events flagged with correct dates
- [x] Salary change at promotion computed
- [ ] Enrich with actual base_salary from `shared_adm_salary` via PySpark (future)
- [x] Intermediate dataset saved and documented

## Inputs / relevant files

- `shared_adm_job` — job records with role and boss fields (Databricks)
- `shared_adm_salary` — salary records (Databricks)
- `shared_core_rsch_employee` — gender lookup (Databricks)
- `4_Code/summary_stats_salary.py` — PySpark pattern for loading large tables

## Scope boundaries

- DO: Filter to Chile first
- DO: Use `tenant_id` (not `company_id`)
- DO: Check column population before assuming a definition
- DO NOT: Create plots (data construction only)

## Branch used

`main`

## Compute environment used

Local (Python, cached CSVs) — first pass. PySpark needed for `shared_adm_salary` enrichment (future).

## Status

`done` (first pass — theoretical salary only)

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Ran exploration diagnostics | `explore_promotions.py` — checked coverage of role_id (100%), role_name (100%), boss_id (99.8%), role_name_category (69.4%), area_name_category (49.3%). `is_boss` is fully static (0 temporal variation). |
| 2026-04-24 | Tested 8 candidate definitions | Def C (role ID change + salary >5%) selected: 84.6K events, 3.4% annual rate, median 20% salary increase. |
| 2026-04-24 | Built promotion parquet | `compute_promotions.py` → `promotions.parquet` (84,597 events, 74,207 unique employees) |

## Outcome

**Promotion definition: role_id change + theoretical_liquid_salary increase >5%, within same tenant_id.**

**Exploration findings (field coverage):**
- `role_id`, `role_name`: 100% populated — primary promotion signal
- `boss_id`: 99.8% — boss changes independent of role changes (only 7.9% overlap)
- `role_name_category`: 69.4% — too coarse (only 0.5% of transitions involve category change)
- `is_boss` in employee table: fully static (0 employees with temporal variation) — useless for promotion timing

**Why Definition C:** 8 definitions tested. Salary >5% alone fires too often (34%/year — captures routine adjustments). Role ID change alone has near-zero median salary bump (0.4%), suggesting many administrative changes. Definition C (role change + salary bump) gives a plausible 3.4% annual rate with meaningful median salary increase of 20%.

**84,597 promotion events (Chile, 2017–2026):**
- 74,207 unique employees promoted
- Gender split: 41.8% female, 58.2% male
- Annual rate: Female 3.28%, Male 3.43% (men promoted slightly more often)
- Median salary increase at promotion: 20.0% (P25=11.7%, P75=37.2%)
- Median tenure before promotion: 2.0 months (P75=5.0) — many happen quickly after a role change
- 74% of promotions stay within the same role_name_category (functional area)

Trust: medium — uses `theoretical_liquid_salary` (contractual), not actual payroll. The 20% median raise is plausible for real promotions but some extreme outliers exist (mean skewed by rare huge jumps). Needs validation with actual `base_salary` from `shared_adm_salary` via PySpark.

## Remaining work

**Must do:** Enrich with actual `base_salary` from `shared_adm_salary` via PySpark on Databricks. The theoretical salary may not capture the full compensation change. Compare theoretical vs actual salary changes at promotion.

## Next recommended step

Tasks `issue2_21` through `issue2_26` (Section 4 plots) are now unblocked with this first-pass dataset. The PySpark enrichment can happen in parallel.

## Next recommended step

After completing this task, tasks `issue2_21` through `issue2_26` (Section 4 plots) are unblocked.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
