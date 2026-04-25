# Task: Plot 1.7 — Perceived Promotion Opportunities by Gender (Survey)

| Field | Value |
|---|---|
| **Task ID** | `issue2_10` |
| **Title** | Plot perceived promotion opportunities by gender from WiP survey |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

Subjective perceptions of promotion opportunities complement the admin promotion rates (Section 4). If women perceive fewer opportunities even in similar roles, it suggests the promotion gap is felt, not just measured in admin data.

## Specific goal

Produce a bar chart of perceived promotion opportunities by gender:
- Survey question on characterization of promotion possibilities (e.g., satisfaction with promotion opportunities, perception of meritocracy)
- Bars grouped by gender
- Y-axis: share of respondents per response category
- Filter to Chile subsample
- Report N per gender

## Success criteria

- [ ] Promotion perception variable correctly identified from survey
- [ ] Chile filter applied
- [ ] Gender gap clearly visible (or documented if not)
- [ ] Saved to `1_Code/figures/`

## Inputs / relevant files

- WiP 2026 survey data (cleaned in `1_Code/descriptives/survey2026.R`)
- `3_Documents/English/WiP_Survey_2026_Variables.md` — variable dictionary
- Related: `docs/survey/task_03_promotions_meritocracy.md` (plots 1.3a-d cover same variables)

## Branch used

_TBD_

## Compute environment used

Local (R)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-23 | Plot created | Grouped bar chart in `1_Code/descriptives/reducedform_survey.R`. Chile subsample: N=693 women, N=309 men. |

## Outcome

**Outcome:** Grouped bar chart of 5 promotion perception categories by gender. Women are more pessimistic: 30% say "no promotions exist" (vs 20% men), only 8% report "clear policy, real opportunities" (vs 13% men). Women cluster more in "promotions exist, no clear policy" (30%) while men lean toward this category even more (38%).

**Trust level:** High. Variable F7 mapped from raw Spanish text using grepl pattern matching, verified against codebook.

**Evidence:** Figure saved as `1_Code/figures/rf_1_7_promotion_perceptions_by_gender.png`.

**Next action:** The perception gap (women see fewer opportunities) supports the model's prediction. Cross-reference with admin promotion rates (task issue2_21) and the HHI interaction (task issue2_23).

## Next recommended step

Proceed to `issue2_11` (Plot 2.1: applicants per vacancy). This begins Section 2.

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
