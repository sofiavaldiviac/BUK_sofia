# Task 14: Job Attribute Preferences (Section 3.1)

| Field | Value |
|-------|-------|
| **Task ID** | task_14 |
| **Title** | Job Attribute Preferences |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Understanding what women vs men value in a job speaks directly to compensating differentials (Research Direction 8e) and sorting (2a). If women value flexibility and proximity more, this suggests they may accept lower wages for non-pecuniary amenities — a key mechanism in the gender wage gap.

## Specific Goal

Produce plots 3.1a through 3.1c in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 3.1a**: Top Job Attributes Ranked by Gender
   - Variables: Cols 42-61 (salary, benefits, proximity, tasks, flexibility, remote, growth, culture, environment, social impact) — _rec1
   - Horizontal bar chart with gender-paired bars, sorted by female ranking

2. **Plot 3.1b**: Proximity to Workplace Importance by Gender
   - Variable: `Cercanía al lugar de trabajo` (_rec1)
   - Grouped bar by gender

3. **Plot 3.1c**: Social Impact Valuation by Gender
   - Variable: `Contribución o Impacto social positivo` (_rec1)
   - Grouped bar by gender

### Heterogeneities

- gender x income [F] (do low-income women prioritize salary, high-income prioritize flexibility?)
- gender x age [F] (proxy for parental status) [A]
- gender x role [F]
- gender x work schedule [F]
- gender x remote [F]

## Success Criteria

- [ ] All 3 plots produced and saved
- [ ] 3.1a sorted to show largest gender differences prominently
- [ ] Gender x income interaction for 3.1a (preference shift across income)
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 3 plots with heterogeneity cuts
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
