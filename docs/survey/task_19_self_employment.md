# Task 19: Self-Employment Comparisons (Section 3.6)

| Field | Value |
|-------|-------|
| **Task ID** | task_19 |
| **Title** | Self-Employment Comparisons |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Research Direction 8c examines the informality double penalty. Self-employed women lack formal protections (maternity leave, Sala Cuna access). Comparing satisfaction, burnout, and boundary violations between employed and self-employed women reveals whether independence comes at a wellbeing cost.

## Specific Goal

Produce plots 3.6a through 3.6c in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 3.6a**: Employee vs Self-Employed Satisfaction by Gender
   - Compare main-section satisfaction items (employed) vs `.1` suffix items (self-employed), by gender
   - Grouped bar (employee-women, employee-men, self-employed-women, self-employed-men)

2. **Plot 3.6b**: Burnout: Employees vs Self-Employed by Gender
   - Burnout frequency (cols 266-269 vs 410-413) x gender
   - Grouped bar by gender x employment type

3. **Plot 3.6c**: Work Boundary Violations: Employees vs Self-Employed by Gender
   - Boundary items (employee cols 270-297 vs self-employed cols 414-441) x gender
   - Radar or grouped bar comparing all items across gender x employment type

### Heterogeneities

- gender x employment type [F] (primary dimension)
- adding age [F], income [F]

## Success Criteria

- [ ] All 3 plots produced and saved
- [ ] Clear visual comparison of 4 groups (emp-women, emp-men, self-women, self-men)
- [ ] Boundary violations comparison (3.6c) shows all items simultaneously
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 3 plots; correctly match employee vs self-employed question variants
- DO: Use `.1` suffix columns for self-employed respondents
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
