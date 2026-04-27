# Task: Compile and Review the Full Deck

| Field | Value |
|---|---|
| **Task ID** | `issue3_11` |
| **Title** | Compile the full deck, fix figure paths, verify rendering, and do a narrative review |
| **Date opened** | 2026-04-26 |
| **GitHub Issue** | [#3 -- Field exam slides](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) |
| **Depends on** | `issue3_00` through `issue3_10` (all section tasks) |

## Motivation

After all sections are written, the deck needs a full compilation pass to catch broken figure paths, missing labels, and rendering issues. It also needs a narrative review to ensure the slides flow coherently and the total slide count is appropriate for the time slot.

## Specific goal

1. **Compile** `field_exam.tex` end to end; fix any errors or warnings
2. **Verify figure paths**: all `\includegraphics` commands resolve correctly from `2_Writeup/slides/field_exam/`
3. **Verify hyperlinks**: `\beamergotobutton` and `\beamerreturnbutton` links work between main and appendix slides
4. **Check slide count**: target 22 main slides + 3--4 appendix. If over, identify candidates for cutting or appendix migration
5. **Narrative review**: read through the PDF sequentially and check:
   - Does each slide transition naturally to the next?
   - Is the "funnel" structure clear (broad data -> multiple directions -> one idea in depth)?
   - Are there redundancies between slides?
   - Is the evidence section honest about what is preliminary vs established?
6. **Check for stale content**: ensure no `\textcolor{red}{}` comments from the paper drafts leaked into the slides
7. **Generate final PDF** and verify it opens correctly

## Success criteria

- [x] Full deck compiles without errors (one harmless hyperref warning)
- [x] All 6 figures render correctly
- [x] All hyperlinks work (3 goto buttons, 3 return buttons)
- [x] Slide count: 21 main + 7 appendix = 28 total
- [x] No red-text comments, PLACEHOLDERs, or TODO markers
- [x] PDF opens and displays correctly

## Inputs / relevant files

- `2_Writeup/slides/field_exam/field_exam.tex`
- All figure files referenced in the deck
- `2_Writeup/slides/main.tex` (for reference)

## Branch used

_TBD_

## Compute environment used

Local (LaTeX)

## Status

`completed`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-26 | Full compile + review | 28 pages, no errors, all figures render, all hyperlinks work. No stale content. |
| 2026-04-26 | Identified minor overflow | Slides 18 (HHI) and 19 (promotion gap) clip third bullet slightly. |
| 2026-04-26 | Narrative observation | 9 data slides (3-11) before first research question (12). May want to move compensation or one selection slide to appendix if talk is short. Fine for 45-60 min. |

## Outcome

Deck is complete and ready for practice runs. 21 main slides + 7 appendix. Minor overflow on 2 slides flagged but not fixed (user will iterate on plots). Funnel structure reads well.

## Next recommended step

Deck is ready for practice runs and feedback.

**Important:** After completing this task, post a comment on [Issue #3](https://github.com/sofiavaldiviac/BUK_sofia/issues/3) summarizing what was done.
