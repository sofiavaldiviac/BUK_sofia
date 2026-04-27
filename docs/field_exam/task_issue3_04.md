# Task: Summary Statistics Slides

| Field | Value |
|---|---|
| **Task ID** | `issue3_04` |
| **Title** | Write the three summary statistics slides: firms, workers, and recruitment |
| **Date opened** | 2026-04-26 |
| **GitHub Issue** | [#3 -- Field exam slides](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) |
| **Depends on** | `issue3_00` |

## Motivation

The summary statistics slides establish the scale and scope of the data. Three slides cover firms (size distribution, sectors, SII linkage), workers (unique workers, job spells, gender split, hierarchy), and recruitment (selection processes, applications, gender composition, selectivity distribution).

## Specific goal

Adapt the three summary statistics slides from `main.tex` (lines 181--281):
- **Firms slide** (lines 181--209): table with firm size distribution, bullets on panel growth, sectors, SII linkage
- **Workers slide** (lines 214--245): table with worker/spell counts and distribution, bullets on hierarchy, wages, job characteristics, separations
- **Recruitment slide** (lines 250--281): table with recruitment counts and selectivity distribution, bullets on closure rate, referral sources, right tail

All tables should use `booktabs` style. Check that numbers are consistent with the short proposal (Table 1).

## Success criteria

- [x] Three frames, one per data module (firms, workers, recruitment)
- [x] Each frame has a centered table + bullet points below
- [x] Numbers match across slides and with the short proposal
- [x] Compiles without errors
- [x] Bonus: added fourth slide on compensation (adm_salary + adm_assign)

## Inputs / relevant files

- `2_Writeup/slides/main.tex` -- lines 181--281
- `2_Writeup/paper/short_proposal/short_proposal.tex` -- Table 1 (lines 84--101)

## Branch used

_TBD_

## Compute environment used

Local (LaTeX)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-26 | Inserted 4 summary stats slides | Firms (table + 3 bullets), Workers (table + 3 bullets with CIUO-08 crosswalk, Art. 22), Compensation (adm_salary + adm_assign from Resumen variables Buk.pdf), Recruitment (table + 3 bullets with application-level detail). |
| 2026-04-26 | Compiled | 9 pages, no errors. |

## Outcome

Four slides inserted. Compensation slide is new content based on `Resumen variables Buk.pdf`, connecting payroll/bonus data to the promotion vs. bonus distinction relevant for the model. Deck now has 9 slides.

## Next recommended step

Proceed to `issue3_05` (sample selection slides).

**Important:** After completing this task, post a comment on [Issue #3](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) summarizing what was done.
