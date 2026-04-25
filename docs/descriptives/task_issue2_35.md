# Task: Plot 6.3 — Gender Composition of BUK Firms

| Field | Value |
|---|---|
| **Task ID** | `issue2_35` |
| **Title** | Plot gender composition of BUK firms by size and sector |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

The overall gender split in BUK data (62.8% male, 37.2% female) masks variation across firm characteristics. Showing how the female share varies by firm size and sector helps readers understand where women are concentrated and which firms drive the aggregate gap.

## Specific goal

Produce a bar chart of female share by firm size and sector:
- Option A: grouped bar chart with firm size categories on X-axis, female share on Y-axis
- Option B: heatmap with firm size on one axis and sector on the other, color = female share
- Firm size defined by employee count per `tenant_id` (e.g., <50, 50-250, >250)
- Sector from `shared_core_rsch_company`
- Report overall female share and range across cells
- Filter to Chile

## Success criteria

- [ ] Female share correctly computed per firm size and sector
- [ ] Clear visual showing where women are concentrated
- [ ] Chile filter applied
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- `shared_adm_job` — employment records (Databricks)
- `shared_core_rsch_employee` — gender (Databricks)
- `shared_core_rsch_company` — sector (Databricks)

## Branch used

_TBD_

## Compute environment used

Databricks (PySpark/Python)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Added Plot 6.3 to `reducedform_admin.py` | Appended section after existing plots 2.1–2.3. Uses cached CSVs, not delta_sharing. |
| 2026-04-23 | Generated `rf_6_3_gender_composition.png` | Heatmap: 16 sectors × 3 firm sizes. N=4,709,067 workers. Overall female share: 37.2%. |

## Outcome

Heatmap produced and saved to `1_Code/figures/rf_6_3_gender_composition.png`. Key findings: Health (75% female in large firms) and Education (68%) are most female-concentrated. Construction (9–13%) and Mining (10–18%) are most male-dominated. Large firms show more extreme gender skews. Sector from SII table (~88% coverage). Trust: high — overall female share matches known aggregate (37.2%). Next action: iterate on visual polish if needed.

## Next recommended step

Proceed to `issue2_36` (Plot 6.4: reform timeline).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
