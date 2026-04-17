# Task 03: Promotions & Meritocracy (Section 1.3)

| Field | Value |
|-------|-------|
| **Task ID** | task_03 |
| **Title** | Promotions & Meritocracy |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Perceived meritocracy in promotions is central to Research Direction 4b (HR practices). The BUK report finds that gender gaps in meritocracy beliefs are significant only in Chile and widen for leaders. These plots dig deeper into who trusts the system and who doesn't.

## Specific Goal

Produce plots 1.3a through 1.3d in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 1.3a**: Promotion Opportunities Description
   - Variable: `En tu organización ¿Qué afirmación describe mejor las oportunidades de promoción o ascenso?` (_rec1)
   - Stacked bar (distribution of responses, by gender)

2. **Plot 1.3b**: Performance-Based Promotions Frequency
   - Variable: `¿Con qué frecuencia las promociones o ascensos toman en consideración la evaluación de desempeño?` (_rec1/_rec2/_rec3)
   - Grouped bar (% siempre/muchas veces, by gender)

3. **Plot 1.3c**: Satisfaction with Promotion Possibilities
   - Variable: `Tus posibilidades de promoción y crecimiento profesional` (_rec1/_rec2)
   - Grouped bar (% satisfied/very satisfied, by gender)

4. **Plot 1.3d**: Satisfaction with Recognition
   - Variable: `Reconocimiento que obtienes por el trabajo bien hecho` (_rec1/_rec2)
   - Grouped bar (% satisfied, by gender)

### Heterogeneities

- gender x income tier [F]
- gender x role [F]
- gender x leadership [F] (key: BUK report shows gap widens for leaders)
- gender x org size [F]
- gender x age/generation [F]
- gender x tenure [F]

## Success Criteria

- [ ] All 4 baseline plots produced and saved
- [ ] Gender x leadership interaction for 1.3b (replicating BUK finding)
- [ ] Gender x age interaction for 1.3c (do younger women start optimistic?)
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only filter applied

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 4 plots with heterogeneity cuts
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
