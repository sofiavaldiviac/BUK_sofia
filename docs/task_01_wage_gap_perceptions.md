# Task 01: Wage Gap Perceptions (Section 1.1)

| Field | Value |
|-------|-------|
| **Task ID** | task_01 |
| **Title** | Wage Gap Perceptions |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Replicate BUK report wage gap perception analyses for Chile only, with deeper heterogeneity cuts. These plots establish the baseline perception of gender pay equity that motivates Research Directions 1a (Sala Cuna), 3a (wage renegotiation), and 4b (HR practices).

## Specific Goal

Produce plots 1.1a through 1.1f in `BUK_sofia/1_Code/survey2026.R`. All code for this task must be written in that file. Each plot should be saved as a PNG/PDF to an output folder (e.g., `BUK_sofia/3_Output/`).

### Plots to produce

1. **Plot 1.1a**: Perceived Gender Wage Equality by Gender
   - Variable: `En mi organización, hombres y mujeres reciben el mismo salario cuando ocupan puestos de igual responsabilidad.` (_rec1 or _rec2)
   - Grouped bar (% agreeing, by gender)

2. **Plot 1.1b**: Perceived Gender Wage Equality by Income Tier
   - Same variable, crossed with income
   - Grouped bar, x-axis = income tier, bars = gender

3. **Plot 1.1c**: Perceived Gender Wage Equality by Role
   - Same variable, crossed with role
   - Horizontal grouped bar, y-axis = role categories, bars = gender

4. **Plot 1.1d**: Perception of Organizational Action on Wage Gap
   - Variable: `En mi organización se implementan medidas efectivas para reducir posibles diferencias salariales entre hombres y mujeres.` (_rec1 or _rec2)
   - Grouped bar (% agreeing, by gender)

5. **Plot 1.1e**: Wage Equality Perception by Presence of Formal Salary Adjustments
   - Wage equality perception x salary adjustment variable
   - Stacked bar for "adjustment yes" vs "no", by gender

6. **Plot 1.1f**: Compensation Evaluation vs Sector Peers
   - Variable: `¿Cómo evaluarías las remuneraciones de tu organización en relación con otras del mismo sector y tamaño?` (_rec1)
   - Grouped bar by gender

### Heterogeneities to implement for each plot

For each plot above, produce the baseline version plus the following interaction versions where sample size permits:
- gender x income tier [F]
- gender x role [F]
- gender x leadership (direct reports > 0 vs = 0) [F]
- gender x org size (<20, 20-49, 50-199, 200+) [F]
- gender x age/generation [F]

## Success Criteria

- [ ] All 6 baseline plots produced and saved
- [ ] At least gender x income and gender x role interaction versions for plots 1.1a and 1.1d
- [ ] All code written in `BUK_sofia/1_Code/survey2026.R`
- [ ] Data filtered to Chile only (N~1,235)
- [ ] Plots use consistent styling (ggplot2 theme, color palette for gender)
- [ ] Output saved to `BUK_sofia/3_Output/`

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script — all code goes here |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Full plot specifications and variable names |
| `Base de datos WiP 2026.xlsx` (sheet "Base de datos WiP") | Raw survey data |

## Scope Boundaries

- DO: Create all 6 plots with heterogeneity cuts listed above
- DO: Filter data to Chile only
- DO: Use _rec1/_rec2 columns (numeric recodes) for plotting
- DO NOT: Analyze countries other than Chile
- DO NOT: Create new R scripts — all code in `survey2026.R`
- DO NOT: Modify the raw data file

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
