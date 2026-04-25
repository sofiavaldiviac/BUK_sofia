# Task 08: Wage Renegotiation & Bargaining Dynamics (Section 2.3)

| Field | Value |
|-------|-------|
| **Task ID** | task_08 |
| **Title** | Wage Renegotiation & Bargaining Dynamics |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Research Directions 3a-3c are the core of Sofia's agenda: do children affect wage renegotiation differently by gender? These plots use age as a lifecycle proxy to test whether women reduce negotiation during childbearing years, whether success rates vary by org size (monopsony), and whether meritocracy beliefs mediate the ask gap.

## Specific Goal

Produce plots 2.3a through 2.3g in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 2.3a**: Raise Request Rate by Gender x Age
   - Line plot, x = age group, y = % requesting, lines = gender

2. **Plot 2.3b**: Raise Request Rate by Gender x Income
   - Grouped bar, x = income tier, bars = gender

3. **Plot 2.3c**: Raise Success Rate by Gender x Age
   - Line plot, x = age group, y = % successful (filtered to askers), lines = gender

4. **Plot 2.3d**: Raise Success by Gender x Organization Size
   - Grouped bar, x = org size, bars = gender

5. **Plot 2.3e**: Raise Denial Reasons by Gender x Income
   - Heatmap (reason x gender x income tier)

6. **Plot 2.3f**: Pre-Hire Negotiation by Gender x Age
   - Grouped bar, x = generation, bars = gender (% who negotiated)

7. **Plot 2.3g**: Raise Request x Meritocracy Belief Interaction
   - Grouped bar: % requesting raise, by gender x meritocracy belief (high/low)

### Heterogeneities

- gender x age/generation [F] (key lifecycle proxy)
- gender x income [F]
- gender x leadership [F]
- gender x org size [F] (monopsony proxy)
- gender x meritocracy perception [F]
- gender x role [F]

## Success Criteria

- [ ] All 7 plots produced and saved
- [ ] Lifecycle profiles (2.3a, 2.3c) clearly show age trajectory by gender
- [ ] Heatmap (2.3e) readable with clear color scale
- [ ] Meritocracy interaction (2.3g) tests whether belief mediates the ask gap
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only; 2.3c filtered to those who asked

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 7 plots
- DO: Properly filter conditional plots (success rate = only askers; denial reasons = only denied)
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
