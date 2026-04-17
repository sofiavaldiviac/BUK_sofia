# Task 12: Turnover, Discrimination & Frontier Questions (Section 2.7)

| Field | Value |
|-------|-------|
| **Task ID** | task_12 |
| **Title** | Turnover, Discrimination & Frontier Questions |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Research Directions 8a-8f cover frontier topics: turnover intentions reveal revealed preferences about job quality, while discrimination and burnout as exit drivers connect to harassment (Ley Karin) and informality research. These plots decompose WHY women want to leave and whether the reasons differ by lifecycle stage.

## Specific Goal

Produce plots 2.7a through 2.7f in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 2.7a**: Turnover Intention by Gender
   - Variable: turnover desire (_rec1/_rec2)
   - Stacked bar (stay happy / looking / actively searching, by gender)

2. **Plot 2.7b**: Reasons for Wanting to Change Job by Gender
   - Variables: Cols 227-242 (growth, environment, compensation, work-life, leadership, discrimination, burnout, purpose)
   - Horizontal grouped bar (% citing each reason, by gender)

3. **Plot 2.7c**: Work-Life Imbalance as Reason to Leave by Gender x Age
   - Variable: work-life imbalance reason (_rec1) x age
   - Line plot, x = age, y = % citing, lines = gender

4. **Plot 2.7d**: Discrimination as Reason to Leave by Gender x Role
   - Variable: discrimination reason (_rec1) x role
   - Grouped bar, x = role, bars = gender

5. **Plot 2.7e**: Burnout as Reason to Leave by Gender x Work Schedule
   - Variable: burnout reason (_rec1) x work schedule
   - Grouped bar, x = schedule type, bars = gender

6. **Plot 2.7f**: Compensation Inadequacy as Reason to Leave by Gender x Income
   - Variable: compensation reason (_rec1) x income
   - Grouped bar, x = income, bars = gender

### Heterogeneities

- gender x age [F] (key for 2.7c: work-life balance driver peaks in 30s for women?)
- gender x role [F] (key for 2.7d: discrimination more cited at leadership?)
- gender x work schedule [F] (key for 2.7e)
- gender x income [F] (key for 2.7f)
- gender x org size [F]

## Success Criteria

- [ ] All 6 plots produced and saved
- [ ] Reasons plot (2.7b) sorted by largest gender gap to highlight key differences
- [ ] Lifecycle profile (2.7c) shows age trajectory clearly
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 6 plots with heterogeneity cuts
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
