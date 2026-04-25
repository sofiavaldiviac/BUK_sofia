# Task 02: Salary Negotiations & Raise Requests (Section 1.2)

| Field | Value |
|-------|-------|
| **Task ID** | task_02 |
| **Title** | Salary Negotiations & Raise Requests |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Raise requests and negotiation behavior are the core mechanism for Research Direction 3a (mothers vs fathers bargaining). The BUK report shows similar ask rates but differences in pre-hire negotiation. These plots decompose the full raise pipeline by gender with rich heterogeneity.

## Specific Goal

Produce plots 1.2a through 1.2e in `BUK_sofia/1_Code/survey2026.R`. All code for this task must be written in that file. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 1.2a**: Share Who Requested a Raise (Last 2 Years)
   - Variable: `¿Has pedido un aumento de salario en los últimos 2 años?`
   - Grouped bar (% yes, by gender)

2. **Plot 1.2b**: Negotiation Before Accepting Job Offer
   - Variable: `¿Cuál de las siguientes afirmaciones describe mejor tu situación?`
   - Stacked bar (% negotiated vs accepted as-is, by gender)

3. **Plot 1.2c**: Success Rate Among Those Who Asked for Raise
   - Variable: `¿Cuál fue el resultado de tu solicitud de aumento de salario?` (_rec1)
   - Filter to those who asked; grouped bar (% successful, by gender)

4. **Plot 1.2d**: Reasons for Raise Denial
   - Variables: Cols 212-223 (market alignment, band ceiling, recent adjustment, performance, budget, other)
   - Horizontal grouped bar (% citing each reason, by gender)

5. **Plot 1.2e**: Full Raise Request Funnel by Gender
   - Combine cols 207, 208, 209
   - Funnel/waterfall chart: % asked → % succeeded

### Heterogeneities to implement for each plot

- gender x income tier [F]
- gender x leadership [F]
- gender x age/generation [F]
- gender x org size [F]
- gender x work schedule (full-time/part-time) [F]
- gender x age (proxy for parental status) [A] — especially for plots 1.2a and 1.2c

## Success Criteria

- [ ] All 5 baseline plots produced and saved
- [ ] Funnel chart (1.2e) clearly shows where in the pipeline women lose out
- [ ] At least gender x income, gender x age, and gender x leadership interaction versions for 1.2a and 1.2c
- [ ] All code written in `BUK_sofia/1_Code/survey2026.R`
- [ ] Data filtered to Chile only
- [ ] Output saved to `BUK_sofia/3_Output/`

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script — all code goes here |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Full plot specifications and variable names |
| `Base de datos WiP 2026.xlsx` (sheet "Base de datos WiP") | Raw survey data |

## Scope Boundaries

- DO: Create all 5 plots with heterogeneity cuts
- DO: Filter to Chile only; filter 1.2c to those who asked for a raise
- DO NOT: Create new R scripts
- DO NOT: Analyze other countries

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
