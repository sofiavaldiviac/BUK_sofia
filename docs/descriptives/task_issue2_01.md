# Task: Construct Job Spells and Transition Events

| Field | Value |
|---|---|
| **Task ID** | `issue2_01` |
| **Title** | Construct job spells and transition events from admin data |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

Multiple Section 1 plots (1.1 job-to-job transitions, 1.2 spell duration, 1.3 separation rates, 1.4 distinct employers) require a cleaned spell-level dataset derived from `shared_adm_job`. Constructing spells once avoids redundant work and ensures consistent definitions across downstream tasks.

## Specific goal

Build a spell-level dataset for Chile with the following columns:
- `employee_id`, `tenant_id`, `gender` (from `shared_core_rsch_employee`)
- `spell_start`, `spell_end`, `spell_duration_months`
- `exit_reason` (voluntary vs. involuntary, from separation fields if available)
- `next_spell_start`, `j2j_transition` (boolean: moved to a different `tenant_id` within 1-3 months)
- `n_employers` (running count of distinct `tenant_id` per `employee_id`)

Steps:
1. Filter `shared_adm_job` to Chile (`country == 'CL'`)
2. Merge gender from `shared_core_rsch_employee` via `employee_id`
3. Define spell boundaries (start/end dates per employee-tenant pair)
4. Handle overlapping records and multiple jobs
5. Compute derived fields (duration, J2J flag, employer count)
6. Save as intermediate dataset (parquet)

## Success criteria

- [ ] Spell dataset created with all columns listed above
- [ ] Chile filter applied as first operation
- [ ] Gender successfully merged (report merge rate)
- [ ] J2J transition defined consistently (1-3 month window between spells at different firms)
- [ ] Intermediate dataset saved and documented

## Inputs / relevant files

- `shared_adm_job` — raw job records (Databricks)
- `shared_core_rsch_employee` — gender lookup (Databricks)
- `4_Code/summary_stats_salary.py` — PySpark pattern for loading large tables

## Scope boundaries

- DO: Filter to Chile first, then other dimensions
- DO: Use `tenant_id` (not `company_id`, which is 69.5% missing)
- DO NOT: Create plots (this is a data construction task only)

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

After completing this task, tasks `issue2_04` through `issue2_07` (Section 1 admin plots) are unblocked.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
