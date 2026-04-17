# Task 04: Training & Capacity Building (Section 1.4)

| Field | Value |
|-------|-------|
| **Task ID** | task_04 |
| **Title** | Training & Capacity Building |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Training access and returns are key for Research Direction 4b (HR practices and gender equity). BUK report finds the gender training gap concentrates at middle incomes and that men perceive higher productivity returns. These plots explore whether firms invest differently in female human capital.

## Specific Goal

Produce plots 1.4a through 1.4e in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 1.4a**: Training Access (Organization-Financed)
   - Variable: training completion question (_rec1)
   - Grouped bar (% yes, by gender)

2. **Plot 1.4b**: Training Topics by Gender
   - Variables: Cols 72-95 (12 skill areas)
   - Horizontal grouped bar (% trained in each area, by gender)

3. **Plot 1.4c**: Perceived Training Effectiveness
   - Variables: Cols 98-111 (7 effect types + no effect)
   - Horizontal grouped bar (% reporting each effect, by gender)

4. **Plot 1.4d**: Desired Future Training Areas
   - Variables: Cols 112-129
   - Horizontal grouped bar (% interested, by gender)

5. **Plot 1.4e**: Training Gap — Offered vs Desired
   - Compare received (cols 72-95) vs desired (cols 112-129)
   - Paired dot plot or divergence bar (gap, by gender)

### Heterogeneities

- gender x income tier [F] (key: BUK finds gap at middle income)
- gender x leadership [F] (key: BUK finds effectiveness gap larger for non-leaders)
- gender x role [F]
- gender x age [F]
- gender x work schedule [F]
- gender x org size [F]

## Success Criteria

- [ ] All 5 baseline plots produced and saved
- [ ] Gender x income interaction for 1.4a (replicating BUK middle-income finding)
- [ ] Gender x leadership interaction for 1.4c (effectiveness gap)
- [ ] Training mismatch plot (1.4e) clearly shows received vs desired gap by gender
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 5 plots with heterogeneity cuts
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
