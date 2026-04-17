# Task 13: Training, Human Capital & Compensating Differentials (Section 2.8)

| Field | Value |
|-------|-------|
| **Task ID** | task_13 |
| **Title** | Human Capital & Compensating Differentials |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Research Direction 3a links confidence to bargaining outcomes, and 4b examines HR investment. These plots test whether women underrate their own performance (confidence channel) and whether they feel equal responsibility for career development.

## Specific Goal

Produce plots 2.8a and 2.8b in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 2.8a**: Self-Assessment of Performance by Gender
   - Variables: Cols 130-138 (task completion, quality satisfaction, time efficiency) — _rec1/_rec2
   - Grouped bar (% agreeing strongly, by gender, for each performance item)

2. **Plot 2.8b**: Sense of Responsibility for Own Development by Gender
   - Variable: `Me siento responsable de mi propio desarrollo profesional` (_rec1/_rec2)
   - Grouped bar (% agree/strongly agree, by gender)

### Heterogeneities

- gender x income [F]
- gender x role [F]
- gender x leadership [F]
- gender x age [F]
- gender x tenure [F]

## Success Criteria

- [ ] Both baseline plots produced and saved
- [ ] Gender x leadership interaction for 2.8a (do women leaders underrate themselves?)
- [ ] Gender x age interaction for 2.8a (does confidence gap widen with age?)
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create both plots with heterogeneity cuts
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
