# Task: Plot 4.5 — Share of Women in Supervisory Roles Over Time

| Field | Value |
|---|---|
| **Task ID** | `issue2_25` |
| **Title** | Plot share of women in supervisory roles over time |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

The share of women in boss roles is an aggregate outcome of the promotion process. Tracking it over time shows whether the gender gap at the top is closing, stable, or widening, and whether reforms (Ley 21.561, Ley 21.645) coincide with any change.

## Specific goal

Produce a line chart of the monthly share of supervisors who are female, using **two approaches**:

### Approach A: `is_boss` flag (done)
- Use `is_boss == True` from `shared_core_employee` (note: field is in employee table, not job table)
- This is a **current snapshot** — not time-varying. The time series tracks job activity of people *currently* flagged as bosses, not who was a boss at each point in time.
- Merge with `shared_adm_job` start/end dates for temporal coverage
- Caveat: edge-effect at end of panel (last months show identical N because active jobs extend forward). Trim to last complete month.

### Approach B: `boss_id` from job table (TODO)
- In `shared_adm_job`, each job record has a `boss_id` field (the employee_id of the worker's supervisor)
- For each month, collect all unique `boss_id` values from active jobs → these are the people functioning as bosses that month
- Merge gender from `shared_core_employee` via employee_id = boss_id
- This gives a **genuinely time-varying** measure: who is actually supervising someone each month
- More complex to implement but more trustworthy for the time series

### Common specs
- X-axis: calendar month (2022-2026)
- Y-axis: share female among supervisors
- Overlay reform dates as vertical lines
- Filter to Chile

## Success criteria

- [x] `is_boss` field correctly used (check population rate) — 717K bosses, 14.3% of Chile employees
- [x] Monthly time series with clear trend (Approach A)
- [x] Reform dates marked
- [x] Chile filter applied
- [x] Saved to `1_Code/figures/`
- [ ] Approach B (`boss_id`) implemented and compared to Approach A

## Inputs / relevant files

- `shared_core_employee` — `is_boss` flag + gender (cached CSV)
- `shared_adm_job` — job records with `boss_id` field + start/end dates (cached CSV, 7.4 GB)
- `shared_core_rsch_company` — country filter (cached CSV)

## Branch used

_TBD_

## Compute environment used

Databricks (PySpark/Python)

## Status

`partial` — Approach A done, Approach B (boss_id) TODO

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Added Plot 4.5 to `reducedform_admin.py` | Uses cached CSVs. is_boss from employee table + job start/end dates for monthly panel. |
| 2026-04-23 | Generated `rf_4_5_female_boss_share.png` | Monthly time series 2022-01 to 2026-06. Reform dates overlaid. |

## Outcome

**Approach A (is_boss):** Plot saved to `1_Code/figures/rf_4_5_female_boss_share.png`. Female boss share stable ~38% (2022–2023), declined to ~37% (2025). Last months show edge-effect (identical N) because is_boss is a snapshot — should trim. Trust: medium. Next: implement Approach B (boss_id) for a true time-varying measure.

## Next recommended step

Proceed to `issue2_26` (Plot 4.6: promotion rate by gender x firm size).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
