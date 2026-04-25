# Task: Data Section — Administrative BUK Evidence

| Field | Value |
|---|---|
| **Task ID** | `issue1_03` |
| **Title** | Write the data section covering administrative BUK platform data |
| **Date opened** | 2026-04-22 |
| **GitHub Issue** | [#1 — Draft paper proposal](https://github.com/sofiavaldiviac/BUK_sofia/issues/1) |

## Motivation

The administrative data from BUK is the core empirical asset of the paper. The data section must clearly describe the data structure, coverage, key variables, and summary statistics so the reader understands what the analysis can (and cannot) do.

## Specific goal

**Note:** A Setting section (Section 2 of the paper) was added before the data section on 2026-04-22, covering Chile's participation/wage puzzle, labor market structure, and the three policy reforms (Ley 21.561, Ley 21.645, Art. 203). Several placeholders remain to be filled in (CASEN/INE statistics, reform implementation dates, HHI range, Art. 203 details). This task covers the Data section that follows.

Write a 2–3 page data description covering:
1. **Platform overview** — BUK as HR platform, 19K+ firms, 4.7M workers, 2022–2026
2. **Data structure** — worker-month panel with firm, occupation, supervisor identifiers; the HR pipeline (hiring → contracts → payroll → promotions → separations)
3. **Firm characteristics** — size distribution (large/medium/small), sector coverage, SII linkage
4. **Worker and job characteristics** — gender split (62.8% M / 37.2% F), job spells, hierarchy (boss_id), wages (base/gross/net), contract types, separation coverage
5. **Recruitment data** — 186K selection processes, 2.7M applications, application-to-hire pipeline, referral sources, selectivity distribution
6. **Summary statistics tables** — firms, workers/jobs, recruitment (from slides 5–7)
7. **Data quality notes** — known issues (missing company_id, is_parent coverage, etc.)

## Success criteria

- [ ] All key data dimensions described with counts and coverage rates
- [ ] Summary statistics tables included (can be refined later with exact numbers)
- [ ] HR pipeline clearly explained — reader understands what is observed at each stage
- [ ] Data limitations honestly stated
- [ ] Links each data component to the empirical strategy (e.g., recruitment data → screening threshold, boss_id → promotion measurement)

## Inputs / relevant files

- `2_Writeup/slides/main.tex` — slides 4–7 (BUK data, firm stats, worker stats, recruitment stats)
- Existing summary statistics code in `4_Code/descriptives/` and `4_Code/summary_stats_salary.py`
- Memory: data quality findings (69.5% missing company_id, 89.9% missing is_parent)

## Branch used

_TBD_

## Compute environment used

_TBD_ (may need Databricks for updated counts)

## Status

`in progress`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | First draft written | Added data section to `2_Writeup/paper/main.tex`. Six subsections: platform overview, data structure (5-step pipeline), firms (table), workers/jobs (table), recruitment (table), sample selection (size/sector comparison vs SII, platform growth, implications). Placeholders for: employee-job match rate for Chile, additional selection checks (gender, wages, geography, occupations). |

## Outcome

First draft of data section (administrative) written in `2_Writeup/paper/main.tex`. Includes 4 tables (firms, workers, recruitment, BUK vs SII size, BUK vs SII sector). Selection section is transparent about large-firm skew, sector imbalances, and platform growth. Multiple placeholders flagged for follow-up. Ready for iteration.

## Next recommended step

After completing this task, proceed to Task `issue1_04` (Data: survey evidence).

**Important:** After completing this task, post a comment on [Issue #1](https://github.com/sofiavaldiviac/BUK_sofia/issues/1) summarizing what was done.
