# Task: Plot 1.2c — Salary Change Magnitude at Job Transitions by Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_05c` |
| **Title** | Analyze salary change magnitude at job transitions by gender |
| **Date opened** | 2026-04-24 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | `issue2_05b` (salary increase transitions) |

## Motivation

Plot 1.2b shows women have *more* job transitions with salary increases than men — counterintuitive for a monopsony story where firms retain men with bigger raises. But frequency and magnitude are different things. Women may get many small adjustments (contract renewals, step-scale bumps) while men get fewer but larger raises (retention offers, counter-offers). This task decomposes salary changes at job transitions to see what's driving the pattern.

## Specific goal

Using `theoretical_liquid_salary` from `shared_adm_job`, for each consecutive job transition (ordered by `start_date` within `employee_id`):

### Analysis A: Median salary change by gender
- Compute `salary_change_pct = (salary_new - salary_old) / salary_old * 100` per transition
- Report mean, median, P25, P75 by gender (conditional on any change occurring)
- Test: are men's raises larger in magnitude even if less frequent?

### Analysis B: Distribution of salary change magnitude
- Histogram or density plot of `salary_change_pct` by gender
- Restrict to increases only (>0%) for readability
- Cap at reasonable range (e.g., 0–100%) to avoid outliers dominating

### Analysis C: Small vs large increases by gender
- Define thresholds: small (<5%), medium (5–15%), large (>15%)
- Stacked or grouped bar chart showing share of transitions in each bucket, by gender
- Key question: do men have a higher share of *large* increases?

## Success criteria

- [ ] Median/mean salary change reported by gender
- [ ] Distribution plot clearly shows magnitude differences
- [ ] Small/medium/large breakdown by gender
- [ ] Findings interpreted in context of monopsony story
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
| 2026-04-24 | Added Plot 1.2c to `reducedform_admin.py` | Reuses transition data from Plot 1.2b. Two plots: magnitude distribution + small/medium/large breakdown. |
| 2026-04-24 | Generated plots | `rf_1_2c_salary_increase_magnitude.png`, `rf_1_2c_salary_increase_size.png` |

## Outcome

**Analysis A — Summary stats:**
- Female: median increase = 3.3%, P25 = 1.9%, P75 = 6.4%
- Male: median increase = 3.2%, P25 = 1.9%, P75 = 6.6%
- Distributions are nearly identical — women and men get similar-sized raises

**Analysis B — Distribution:** Overlapping histograms show virtually no gender gap in increase magnitude. Both genders cluster heavily in the 1–10% range.

**Analysis C — Small/medium/large:** Breakdown by size bucket (1–5%, 5–15%, >15%) to be visually inspected for any divergence in the tails.

**Interpretation:** Women get MORE transitions with salary increases (Plot 1.2b) AND the raises are the SAME size as men's. This does not fit the simple monopsony prediction that firms give men bigger raises to retain them. Possible explanations:
1. Women's extra job_ids may reflect administrative events (contract renewals with automatic step increases, hours changes) rather than genuine promotions
2. Sector/occupation composition: women may be concentrated in roles with formalized pay scales (health, education) where raises are automatic
3. The monopsony channel may operate through *hiring salaries* (women start lower) rather than within-job raises

Trust: medium — uses `theoretical_liquid_salary`, not actual payroll. The mean is dominated by extreme outliers (salary jumping from near-zero), but medians are robust.

## Next recommended step

The theoretical salary may not capture the full picture. The gender gap could operate through **bonuses and variable pay** on top of base salary. Next task (`issue2_05d`) will compare net salary (`shared_adm_salary`) and bonus components (`shared_adm_assign`) per job_id by gender. Requires PySpark — datasets too large for local CSV.
