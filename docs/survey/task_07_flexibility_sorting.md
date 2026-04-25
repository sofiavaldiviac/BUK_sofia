# Task 07: Flexibility Mandates & Worker Sorting (Section 2.2)

| Field | Value |
|-------|-------|
| **Task ID** | task_07 |
| **Title** | Flexibility Mandates & Worker Sorting |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Law 21.645 mandates flexibility for workers with dependents under 14. These plots document the current state of remote work access, hourly flexibility, and schedule types by gender — establishing the pre-reform baseline and showing whether women sort into flexible but potentially lower-paying arrangements. Motivates Research Directions 2a, 2b, 2c, and 8e (compensating differentials).

## Specific Goal

Produce plots 2.2a through 2.2g in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 2.2a**: Remote Work Access by Gender
   - Variable: `¿Tienes la posibilidad de trabajar de manera remota/teletrabajar?`
   - Stacked bar (no / 1-2 days / 3-4 days / 100%, by gender)

2. **Plot 2.2b**: Hourly Flexibility by Gender
   - Variable: hourly flexibility question (_rec1)
   - Grouped bar (distribution of flexibility levels, by gender)

3. **Plot 2.2c**: Flexibility Satisfaction by Gender
   - Variable: `Flexibilidad laboral, en términos de teletrabajo y horario flexible` (_rec1/_rec2)
   - Grouped bar (% satisfied/very satisfied, by gender)

4. **Plot 2.2d**: Work Schedule Type by Gender
   - Variable: `¿Qué tipo de jornada tienes en tu trabajo actual?`
   - Stacked bar (full-time / part-time / shifts, by gender)

5. **Plot 2.2e**: Flexibility Valuation as Job Attribute by Gender
   - Variable: `Flexibilidad laboral` (_rec1) — importance ranking
   - Grouped bar (% ranking high, by gender)

6. **Plot 2.2f**: Remote/Hybrid Work Valuation as Job Attribute by Gender
   - Variable: `Posibilidad de trabajar de forma remota o híbrida` (_rec1)
   - Grouped bar (% ranking high, by gender)

7. **Plot 2.2g**: Flexibility Access vs Satisfaction Scatter
   - Variables: Remote work access x flexibility satisfaction, colored by gender
   - Scatter/bubble chart

### Heterogeneities

- gender x income [F]
- gender x role [F]
- gender x org size [F]
- gender x age [F] (proxy for parental status) [A]
- gender x work schedule [F]
- gender x remote (conditional on access) [F]

## Success Criteria

- [ ] All 7 baseline plots produced and saved
- [ ] Gender x age interactions for 2.2a, 2.2b, 2.2e (mothers-age women)
- [ ] Gender x income interaction for 2.2e (do low-income women value flexibility less because they can't afford it?)
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 7 plots with heterogeneity cuts
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
