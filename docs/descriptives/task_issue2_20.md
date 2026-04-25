# Task: Plot 3.5 — Salary Range in Vacancies by Functional Area and Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_20` |
| **Title** | Plot salary range offered in vacancies by functional area and gender composition of hires |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

If vacancies that end up hiring women offer lower salary ranges than those hiring men (within the same functional area), it suggests that gender sorting begins at the job posting stage, not just at the offer stage.

## Specific goal

Produce a plot showing salary ranges offered in vacancies, split by the gender composition of eventual hires:
- Use `do_recruitment` salary range fields (min/max salary if available)
- Group by `category_area`
- Split by whether the vacancy ultimately hired a man or woman (from `do_application` hire outcome + `do_candidate` gender)
- Visualize as paired box plots or bar chart per functional area
- Filter to Chile

## Success criteria

- [x] Salary range fields correctly identified (`min_salary`, `max_salary`)
- [ ] Gender of eventual hire linked (deferred — hire outcome not yet available)
- [x] Comparison across functional areas
- [x] Chile filter applied
- [x] Saved to `1_Code/figures/`

## Inputs / relevant files

- `shared_recruitment` — vacancy data with `min_salary`, `max_salary`, `category_area` (cached CSV)

## Compute environment used

Local (Python, cached CSVs)

## Status

`done` (first pass — without gender of hire)

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Checked salary coverage | `min_salary` 28.6%, `max_salary` 38.9%, both 25.6% (Chile). 43K vacancies with both fields + area. |
| 2026-04-24 | Added Plot 3.5 to `reducedform_admin.py` | Box plot of midpoint salary by functional area. Uses existing recruitment data load. |
| 2026-04-24 | Generated plots | `rf_3_5_salary_range_by_area.png` (Chile), `rf_all_3_5_salary_range_by_area.png` (all countries) |
| 2026-04-24 | Added Plot 3.5b | Female applicant share by vacancy salary bin. Clear downward slope: higher salary → fewer women applying. |

## Outcome

Box plot of salary midpoint by functional area (Chile, N=43K vacancies). IT and Finance & Administration have the highest median salaries. Medical/Health, Education, and Customer Service have the lowest. Operations has the most vacancies (18K) with mid-range salary.

Trust: medium — only 26% of vacancies have salary range populated, so the sample may not be representative. Gender split deferred to a future pass when hire outcome data is linked.

## Next recommended step

Link gender of eventual hire to see if vacancies that hire women offer lower salary ranges within the same area.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
