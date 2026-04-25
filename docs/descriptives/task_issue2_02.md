# Task: Compute HHI by Occupation x Region

| Field | Value |
|---|---|
| **Task ID** | `issue2_02` |
| **Title** | Compute Herfindahl-Hirschman Index by occupation x region cell |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

HHI is the core measure of labor market concentration in the paper. Six downstream plots (2.4, 2.5, 3.2, 3.4, 4.3, 4.4) need HHI values to split samples by market power. Computing HHI once ensures a consistent definition and avoids redundant processing of large tables.

## Specific goal

Compute HHI for each occupation x region cell in Chile:
1. Filter `shared_adm_job` to Chile (`country == 'CL'`)
2. Define occupation cells. Primary: `role_name_category` or `standard_role_name`. If these are still null, use a fallback (e.g., `job_title` text clustering or `category_area` from recruitment data). Document the choice.
3. Define region from worker/firm location fields
4. For each occupation x region cell: compute employment share per `tenant_id`, square shares, sum to get HHI
5. Assign HHI terciles (low/medium/high concentration)
6. Create a mapping: `tenant_id` x occupation x region -> HHI value and tercile
7. Save as intermediate dataset (parquet)

## Success criteria

- [x] HHI computed for all occupation x region cells with sufficient observations
- [x] Occupation classification documented (which column used, fallback if needed)
- [x] Distribution of HHI values reported (min, P25, median, P75, max)
- [x] Tercile cutoffs documented
- [x] Intermediate dataset saved and documented

## Inputs / relevant files

- `shared_adm_job` — employment records (Databricks)
- `shared_core_rsch_company` — firm location (Databricks)
- `2_Writeup/descriptives/model_framework_monopsony.md` — HHI definition reference
- Following Azar, Marinescu & Steinbaum (2022) methodology

## Scope boundaries

- DO: Filter to Chile first
- DO: Use `tenant_id` (not `company_id`)
- DO: Document which occupation column is used and why
- DO NOT: Create plots (data construction only)
- DO NOT: Assume `role_name_category` is populated without checking

## Branch used

`main`

## Compute environment used

Local (Python, cached CSVs from Dropbox)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Checked field availability | `role_name_category` 69.4% populated; `category_area` 80.8%; `region` in company table 98.8% (99.8% after SII fallback) |
| 2026-04-24 | Created `compute_hhi.py` | New script in `1_Code/descriptives/`. Computes both employment-based and vacancy-based HHI. |
| 2026-04-24 | Ran script, produced outputs | `hhi_employment.parquet` (1,017 cells, 2.85M obs), `hhi_vacancy.parquet` (618 cells, 159K vacancies) |

## Outcome

**Two HHI measures computed for Chilean labor markets (occupation x region cells).**

**Occupation classification:** `category_area` (8 functional areas) used as primary, with `role_name_category` filling where available. Both map to the same taxonomy: Medical/Health, Education, Finance & Administration, Marketing & Sales, Operations, HR, Customer Service, IT. Combined coverage: 80.8% of Chilean job spells.

**Region:** `region` from `shared_core_rsch_company` (firm-level, linked via `tenant_id`). 99.8% coverage after SII fallback. 16 Chilean administrative regions; 74% of tenants in Santiago Metropolitana.

**Employment-based HHI (1,017 cells, 2.85M worker-year obs):**
- Employment-weighted mean: 565 (moderately competitive)
- Unweighted: P25=691, median=1,713, P75=3,135
- Santiago: 121 vs Rest: 1,497 (expected pattern)
- Terciles: Low (HHI 23-35, 16 cells, 916K workers), Medium (37-390, 99 cells, 974K workers), High (391-10,000, 902 cells, 961K workers)

**Vacancy-based HHI (618 cells, 159K vacancies):**
- Vacancy-weighted mean: 2,379 (more concentrated — fewer firms post vacancies)
- Unweighted: P25=3,253, median=5,612, P75=10,000
- Santiago: 1,098 vs Rest: 4,829
- Terciles: Low (147-596, 21 cells, 53K vac), Medium (607-2,654, 102 cells, 52K vac), High (2,658-10,000, 495 cells, 54K vac)

**Cross-validation:** Correlation between employment and vacancy HHI = 0.452 (moderate positive).

Trust: medium — HHI computed among BUK client firms only, not all Chilean employers. The 8-area occupation taxonomy is coarse (finer classifications null). Region is firm-level, not worker residence.

## Next recommended step

Tasks `issue2_14`, `issue2_15`, `issue2_17`, `issue2_19`, `issue2_23`, `issue2_24` are now unblocked.

## Next recommended step

After completing this task, tasks `issue2_14`, `issue2_15`, `issue2_17`, `issue2_19`, `issue2_23`, `issue2_24` are unblocked.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
