# Task: Model Slides

| Field | Value |
|---|---|
| **Task ID** | `issue3_08` |
| **Title** | Write the five model slides: overview, workers' problem, firm's problem, retention, hiring |
| **Date opened** | 2026-04-26 |
| **GitHub Issue** | [#3 -- Field exam slides](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) |
| **Depends on** | `issue3_00` |

## Motivation

The model section is the core intellectual content of the field exam presentation. Five slides develop the on-the-job search model with hiring and promotion decisions. All five slides already exist in `main.tex` and need only minor adaptation.

## Specific goal

Adapt the five model slides from `main.tex`:
1. **Model overview** (lines 376--415): tikz state diagram (Unemployed -> Junior -> Senior), building blocks (BM98, GW99, Sharma 2023), key parameter lambda_g, four instruments
2. **Workers' problem** (lines 419--446): Bellman equations for unemployment and employment, walk through each term
3. **Firm's problem: two instruments** (lines 449--477): production function (gender-neutral), hiring decision (wage + screening threshold), promotion decision (threshold + senior wage + retention motive)
4. **Firm's problem: optimization** (lines 480--507): profit maximization, three flows (inflow, internal, outflow), steady-state conditions
5. **Retention trade-off** (lines 538--576): two forces (direct profit, retention), men vs women comparison, punchline theta_F > theta_M, link to formal FOC appendix
6. **Hiring mechanism** (lines 579--602): two opposing forces (longer tenure vs less competition), sign is ambiguous, empirical question

The commented-out "model predictions" block (lines 604--635) and "estimation strategy" block (lines 638--687) should NOT be included in the main deck.

## Success criteria

- [x] Three intuitive main slides + three formal appendix slides
- [x] tikz state diagram renders correctly
- [x] Retention trade-off slide has the men/women comparison
- [x] `\beamergotobutton` links to formal model and FOC appendix slides
- [x] `\beamerreturnbutton` links back from all appendix slides
- [x] No equations in main deck; all formal content in appendix
- [x] Compiles without errors

## Inputs / relevant files

- `2_Writeup/slides/main.tex` -- lines 376--602 (model slides)
- `2_Writeup/slides/presentation_script.md` -- model slide notes

## Branch used

_TBD_

## Compute environment used

Local (LaTeX)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-26 | Revised approach per user feedback | User wants mechanism-focused slides, not technical. Followed short_proposal model section framing instead of main.tex Bellman equations. |
| 2026-04-26 | Inserted 3 main slides into Section F | (1) Model overview with tikz diagram + intuitive bullets, (2) Promotion mechanism with men/women columns, (3) Hiring mechanism with two opposing forces. No equations in main deck. |
| 2026-04-26 | Inserted 3 appendix slides | Workers' problem (Bellman), Firm's optimization (steady-state), Formal FOC (two-period). All with return buttons. |
| 2026-04-26 | Compiled | 20 pages (17 main + 3 appendix), no errors. |

## Outcome

Model section restructured: 3 intuitive main slides walking through mechanisms + 3 formal appendix slides for backup. Deck now has 17 main slides + 3 appendix slides.

## Next recommended step

Proceed to `issue3_09` (preliminary evidence slides).

**Important:** After completing this task, post a comment on [Issue #3](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) summarizing what was done.
