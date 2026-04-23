# Market Power and the Gender Career Gap

Evidence from Matched HR Records in Chile

**Author:** Sofia Valdivia, Duke University

## About

This repository contains code, writeup materials, and documentation for a research project studying how labor market power (monopsony) distorts hiring and promotion decisions differently for men and women. It is a submodule of the broader Chile-BUK-CNS project and focuses specifically on gender and labor markets.

**Research question:** Do firms with greater labor market power screen women more aggressively at hiring and offer them fewer promotions — not because of productivity differences, but because women have fewer outside options?

### Key mechanisms

- **Promotion:** Firms face less competitive pressure to promote women because lower outside option rates reduce the retention motive. The model predicts a higher promotion threshold for women (theta_F > theta_M), with the gap increasing in market concentration.
- **Hiring:** Two opposing forces — women's longer expected tenure makes each hire more valuable (lower the bar), but fewer outside options mean firms can cherry-pick (raise the bar). The net effect is an empirical question.

## Data

- **Administrative data (BUK):** HR platform records from 19,000+ Chilean firms (2022--2026), covering 4.7M workers. Includes the full employment pipeline: hiring processes with 2.7M applications, employment contracts, monthly payroll, promotions, and separations.
- **Survey data (Work in Progress 2026):** 6,789 respondents across Chile, Colombia, Mexico, and Peru. Covers job satisfaction, pay equity perceptions, promotion opportunities, burnout, and retention intentions. Open survey; not linkable to admin records.
- **SII tax records:** Firm-level sector classification, sales range, and equity for ~87% of Chilean firms in the platform.

## Repository structure

```
1_Code/          # Analysis code
  descriptives/  #   Survey and admin data descriptive scripts
  figures/       #   Output figures (PNG)
2_Writeup/       # Paper and slides
  paper/         #   Draft proposal (LaTeX)
  slides/        #   Slide deck (LaTeX/PDF)
  descriptives/  #   Model framework notes and descriptive analysis plans
docs/            # Task tracking and documentation
  writeup/       #   Issue-level task files
```

## Related issues

- [#1 — Draft paper proposal](https://github.com/sofiavaldiviac/BUK_sofia/issues/1)
- [#2 — Descriptive plots: motivating evidence for monopsony](https://github.com/sofiavaldiviac/BUK_sofia/issues/2)