# Task: Model Framework Write-Up

| Field | Value |
|---|---|
| **Task ID** | `issue1_06` |
| **Title** | Write the model framework section of the draft proposal |
| **Date opened** | 2026-04-22 |
| **GitHub Issue** | [#1 — Draft paper proposal](https://github.com/sofiavaldiviac/BUK_sofia/issues/1) |

## Motivation

The model framework is the theoretical backbone of the paper. The detailed notes in `model_framework_monopsony.md` and the slides contain all the ingredients, but they need to be translated into a coherent, proposal-ready write-up that a reader can follow without the notes. This section should rationalize the stylized facts established in Task 05 (reduced form evidence).

## Specific goal

Write a 3–4 page model section covering:
1. **Environment** — continuous time, steady state, two worker types (M/F), heterogeneous firms, two job levels
2. **Workers' problem** — value of unemployment, value of employment at each level, on-the-job search with gender-specific offer arrival rates (λ_F < λ_M)
3. **Firm's problem** — two decisions:
   - **Hiring**: entry wage + screening threshold q*_g (trade-off: quality vs. quantity)
   - **Promotion**: promotion threshold θ_g (trade-off: output gain vs. wage cost, mediated by retention motive)
4. **Steady-state workforce** — flow equations for juniors and seniors
5. **Key mechanism: the retention trade-off** — why θ_F* > θ_M* (intuitive + formal two-period version)
6. **Hiring mechanism: two opposing forces** — "longer tenure" vs. "less competition" (ambiguous sign, empirical question)
7. **Main predictions** — promotion gap increases with market power; hiring screening is empirically testable; reinforcing cycle
8. **Connection to reduced form facts** — map each model prediction to the stylized facts from Task 05

## Success criteria

- [ ] Model is self-contained and readable without the notes
- [ ] Key equations presented with intuitive explanations
- [ ] Gender-neutral production function highlighted (gap comes from market structure, not productivity)
- [ ] Predictions clearly stated and linked to the reduced form evidence from Task 05
- [ ] Theoretical ambiguity on hiring margin honestly presented as a contribution

## Inputs / relevant files

- `2_Writeup/descriptives/model_framework_monopsony.md` — full model notes, derivations, reading list
- `2_Writeup/slides/main.tex` — slides 12–17 (model overview through hiring mechanism)
- `docs/writeup/task_issue1_05.md` — reduced form stylized facts that the model must rationalize

## Branch used

_TBD_

## Compute environment used

N/A (writing task)

## Status

`in progress`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Wrote full model section in `2_Writeup/paper/main.tex` | Covers environment, workers, firms (hiring + promotion + separations + steady state + profit max), promotion mechanism, hiring mechanism, and predictions. Full steady-state model only (no two-period simplification). No FOCs yet. Forward-looking placeholders for reduced form fact references (to be filled after Task 05). |

## Outcome

First draft of model section written. Remaining work: (1) fill in reduced form fact cross-references once Task 05 is complete, (2) derive and add FOCs if needed for later drafts, (3) review and iterate.

## Next recommended step

After completing this task, proceed to Task `issue1_07` (Assemble full draft).

**Important:** After completing this task, post a comment on [Issue #1](https://github.com/sofiavaldiviac/BUK_sofia/issues/1) summarizing what was done.
