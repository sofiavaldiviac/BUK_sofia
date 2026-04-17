# Task 17: Workload & Stress Patterns (Section 3.4)

| Field | Value |
|-------|-------|
| **Task ID** | task_17 |
| **Title** | Workload & Stress Patterns |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Workload satisfaction, stress, and depression patterns by gender reveal the hidden costs of work arrangement choices. If part-time or remote work reduces stress for women, it strengthens the case for flexibility mandates (RD 2a-2b). If it doesn't, it suggests the dual burden persists regardless of schedule.

## Specific Goal

Produce plots 3.4a through 3.4c in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 3.4a**: Workload Satisfaction by Gender
   - Variable: `Tu carga laboral` (_rec1/_rec2)
   - Grouped bar (% satisfied, by gender)

2. **Plot 3.4b**: Stress Frequency by Gender x Work Schedule x Remote
   - Variable: `Estresado/a laboralmente` (_rec2/_rec3) x work schedule x remote
   - Faceted grouped bar (stress by gender, faceted by schedule x remote)

3. **Plot 3.4c**: Depression Frequency by Gender
   - Variable: `Deprimido/a` (_rec2/_rec3)
   - Grouped bar by gender

### Heterogeneities

- gender x work schedule [F]
- gender x remote [F]
- gender x income [F]
- gender x age [F]
- gender x role [F]
- gender x leadership [F]
- gender x tenure [F]

## Success Criteria

- [ ] All 3 plots produced and saved
- [ ] Faceted plot (3.4b) clearly shows interaction of schedule x remote x gender
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
