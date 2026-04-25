# Task: Plot 3.4 — Entry Wage by Gender at Hire

| Field | Value |
|---|---|
| **Task ID** | `issue2_19` |
| **Title** | Plot entry wage by gender at hire, with HHI variant |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_02` (HHI construction, for variant) |

## Motivation

The entry wage captures the firm's initial offer to new hires. A gender gap at entry, before any tenure or promotion dynamics, points to differential screening or bargaining power at the hiring stage. Interacting with HHI tests whether concentrated markets amplify this gap.

## Specific goal

Produce two plots:

**Main plot:** Distribution or bar chart of first salary in spell by gender
- First observed salary per employee-tenant spell from `shared_adm_salary`
- Box plot or density by gender
- Report median entry wage by gender, raw gap

**Variant:** Entry wage gap by HHI tercile
- Merge HHI tercile from `issue2_02` output
- Grouped bars: median entry wage by gender x HHI tercile
- Does the entry wage gap widen in concentrated markets?

Filter to Chile.

## Success criteria

- [ ] Entry wage correctly defined (first salary in spell)
- [ ] Main plot: clear gender comparison
- [ ] Variant: HHI interaction shown
- [ ] Chile filter applied
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- `shared_adm_salary` — salary records (Databricks)
- `shared_adm_job` — spell start dates (Databricks)
- `shared_core_rsch_employee` — gender (Databricks)
- Output of `issue2_02` (HHI terciles)

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

Proceed to `issue2_20` (Plot 3.5: salary range in vacancies).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
