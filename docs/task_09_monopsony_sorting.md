# Task 09: Monopsony, Sorting & Firm Heterogeneity (Section 2.4)

| Field | Value |
|-------|-------|
| **Task ID** | task_09 |
| **Title** | Monopsony, Sorting & Firm Heterogeneity |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Research Directions 4a and 4b examine how firm characteristics (size, HR formalization) shape gender gaps. These plots use org size as a proxy for monopsony power and HR software usage as a proxy for formalization, testing whether gender gaps in satisfaction and raise outcomes vary systematically across firm types.

## Specific Goal

Produce plots 2.4a through 2.4d in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 2.4a**: Gender Gaps Across All Satisfaction Dimensions by Org Size
   - Variables: All satisfaction items (recognition, promotion, salary, flexibility, diversity, workload, overall) x org size
   - Heatmap (satisfaction dim x org size, cell = female-male gap in % satisfied)

2. **Plot 2.4b**: Raise Success Rate x Org Size x Gender (Monopsony Proxy)
   - Line plot, x = org size, lines = gender

3. **Plot 2.4c**: Turnover Intention by Gender x Org Size
   - Grouped bar, x = org size, bars = gender (% wanting to change)

4. **Plot 2.4d**: HR Software Usage by Org Size and Gender Outcomes
   - Grouped bar: outcomes by gender, split by HR software presence

### Heterogeneities

- gender x org size [F] (key dimension for all plots)
- gender x HR software [F] (proxy for formalization)
- adding income [F], role [F], age [F]

## Success Criteria

- [ ] All 4 plots produced and saved
- [ ] Heatmap (2.4a) clearly shows which satisfaction dimensions have largest gaps at which firm sizes
- [ ] HR formalization proxy (2.4d) tested against at least raise success and salary satisfaction
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 4 plots with org-size and HR-software heterogeneity
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
