# HHI Construction: Full Methodology

Code: `1_Code/descriptives/compute_hhi.py`
Output: `1_Code/data/intermediate/hhi_employment.parquet`, `hhi_vacancy.parquet`, `hhi_diagnostics.txt`

## 1. Definition

For each market cell $m$:

$$\text{HHI}_m = \left(\sum_{f \in m} s_f^2 \right) \times 10{,}000$$

where $s_f = N_f / N_m$ is firm $f$'s share of the relevant count (employment or vacancies) in cell $m$. The scale is 0 to 10,000 (DOJ/FTC convention).

## 2. Two variants

### 2a. Employment-based HHI

| Element | Detail |
|---|---|
| **Unit of count** | Unique employee-firm pairs active on Dec 31 of each year (year-end snapshot) |
| **Market cell** | occupation x region x year |
| **Firm identifier** | `tenant_id` (BUK platform tenant) |
| **Occupation variable** | `role_name_category` from `shared_adm_job`, filled with `category_area` when missing. Translated to English using a fixed mapping (8 categories). Coverage after fill: 80.8% of Chile job rows. |
| **Region variable** | From `shared_core_rsch_company.region`, with SII fallback for missing tenants. Coverage: 99.8% of tenants. |
| **Years** | 2018-2025 (year-end snapshots) |
| **Deduplication** | One row per employee x tenant per snapshot (if a worker has multiple job_ids at the same firm, counted once) |
| **Rows dropped** | Null occupation or null region after merge |
| **Output columns** | `occupation_en`, `region`, `year`, `hhi`, `n_firms`, `n_workers`, `hhi_tercile` |

### 2b. Vacancy-based HHI

| Element | Detail |
|---|---|
| **Unit of count** | Unique `selection_id` (vacancy processes) per firm per year |
| **Market cell** | category_area x region x year |
| **Firm identifier** | `tenant_id` |
| **Occupation variable** | `category_area` from `shared_recruitment` (functional area of the vacancy). Translated to English (same 8-category mapping). Coverage: 85.3% of Chile recruitment rows. |
| **Region variable** | Same as employment-based (tenant region from company table) |
| **Years** | Derived from `created_date` of the vacancy |
| **Output columns** | `category_area_en`, `region`, `year`, `hhi`, `n_firms`, `n_vacancies`, `hhi_tercile` |

## 3. The 8 occupation categories

Both variants use the same taxonomy (translated from Spanish):

1. Finance & Administration
2. IT
3. Marketing & Sales
4. Operations
5. Human Resources
6. Customer Service
7. Medical / Health
8. Education / Academia

Source: BUK's `category_area` field. The employment-based measure uses `role_name_category` as primary (which maps to the same 8 categories) and falls back to `category_area`.

## 4. The 16 regions

Chile's administrative regions. Tenant-to-region mapping comes from `shared_core_rsch_company.region`. For the 1.2% of tenants missing this field, region is filled from `shared_core_sii.region_sii` (SII tax records, most recent year).

Region breakdown of tenants:
- Metropolitana (Santiago): 5,587 (74%)
- Valparaiso: 380
- Biobio: 297
- Los Lagos: 296
- Antofagasta: 204
- All others: <200 each
- Aysen: 18 (smallest)

## 5. Tercile assignment

Terciles are **employment-weighted** (or vacancy-weighted for the vacancy variant), not cell-count-weighted. The procedure:

1. Sort all cells by HHI ascending
2. Compute cumulative share of total employment (or vacancies)
3. Assign:
   - **Low**: cumulative share <= 1/3
   - **Medium**: 1/3 < cumulative share <= 2/3
   - **High**: cumulative share > 2/3

This means the terciles split the **workforce** (or vacancies) into three equal-sized groups, not the cells. Because most employment is in low-HHI Santiago cells, the Low tercile has very few cells but many workers.

### Employment-based tercile cutoffs

| Tercile | HHI range | N cells | N workers |
|---|---|---|---|
| Low | 23-35 | 16 | 915,669 |
| Medium | 37-390 | 99 | 974,343 |
| High | 391-10,000 | 902 | 960,647 |

**Note:** 902 of 1,017 cells are in the "High" tercile, but they account for only 1/3 of total employment. The Low tercile is just 16 cells (dominated by Santiago's large occupation-region markets) but covers 1/3 of all workers.

### Vacancy-based tercile cutoffs

| Tercile | HHI range | N cells | N vacancies |
|---|---|---|---|
| Low | 147-596 | 21 | 52,855 |
| Medium | 607-2,654 | 102 | 51,595 |
| High | 2,658-10,000 | 495 | 54,364 |

## 6. Distribution statistics

There are two ways to summarize the HHI distribution: **unweighted** (each cell counts equally) and **weighted** (each cell counts proportionally to its size). The weight is:

- **Employment-based:** $w_m = N_m / \sum_{m'} N_{m'}$, where $N_m$ is total employment (worker-year observations) in cell $m$. A cell with 100,000 workers counts 100x more than a cell with 1,000.
- **Vacancy-based:** $w_m = V_m / \sum_{m'} V_{m'}$, where $V_m$ is the number of vacancies in cell $m$.

The weighted mean is $\overline{\text{HHI}} = \sum_m w_m \cdot \text{HHI}_m$. Weighted percentiles are computed by sorting cells by HHI and finding the value where cumulative weight reaches the target quantile.

**Why the distinction matters:** The unweighted distribution describes the typical *market cell*. The weighted distribution describes the concentration level experienced by the typical *worker* (or vacancy). Because most workers are concentrated in a few large, competitive Santiago cells, the weighted distribution is much more left-skewed than the unweighted one.

### Employment-based (1,017 cells, 2.85M worker-year observations)

**Unweighted (each cell = 1):**
| Stat | Value |
|---|---|
| Mean | 2,449 |
| Std | 2,433 |
| Min | 23 |
| P25 | 691 |
| Median | 1,713 |
| P75 | 3,135 |
| Max | 10,000 |

**Employment-weighted:**
| Stat | Value |
|---|---|
| Mean | 565 |
| P25 | 34 |
| Median | 86 |
| P75 | 518 |

The gap between unweighted median (1,713) and weighted median (86) reflects that most workers are in competitive Santiago cells.

### Vacancy-based (618 cells, 158,814 vacancy observations)

**Unweighted (each cell = 1):**
| Stat | Value |
|---|---|
| Mean | 6,073 |
| Std | 3,264 |
| Min | 147 |
| Median | 5,612 |
| Max | 10,000 |

**Vacancy-weighted:**
| Stat | Value |
|---|---|
| Mean | 2,379 |
| Median | 1,343 |

Much more concentrated than employment-based: 28.5% of vacancy cells are monopoly (single firm posting).

### Cross-validation

- 526 cells appear in both measures
- Correlation between employment-based and vacancy-based HHI: **0.452**
- Santiago weighted mean: employment HHI = 121, vacancy HHI = 1,098
- Rest of Chile: employment HHI = 1,497, vacancy HHI = 4,829

## 7. How HHI is merged into downstream analyses

### Into promotion analysis (Plot 4.3)

1. Build year-end snapshots (Dec 31) of active workers for 2020-2025 (earlier years dropped due to near-zero promotion rates from platform ramp-up)
2. Each worker gets `(occupation_en, region, year)` from their job record
3. Merge worker to HHI table on `(occupation_en, region, year)` to get `hhi_tercile`
4. Workers missing occupation or region are dropped (not assigned a tercile)
5. Promotion events are matched to the worker's tercile via `(employee_id, tenant_id, year)`
6. Rate = promotions / person-years within each (tercile, gender) cell

### Into entry wage analysis

Same logic: worker's `(occupation_en, region, year)` determines their HHI cell and tercile.

## 8. Known limitations and caveats

### BUK-only sample
HHI is computed using only BUK firms. BUK covers ~7,500 tenants (after dedup), not the universe of Chilean employers. This means:
- True HHI is likely **lower** (more competitive) than measured, since non-BUK firms are missing from the denominator
- The bias is larger in markets where BUK penetration is lower (e.g., construction, public sector)
- In markets where BUK captures most employers, the measure is more accurate

### Coarse occupation taxonomy
Only 8 functional areas. Two workers in "Finance & Administration" could be in very different occupations (accountant vs. CFO). Finer occupation codes would produce more concentrated cells.

### Region as market boundary
Uses Chile's 16 administrative regions as the geographic boundary. This assumes workers search within their region. Problems:
- Santiago (Metropolitana) is a huge, diverse labor market; within-Santiago variation is lost
- Commuting across adjacent regions is possible but not captured
- Sharma (2023) argues that administrative boundaries may not correspond to actual labor market boundaries; structural labor supply elasticity methods would be more appropriate

### Single-region firms
Each tenant is assigned a single region (headquarters). Multi-establishment firms that operate across regions are assigned to one region only. This could:
- Overstate concentration in the HQ region
- Understate concentration in satellite regions

### Occupation assignment
20% of job rows have no occupation after filling. These workers are excluded from HHI computation entirely.

### Year-end snapshot timing
Dec 31 snapshot captures stock, not flow. Workers who joined and left within the year are not counted. This makes the HHI a measure of "established employment" concentration.

## 9. Planned improvements

1. **Structural labor supply elasticity** following Sharma (2023): estimate firm-level labor supply elasticities directly, which captures market power beyond what HHI reflects
2. **Commuting-based market definitions** following Schubert, Stansbury, and Taska (2024): define markets using commuting zones rather than administrative regions
3. **Finer occupation codes**: if available in future BUK data exports, use more granular role categories
4. **Multi-establishment adjustment**: use SII data to distribute multi-region firms across their operating regions
