# Task: Plot 3.3 — Referral Source Composition by Candidate Gender

| Field | Value |
|---|---|
| **Task ID** | `issue2_18` |
| **Title** | Plot referral source composition by candidate gender |
| **Date opened** | 2026-04-23 |
| **GitHub Issue** | [#2 — Descriptive plots](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) |
| **Depends on** | None |

## Motivation

How candidates reach the firm matters for screening. If women come through different channels (e.g., more through external job portals, fewer through referrals), this could explain part of the conversion gap independently of firm discrimination. It also connects to the "old boys' network" literature (Cullen).

## Specific goal

Produce a stacked or grouped bar chart of referral source by candidate gender:
- Source categories from `do_application` (e.g., referral, external portal, job board, internal, other)
- Two bars: male vs. female
- Y-axis: share of applications from each source
- Filter to Chile
- Report N per source x gender

## Success criteria

- [ ] Referral source variable correctly identified and categorized
- [ ] Gender differences in channel usage clearly visible
- [ ] N per source x gender reported
- [ ] Chile filter applied
- [ ] Saved to `5_Output/descriptives/`

## Inputs / relevant files

- `do_application` — application records with source/referral field (Databricks)
- `do_candidate` — candidate gender (Databricks)

## Branch used

_TBD_

## Compute environment used

Databricks (PySpark/Python)

## Status

`done`

## Action log

| Date | Action | Notes |
|---|---|---|
| 2026-04-24 | Plot created in `reducedform_admin.py` | Grouped horizontal bar chart. 10 referral sources shown (>=0.5% threshold). Local CSV data, Chile filter. |

## Outcome

Grouped bar chart of referral source composition by gender (Chile, N=380,536 female + 533,429 male applications with source). Top channels: Company Portal (~30%), External (~22-25%), Trabajando.com (~23-24%). Gender differences are small — women slightly more via Company Portal, men slightly more via External. Employee Referral is tiny (<1%) and skews male. Trust level: High. Evidence: `1_Code/figures/rf_3_3_referral_source_by_gender.png`. Next action: proceed to issue2_19.

## Next recommended step

Proceed to `issue2_19` (Plot 3.4: entry wage by gender).

**Important:** After completing this task, post a comment on [Issue #2](https://github.com/sofiavaldiviac/BUK_sofia/issues/2) summarizing what was done.
