# Task 11: Work-Life Balance & Household Decisions (Section 2.6)

| Field | Value |
|-------|-------|
| **Task ID** | task_11 |
| **Title** | Work-Life Balance & Household Decisions |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Research Directions 6a and 7a-7c examine spousal specialization, housing constraints, and income uncertainty as drivers of fertility delay. These plots document gendered patterns in burnout, work boundary violations, emotional states, and work-life interference — showing the dual burden that constrains women's labor market decisions.

## Specific Goal

Produce plots 2.6a through 2.6h in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 2.6a**: Work-Life Interference Frequency by Gender
   - Variable: work-life interference (_rec1/_rec2/_rec3)
   - Grouped bar (distribution nunca to siempre, by gender)

2. **Plot 2.6b**: All Boundary Violation Items by Gender
   - Variables: Cols 270-297 (overtime, weekend, vacation, after-hours, thinking about work, before sleep, interference)
   - Radar/spider chart or horizontal grouped bar (mean frequency per item, by gender)

3. **Plot 2.6c**: Overtime Work by Gender x Work Schedule
   - Variable: overtime (_rec2/_rec3) x work schedule
   - Grouped bar, x = schedule type, bars = gender

4. **Plot 2.6d**: Burnout Frequency by Gender
   - Variable: burnout (_rec1/_rec2/_rec3)
   - Grouped bar (distribution, by gender)

5. **Plot 2.6e**: Emotional States by Gender
   - Variables: happiness, stress, commitment, depression, boredom (_rec2/_rec3)
   - Grouped bar or radar (mean/% high per emotion, by gender)

6. **Plot 2.6f**: Work-Life Interference by Gender x Remote Work
   - Variable: interference x remote access
   - Grouped bar, x = remote level, bars = gender

7. **Plot 2.6g**: Vacation Length by Gender
   - Variable: longest vacation (_rec1/_rec2)
   - Grouped bar (distribution of lengths, by gender)

8. **Plot 2.6h**: Burnout x Work-Life Interference Correlation by Gender
   - Scatter or grouped heatmap (burnout x interference x gender)

### Heterogeneities

- gender x work schedule [F] (key for 2.6c: part-time women still overworked?)
- gender x remote [F] (key for 2.6f)
- gender x income [F]
- gender x age [F] (proxy for parental status) [A]
- gender x leadership [F]
- gender x role [F]

## Success Criteria

- [ ] All 8 plots produced and saved
- [ ] Radar/spider chart (2.6b) shows all 7 boundary items simultaneously
- [ ] Part-time overtime paradox (2.6c) clearly visible if present
- [ ] Burnout-interference correlation (2.6h) shows if link is stronger for women
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 8 plots with heterogeneity cuts
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
