# Task: Preliminary Evidence Slides

| Field | Value |
|---|---|
| **Task ID** | `issue3_09` |
| **Title** | Write the preliminary evidence slides: HHI, promotion gap x concentration, survey evidence, next steps |
| **Date opened** | 2026-04-26 |
| **GitHub Issue** | [#3 -- Field exam slides](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) |
| **Depends on** | `issue3_00` |

## Motivation

The preliminary evidence section bridges the model's predictions to what we see in the data. These slides are the "does the data match the story?" moment. The field exam audience will want to see that the mechanism has empirical support, even if identification is not yet established.

## Specific goal

Create four new slides (content drawn from short proposal Section 4, lines 132--177):

1. **HHI distribution** -- Include `rf_2_4_hhi_distribution_employment_unweighted.png` (and optionally vacancy-based side by side). Bullets: mean HHI = 2,249, geographic variation (Santiago 209 vs Aysen 5,690), meaningful right tail.

2. **Promotion gap x concentration** -- Include `rf_4_3_promotion_by_gender_hhi.png`. Bullets: aggregate promotion rates nearly identical (F 2.10%, M 2.04%), but pattern reverses with concentration (women promoted more in competitive markets, less in concentrated ones). This is the key figure.

3. **Survey evidence** -- Include 2--3 survey figures (pick from: `rf_5_6_pay_equity_by_gender_x_orgsize.png`, `rf_5_2_negotiation_funnel_by_gender.png`, `rf_1_7_promotion_perceptions_by_gender.png`). Bullets: women perceive less equity, fewer promotion opportunities, negotiation pipeline leaks.

4. **Next steps / remaining evidence** -- Bullet list of what is still in progress: J2J transition rates, application-to-hire conversion rates, wage growth at promotion, structural elasticity estimates.

Figure paths from `field_exam/`: `../../../../1_Code/figures/[filename]` (verify relative path).

## Success criteria

- [x] Four frames: HHI distribution, promotion gap x concentration, survey evidence, next steps
- [x] Figures render at readable size
- [x] Key numbers from the short proposal cited in bullets
- [x] Next steps slide is honest about what evidence is still missing
- [x] Compiles without errors

## Inputs / relevant files

- `2_Writeup/paper/short_proposal/short_proposal.tex` -- Section 4, lines 132--177
- `1_Code/figures/rf_2_4_hhi_distribution_employment_unweighted.png`
- `1_Code/figures/rf_2_4_hhi_distribution_vacancy_unweighted.png`
- `1_Code/figures/rf_4_3_promotion_by_gender_hhi.png`
- `1_Code/figures/rf_5_6_pay_equity_by_gender_x_orgsize.png`
- `1_Code/figures/rf_5_2_negotiation_funnel_by_gender.png`
- `1_Code/figures/rf_1_7_promotion_perceptions_by_gender.png`

## Branch used

_TBD_

## Compute environment used

Local (LaTeX)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-26 | Inserted 4 evidence slides into Section G | HHI distribution, promotion gap x HHI (key figure), survey pay equity x org size, next steps. Content follows short_proposal Section 4 closely. |
| 2026-04-26 | Compiled | 24 pages (21 main + 3 appendix), no errors. Plots may be iterated later. |

## Outcome

Four preliminary evidence slides inserted. Deck now has 21 main slides + 3 appendix (24 total). User noted plots will likely be iterated.

## Next recommended step

Proceed to `issue3_10` (counterfactuals and appendix slides).

**Important:** After completing this task, post a comment on [Issue #3](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) summarizing what was done.
