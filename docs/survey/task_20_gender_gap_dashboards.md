# Task 20: Comprehensive Gender Gap Dashboards (Section 3.7)

| Field | Value |
|-------|-------|
| **Task ID** | task_20 |
| **Title** | Comprehensive Gender Gap Dashboards |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

These summary visualizations provide a bird's-eye view of WHERE gender gaps are largest in the Chilean labor market, HOW they change across the hierarchy, and WHETHER they co-occur (firms with large wage gaps also have large training gaps). These are powerful motivating figures for a research agenda overview.

## Specific Goal

Produce plots 3.7a through 3.7c in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 3.7a**: Gender Gap Heatmap Across All Satisfaction Items
   - Variables: All satisfaction items (recognition, promotion, salary, flexibility, diversity, workload, overall, supervisor)
   - Heatmap: rows = satisfaction items, columns = income tiers (or org size), cell = female-male gap

2. **Plot 3.7b**: Gender Gap "Profile" by Role Level
   - Variables: All key outcomes (raise request, success, satisfaction, burnout, turnover) x role
   - Multi-panel line chart: x = role level, y = gender gap, panels = outcome

3. **Plot 3.7c**: Correlation Matrix of Gender Gaps Across Outcomes
   - Compute gender gap per outcome, correlate across org-size groups or individual responses
   - Correlation heatmap

### Heterogeneities

- By income tier [F]
- By role [F]
- By org size [F]
- By age [F]

## Success Criteria

- [ ] All 3 summary visualizations produced and saved
- [ ] Heatmap (3.7a) readable with diverging color scale (red = women worse, blue = men worse)
- [ ] Multi-panel chart (3.7b) shows at least 5 outcomes across role levels
- [ ] Correlation matrix (3.7c) computed and plotted
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 3 summary dashboards
- DO: Compute gender gaps as (female % - male %) for each outcome
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
