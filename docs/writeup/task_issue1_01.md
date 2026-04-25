# Task: Motivation Section

| Field | Value |
|---|---|
| **Task ID** | `issue1_01` |
| **Title** | Write the Motivation section of the draft proposal |
| **Date opened** | 2026-04-22 |
| **GitHub Issue** | [#1 — Draft paper proposal](https://github.com/sofiavaldiviac/BUK_sofia/issues/1) |

## Motivation

The motivation section frames the entire paper. It needs to establish why firm-side frictions — specifically monopsony power — matter for gender career gaps, and why existing research leaves this question unanswered. This is the first thing a reader (or committee member) sees, so it must be crisp and compelling.

## Specific goal

Write a 1.5–2 page motivation section covering:
1. The puzzle: gender gaps persist despite convergence in education and fertility — what's missing?
2. Firm-side decisions (hiring, promotion) as an underexplored channel
3. The monopsony mechanism: fewer outside options → firms extract rents through slower career progression for women
4. Chile as a natural laboratory (low participation, overlapping reforms, BUK data)
5. Preview of the contribution: connecting monopsony to career dynamics at both hiring and promotion margins

## Success criteria

- [ ] Clear statement of the research question
- [ ] Identifies the gap in existing literature (monopsony studied for wages only; career dynamics studied without market structure)
- [ ] Motivates the Chile setting with specific facts (participation rate, wage gap, reforms)
- [ ] Reads as a standalone pitch that makes the reader want to continue

## Inputs / relevant files

- `2_Writeup/slides/main.tex` — slides 2 (motivation), 3 (Chile context), 4 (BUK data)
- `2_Writeup/descriptives/model_framework_monopsony.md` — model motivation and predictions

## Branch used

_TBD_

## Compute environment used

N/A (writing task)

## Status

`in progress`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-22 | First draft written | Created `2_Writeup/paper/main.tex` with motivation section (~7 paragraphs). Matches voice from slides. |
| 2026-04-24 | Revision based on red comments | Addressed all 5 red-text comments in the introduction. See details below. |

## Outcome

First draft of motivation section written in `2_Writeup/paper/main.tex`. Covers: persistent gaps despite education/fertility convergence, firm-side decisions as underexplored channel, retention mechanism for promotions, two opposing forces at hiring, Chile context with reforms, BUK data overview, model preview, and contribution statement. Ready for iteration.

## Revision log (2026-04-24)

Changes made to address red-text comments in the introduction:

1. **Para 1 — `(CITE Papers related)`**: Added `\citep{goldin_grand_2014, blau_gender_2017, kleven_children_2019}` for the wage gap / human capital / motherhood penalty literature. Added corresponding bib entries.

2. **Para 2 — Soften broad claim + add citations**:
   - Softened opening from "has largely treated hiring and promotion as outcomes..." to "has documented hiring and promotion differences without analyzing how the competitive structure of the labor market shapes these firm-side decisions."
   - **Hiring**: Added `\citep{correll_getting_2007, kline_systemic_2022}` alongside Bertrand & Mullainathan. Added brief consensus: "differential treatment often more pronounced for mothers."
   - **Promotions**: Added `\citep{cullen_old_boys, cassidy_promotion_2016}` alongside Benson et al. Rewrote to: "women advance more slowly than men even conditional on performance, with subjective assessments and informal networks accounting for a substantial share of the gap."
   - **Monopsony**: Added `\citep{card_bargaining_2016}` alongside Webber and Sharma.

3. **Chile para — Cite stats + soften firm-side frictions**: Added `\citep{oecd_employment_2024, ine_genero_2024}` (both have PLACEHOLDER notes — verify exact report titles). Replaced "firm-side frictions are a natural candidate" with "While sorting and preferences likely explain part of this gap, the combination of high female education and persistently low participation suggests that demand-side mechanisms --- including firm-side frictions --- deserve closer scrutiny."

4. **Data para — Hiring pipeline**: Changed "observe the hiring pipeline from application to hire" to "observe the hiring pipeline from application through the firm's scoring of each candidate" (cannot yet link to hired workers).

5. **Model para — Ambiguous prediction**: Changed "the data can [maybe respond to?]" to "the data can speak to."

### Bib entries added

- `goldin_grand_2014` — Goldin (2014) "A Grand Gender Convergence" AER 104(4)
- `blau_gender_2017` — Blau & Kahn (2017) "The Gender Wage Gap" JEL 55(3)
- `kleven_children_2019` — Kleven, Landais & Søgaard (2019) "Children and Gender Inequality" AEJ:Applied 11(1)
- `correll_getting_2007` — Correll, Benard & Paik (2007) "Getting a Job" AJS 112(5)
- `oecd_employment_2024` — OECD Employment Outlook [PLACEHOLDER: verify]
- `ine_genero_2024` — INE gender statistics [PLACEHOLDER: verify]

## Next recommended step

After completing this task, proceed to Task `issue1_02` (Literature review), since the motivation frames which literatures to review.

**Important:** After completing this task, post a comment on [Issue #1](https://github.com/sofiavaldiviac/BUK_sofia/issues/1) summarizing what was done.
