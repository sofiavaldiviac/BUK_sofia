# Task 15: Organizational Trust & Satisfaction (Section 3.2)

| Field | Value |
|-------|-------|
| **Task ID** | task_15 |
| **Title** | Organizational Trust & Satisfaction |
| **Date opened** | 2026-04-16 |
| **GitHub issue** | n/a |
| **Status** | open |
| **Assignee** | executor agent |

## Motivation

Trust in management, HR, supervisors, and peers may differ by gender and mediate other outcomes (raise-seeking, turnover). NPS by gender captures overall employer quality from the worker's perspective.

## Specific Goal

Produce plots 3.2a through 3.2c in `BUK_sofia/1_Code/survey2026.R`. Save outputs to `BUK_sofia/3_Output/`.

### Plots to produce

1. **Plot 3.2a**: Trust/Satisfaction Across All Organizational Levels by Gender
   - Variables: Cols 162-176 (supervisor, organization, management, HR, peers) — _rec1/_rec2
   - Grouped bar or radar chart (% satisfied per level, by gender)

2. **Plot 3.2b**: Supervisor Satisfaction by Gender x Leadership Status
   - Variable: supervisor satisfaction (_rec1/_rec2) x leadership
   - Grouped bar, x = leader/non-leader, bars = gender

3. **Plot 3.2c**: NPS (Net Promoter Score) by Gender
   - Variable: NPS question (col 41)
   - Distribution histogram by gender, or promoters/passives/detractors bar

### Heterogeneities

- gender x income [F]
- gender x role [F]
- gender x leadership [F]
- gender x org size [F]
- gender x age [F]
- gender x tenure [F]

## Success Criteria

- [ ] All 3 plots produced and saved
- [ ] Trust radar (3.2a) shows all 5 organizational levels simultaneously
- [ ] NPS (3.2c) computed correctly (promoters=9-10, passives=7-8, detractors=0-6)
- [ ] All code in `BUK_sofia/1_Code/survey2026.R`
- [ ] Chile only

## Inputs / Relevant Files

| File | Role |
|------|------|
| `BUK_sofia/1_Code/survey2026.R` | Main R script |
| `BUK_sofia/1_Code/Survey_Plot_Ideas.md` | Plot specifications |
| `Base de datos WiP 2026.xlsx` | Raw data |

## Scope Boundaries

- DO: Create all 3 plots with heterogeneity cuts
- DO NOT: Create new scripts or modify raw data

## Action Log

| Date | Agent | Action | Summary |
|------|-------|--------|---------|
| 2026-04-16 | orchestrator | created | Task doc created |

## Outcome

_To be filled after task is accepted._

## Next Recommended Step

_To be filled by reviewer after acceptance._
