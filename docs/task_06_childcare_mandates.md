# Task 06: Childcare Mandates & Cost of Female Labor (Section 2.1)

| Field | Value |
|-------|-------|
| **Task ID** | task_06 |
| **Title** | Childcare Mandates & Cost of Female Labor |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Article 203 (Sala Cuna) triggers at 20 female workers and creates a discontinuity in firm-provided childcare. These plots use organization size as a proxy for the threshold to examine whether women in small firms report worse benefits and lower satisfaction, motivating Research Directions 1a and 1b.

## Specific Goal

Produce plots 2.1a through 2.1d in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 2.1a**: Benefits Adequacy by Gender and Organization Size
   - Variable: `¿Crees que los beneficios ofrecidos por tu organización se adecúan a tus necesidades?` (_rec1/_rec2) x org size
   - Grouped bar, x-axis = org size buckets (<20, 20-49, 50-199, 200+), bars = gender

2. **Plot 2.1b**: Childcare/Benefits Importance as Job Attribute by Gender
   - Variable: `Beneficios laborales (seguro médico, guardería, almuerzo)` (_rec1)
   - Grouped bar (% ranking important, by gender)

3. **Plot 2.1c**: Organization Offers Benefits by Org Size and Gender
   - Variable: `¿Tu organización ofrece beneficios laborales a sus colaboradores?` (_rec1) x org size
   - Grouped bar, x-axis = org size buckets, bars = gender

4. **Plot 2.1d**: Salary Satisfaction by Org Size and Gender
   - Variable: `Tu salario` (_rec1/_rec2) x org size
   - Grouped bar (% satisfied), x-axis = org size

### Heterogeneities

- gender x org size [F] (key: testing 20-worker threshold discontinuity)
- gender x income [F]
- gender x age [F] (proxy for parental status) [A]
- gender x work schedule [F]

## Success Criteria

- [ ] All 4 baseline plots produced and saved
- [ ] Org size buckets explicitly include <20 vs 20-49 split (Sala Cuna threshold)
- [ ] Gender x org size interaction clearly shown for all plots
- [ ] Gender x age interaction for 2.1b (women 25-40 value childcare more?)
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 4 plots with org-size heterogeneity
- DO: Bucket org size to highlight Sala Cuna threshold (<20 vs 20+)
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
