# Task 10: Fertility & Career Trajectories (Section 2.5)

| Field | Value |
|-------|-------|
| **Task ID** | task_10 |
| **Title** | Fertility & Career Trajectories |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Research Directions 5a-5e explore how fertility timing affects women's careers. The survey has no direct parental status variable, but age x gender lifecycle profiles can reveal whether gender gaps in satisfaction, burnout, raise-seeking, and training access widen during childbearing years (late 20s-30s). These plots are key motivating evidence for the fertility-career cost argument.

## Specific Goal

Produce plots 2.5a through 2.5f in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 2.5a**: Career Satisfaction by Gender x Age (Lifecycle Trajectory)
   - Variable: promotion satisfaction (_rec1/_rec2) x age
   - Line plot, x = age group, y = % satisfied, lines = gender

2. **Plot 2.5b**: Overall Job Satisfaction by Gender x Age
   - Variable: overall job satisfaction (_rec1/_rec2) x age
   - Line plot

3. **Plot 2.5c**: Salary Satisfaction by Gender x Age
   - Variable: salary satisfaction (_rec1/_rec2) x age
   - Line plot

4. **Plot 2.5d**: Burnout by Gender x Age
   - Variable: burnout frequency (_rec1/_rec2/_rec3) x age
   - Line plot (% frequent/always, by gender)

5. **Plot 2.5e**: Raise Request Rate Lifecycle Profile
   - Variable: raise request x age x gender
   - Line plot

6. **Plot 2.5f**: Training Access by Gender x Age
   - Variable: training access (_rec1) x age x gender
   - Line plot

### Heterogeneities

- gender x age/generation [F] (primary dimension for all 6 plots)
- adding income [F], role [F], leadership [F], work schedule [F]
- Aspirational: gender x parental status [A] (proxy: age 30-44 women vs <30 women)

## Success Criteria

- [ ] All 6 lifecycle plots produced and saved
- [ ] All use consistent age groupings (Gen Z / Millennials / Gen X / Boomers, or 5-year bins)
- [ ] Clear visual showing whether gender gaps open during 30s
- [ ] At least income interaction for 2.5a and 2.5d
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 6 lifecycle plots with age x gender as core dimension
- DO: Use consistent age bins across all plots for comparability
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
