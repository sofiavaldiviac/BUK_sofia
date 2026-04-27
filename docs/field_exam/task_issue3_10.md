# Task: Counterfactuals and Appendix Slides

| Field | Value |
|---|---|
| **Task ID** | `issue3_10` |
| **Title** | Write the counterfactuals slide and three appendix slides (survey, formal FOC, extra figures) |
| **Date opened** | 2026-04-26 |
| **GitHub Issue** | [#3 -- Field exam slides](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) |
| **Depends on** | `issue3_00` |

## Motivation

The counterfactuals slide is the payoff of the structural model and should close the main body of the talk. The appendix provides backup material for anticipated questions (survey design, formal math, extra figures).

## Specific goal

Create four slides:

1. **Counterfactuals** (adapt from `main.tex` lines 689--714):
   - Three numbered exercises: equalize outside options (lambda_F = lambda_M), eliminate market power (lambda -> infinity), policy simulation (40-hour workweek -> lambda_F up)
   - Each exercise with a one-line description and a one-line "what it tells us"

2. **Appendix: Survey details** (adapt from `main.tex` lines 722--743):
   - `[label=survey]` for hyperlink from BUK slide
   - Sample size, countries, topics, note that it cannot be linked to platform data
   - `\beamerreturnbutton` back to BUK slide

3. **Appendix: Formal FOC** (adapt from `main.tex` lines 746--783):
   - `[label=foc-formal]` for hyperlink from retention slide
   - Two-period simplification, retention probabilities, promote-if condition
   - `\beamerreturnbutton` back to retention slide

4. **Appendix: Additional figures** (optional):
   - Gender composition by sector (`rf_6_3_gender_composition.png`)
   - Reform timeline (`rf_6_4_reform_timeline.png`)
   - Any other figures that support Q&A

## Success criteria

- [x] Counterfactuals skipped per user request (project too early for counterfactual claims)
- [x] Appendix section with `\appendix` command and hidden footline
- [x] Survey slide with working hyperlink (`\beamerreturnbutton` back to BUK slide)
- [x] Three backup figure slides (gender composition, negotiation funnel, promotion perceptions)
- [x] Compiles without errors

## Inputs / relevant files

- `2_Writeup/slides/main.tex` -- lines 689--783 (counterfactuals + appendix)
- `1_Code/figures/rf_6_3_gender_composition.png`
- `1_Code/figures/rf_6_4_reform_timeline.png`

## Branch used

_TBD_

## Compute environment used

Local (LaTeX)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-26 | Skipped counterfactuals slide | User: "I'm just starting with this project, don't want to be over ambitious yet." |
| 2026-04-26 | Inserted 4 appendix slides | Survey details (with return button to BUK slide), gender composition heatmap, negotiation funnel, promotion perceptions. |
| 2026-04-26 | Compiled | 28 pages (21 main + 7 appendix), no errors. |

## Outcome

Appendix slides added (no counterfactuals). Deck now has 21 main + 7 appendix (28 total). Appendix covers: formal model (3 slides from task 08), survey details, gender composition, negotiation funnel, promotion perceptions.

## Next recommended step

Proceed to `issue3_11` (compile and review).

**Important:** After completing this task, post a comment on [Issue #3](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) summarizing what was done.
