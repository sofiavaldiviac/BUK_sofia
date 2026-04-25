# Survey Plot Ideas: BUK WiP 2026 (Chile Only)

**Data**: `Base de datos WiP 2026.xlsx`, sheet "Base de datos WiP"
**Filter**: Country = Chile (N=1,235)
**Purpose**: Motivate research directions on gender, family policy, and labor markets in Chile

---

## Section 0: Available Heterogeneity Dimensions

### Feasible Dimensions (directly in the data)

| Dimension | Variable | Categories |
|-----------|----------|------------|
| **Gender** | `¿Con qué género te identificas?` | Femenino, Masculino, Otro |
| **Income tier** | `ingreso mensual líquido...` (CLP brackets) | Hasta $550K, $550-750K, $750K-1.05M, $1.05-1.5M, $1.5-2M, $2-2.8M, $2.8-4M, Más de $4M |
| **Age / Generation** | `¿Cuál es tu año de nacimiento?` (_rec2 likely has generation categories) | Gen Z (13-28), Millennials (29-44), Gen X (45-60), Boomers (61-79) |
| **Role** | `¿Cómo definirías tu rol dentro de la organización?` | Dueño/Socio, Alta Dirección, Jefaturas, Profesional Especializado, Técnico, Apoyo Administrativo, Operativo |
| **Leadership** | `¿Cuántas personas tienes directamente a tu cargo?` | Leader (>0 direct reports) vs Non-leader (0) |
| **Organization size** | `¿Cuántos colaboradores hay en tu organización?` | Varies (can bucket: <20, 20-49, 50-199, 200+) |
| **Work schedule** | `¿Qué tipo de jornada tienes?` | Jornada completa, Jornada parcial, Turnos/excepcional |
| **Remote work** | `¿Tienes la posibilidad de trabajar de manera remota/teletrabajar?` | No, 1-2 days/wk, 3-4 days/wk, 100% remoto |
| **Hourly flexibility** | `¿Qué nivel de flexibilidad horaria tienes?` | Scale (check _rec1 for numeric) |
| **Tenure** | `¿Cuánto tiempo llevas en tu trabajo actual?` | Check categories in _rec1 |
| **Employment type** | Dependent (main section) vs Independent (`.1` suffix columns) | Employee vs Self-employed |
| **Disability** | `¿Tienes alguna discapacidad?` | Sí / No |
| **Sexual orientation** | `¿Te consideras...?` | Categories in data |

### Aspirational Dimensions (not directly available)

| Dimension | Proxy | Limitation |
|-----------|-------|------------|
| **Parental status** | Age × Gender interaction (mothers vs childless women approximated by age 30-44 women vs <30 women) | Imprecise; many childless women in 30-44 range |
| **Parental status** | Work-life interference frequency as proxy for caregiving burden | Captures broader family/personal demands, not just children |
| **Marital status** | Not available, no proxy | -- |
| **Sector / Industry** | Not available | -- |
| **Firm-level gender composition** | Not available | Key for Art. 203 analysis; need admin data |

### Notation

Throughout this document:
- **[F]** = Feasible heterogeneity (directly in data)
- **[A]** = Aspirational heterogeneity (needs proxy or additional data)
- **Interaction** = Cross two dimensions (e.g., gender × income = separate bars for women-low, women-high, men-low, men-high)

---

## Section 1: Replicating BUK Report Plots (Chile Only)

These plots mirror the figures in *Radiografía: Mujeres en el Trabajo 2026*, but computed solely for the Chilean subsample. The original report shows Chile as one point in a cross-country comparison; here we go deeper within Chile.

---

### 1.1 Wage Gap Perceptions

#### Plot 1.1a: Perceived Gender Wage Equality by Gender
**Question**: Do Chilean men and women perceive equal pay in their organizations?
**Variable(s)**: `En mi organización, hombres y mujeres reciben el mismo salario cuando ocupan puestos de igual responsabilidad.` (_rec1 or _rec2 for numeric)
**Plot type**: Grouped bar (% agreeing, by gender)
**Feasible heterogeneities**: gender [F], income tier [F], role [F], leadership [F], org size [F], age/generation [F], work schedule [F], remote work [F], tenure [F]
**Key interactions**: gender × income, gender × role, gender × leadership, gender × org size, gender × age
**Connection**: Research Directions 3a (wage renegotiation), 1a (Sala Cuna)

#### Plot 1.1b: Perceived Gender Wage Equality by Income Tier
**Question**: Does the perception gap widen at higher incomes (as in the BUK report)?
**Variable(s)**: Same as 1.1a, crossed with income
**Plot type**: Grouped bar, x-axis = income tier, bars = gender
**Feasible heterogeneities**: gender × income [F], adding leadership [F], role [F], age [F]
**Connection**: Research Direction 3a (glass ceiling in renegotiation)

#### Plot 1.1c: Perceived Gender Wage Equality by Role
**Question**: Do women in leadership perceive larger gaps than women in operational roles?
**Variable(s)**: Same as 1.1a, crossed with role
**Plot type**: Horizontal grouped bar, y-axis = role categories, bars = gender
**Feasible heterogeneities**: gender × role [F], adding income [F], org size [F]
**Connection**: Research Directions 3a, 4a (firm heterogeneity)

#### Plot 1.1d: Perception of Organizational Action on Wage Gap
**Question**: Do women believe their employer takes effective action to reduce gender pay gaps?
**Variable(s)**: `En mi organización se implementan medidas efectivas para reducir posibles diferencias salariales entre hombres y mujeres.` (_rec1 or _rec2)
**Plot type**: Grouped bar (% agreeing, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], remote [F], tenure [F]
**Key interactions**: gender × income, gender × org size, gender × leadership
**Connection**: Research Direction 4b (HR practices and gender equity)

#### Plot 1.1e: Wage Equality Perception by Presence of Formal Salary Adjustments
**Question**: Do formal adjustment policies improve perceptions of equity?
**Variable(s)**: Wage equality perception × `Durante el 2025, ¿Tu organización realizó algún ajuste general de las remuneraciones?`
**Plot type**: Stacked bar (perception distribution) for "adjustment yes" vs "adjustment no", by gender
**Feasible heterogeneities**: gender [F], income [F], org size [F]
**Connection**: Research Direction 4b (HR policies)

#### Plot 1.1f: Compensation Evaluation vs Sector Peers
**Question**: Do women rate their compensation lower relative to sector peers?
**Variable(s)**: `¿Cómo evaluarías las remuneraciones de tu organización en relación con otras del mismo sector y tamaño?` (_rec1)
**Plot type**: Grouped bar by gender
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], tenure [F]
**Key interactions**: gender × income, gender × role
**Connection**: Research Direction 3c (monopsony and outside options)

---

### 1.2 Salary Negotiations & Raise Requests

#### Plot 1.2a: Share Who Requested a Raise (Last 2 Years)
**Question**: Do Chilean women ask for raises at the same rate as men?
**Variable(s)**: `¿Has pedido un aumento de salario en los últimos 2 años?`
**Plot type**: Grouped bar (% yes, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], work schedule [F], remote [F], tenure [F], flexibility [F]
**Key interactions**: gender × income, gender × leadership, gender × age, gender × org size, gender × work schedule
**Aspirational interactions**: gender × parental status [A] (proxy: age 30-44 women vs <30 women)
**Connection**: Research Direction 3a (mothers vs fathers ask margin)

#### Plot 1.2b: Negotiation Before Accepting Job Offer
**Question**: Do women negotiate less before accepting a job?
**Variable(s)**: `¿Cuál de las siguientes afirmaciones describe mejor tu situación?` (accepted vs negotiated)
**Plot type**: Stacked bar (% negotiated vs % accepted as-is, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], age [F], tenure [F]
**Key interactions**: gender × income, gender × age, gender × role
**Connection**: Research Direction 3a (bargaining dynamics)

#### Plot 1.2c: Success Rate Among Those Who Asked for Raise
**Question**: Conditional on asking, are women equally successful?
**Variable(s)**: `¿Cuál fue el resultado de tu solicitud de aumento de salario?` (_rec1), filtered to those who asked
**Plot type**: Grouped bar (% successful, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], tenure [F]
**Key interactions**: gender × income, gender × leadership, gender × org size, gender × age
**Aspirational interactions**: gender × parental status [A]
**Connection**: Research Direction 3a (success margin)

#### Plot 1.2d: Reasons for Raise Denial
**Question**: Are women given different reasons for denial than men?
**Variable(s)**: Columns 212-223 (market alignment, band ceiling, recent adjustment, performance, budget, other)
**Plot type**: Horizontal grouped bar (% citing each reason, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F]
**Key interactions**: gender × income, gender × role
**Connection**: Research Direction 3a, 3c (do firms exploit mothers' lower outside options?)

#### Plot 1.2e: Full Raise Request Funnel by Gender
**Question**: Where in the pipeline do women lose out? (Ask → Success → Amount)
**Variable(s)**: Combine cols 207, 208, 209
**Plot type**: Funnel chart or waterfall: % who asked → % who succeeded → (if available) amount
**Feasible heterogeneities**: gender [F], income [F], leadership [F], age [F]
**Key interactions**: gender × income, gender × age
**Connection**: Research Direction 3a (decomposing ask vs success margins)

---

### 1.3 Promotions & Meritocracy

#### Plot 1.3a: Promotion Opportunities Description
**Question**: How do women vs men characterize promotion opportunities?
**Variable(s)**: `En tu organización ¿Qué afirmación describe mejor las oportunidades de promoción o ascenso?` (_rec1)
**Plot type**: Stacked bar (distribution of responses, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], tenure [F]
**Key interactions**: gender × role, gender × org size, gender × tenure
**Connection**: Research Direction 4b (HR practices)

#### Plot 1.3b: Performance-Based Promotions Frequency
**Question**: Do women perceive promotions as merit-based?
**Variable(s)**: `¿Con qué frecuencia las promociones o ascensos toman en consideración la evaluación de desempeño?` (_rec1/_rec2/_rec3)
**Plot type**: Grouped bar (% saying "siempre/muchas veces", by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F]
**Key interactions**: gender × leadership (BUK report shows gap widens for leaders), gender × income
**Connection**: Research Direction 4b (meritocracy credibility)

#### Plot 1.3c: Satisfaction with Promotion Possibilities
**Question**: Are women less satisfied with their career advancement prospects?
**Variable(s)**: `Tus posibilidades de promoción y crecimiento profesional` (_rec1/_rec2)
**Plot type**: Grouped bar (% satisfied/very satisfied, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], remote [F], work schedule [F], tenure [F]
**Key interactions**: gender × age (do younger women start optimistic and become pessimistic?), gender × leadership, gender × tenure
**Aspirational**: gender × parental status [A]
**Connection**: Research Directions 3a, 4a, 5a (career cost of fertility timing)

#### Plot 1.3d: Satisfaction with Recognition
**Question**: Do women feel less recognized for their work?
**Variable(s)**: `Reconocimiento que obtienes por el trabajo bien hecho` (_rec1/_rec2)
**Plot type**: Grouped bar (% satisfied, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], age [F], tenure [F], org size [F]
**Key interactions**: gender × role, gender × tenure
**Connection**: Research Direction 4b (HR practices)

---

### 1.4 Training & Capacity Building

#### Plot 1.4a: Training Access (Organization-Financed)
**Question**: Do women access employer-funded training at the same rate?
**Variable(s)**: `Durante los últimos 12 meses ¿Has completado o estás en proceso de completar una capacitación impartida y/o financiada por tu organización?` (_rec1)
**Plot type**: Grouped bar (% yes, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], work schedule [F], remote [F], tenure [F]
**Key interactions**: gender × income (BUK report: gap concentrated at middle income), gender × leadership, gender × work schedule
**Connection**: Research Direction 4b (HR investment in female workers)

#### Plot 1.4b: Training Topics by Gender
**Question**: What skills do women vs men get trained on?
**Variable(s)**: Cols 72-95 (leadership, communication, teamwork, time management, technical, digital transformation, AI, wellbeing, diversity, problem-solving, customer service, languages)
**Plot type**: Horizontal grouped bar (% trained in each area, by gender)
**Feasible heterogeneities**: gender [F], income [F], leadership [F], role [F]
**Key interactions**: gender × leadership (are women leaders trained differently than men leaders?)
**Connection**: Research Direction 4b (differential human capital investment)

#### Plot 1.4c: Perceived Training Effectiveness
**Question**: Do women perceive lower returns to training?
**Variable(s)**: Cols 98-111 (updated skills, productivity, growth opportunities, motivation, confidence, work quality, no positive effect)
**Plot type**: Horizontal grouped bar (% reporting each effect, by gender)
**Feasible heterogeneities**: gender [F], income [F], leadership [F], role [F], org size [F]
**Key interactions**: gender × leadership (BUK report: gap larger for non-leaders)
**Connection**: Research Direction 4b (differential returns to HR investment)

#### Plot 1.4d: Desired Future Training Areas
**Question**: What do women want to learn vs what they're offered?
**Variable(s)**: Cols 112-129 (technical, soft skills, leadership, productivity, internal processes, products, digital/AI, other, no interest)
**Plot type**: Horizontal grouped bar (% interested in each, by gender)
**Feasible heterogeneities**: gender [F], income [F], leadership [F], age [F]
**Connection**: Research Direction 4b, 8e (amenities vs wages)

#### Plot 1.4e: Training Gap — What's Offered vs What's Desired
**Question**: Is there a mismatch between training received and training wanted, and does it differ by gender?
**Variable(s)**: Compare cols 72-95 (received) vs cols 112-129 (desired)
**Plot type**: Paired dot plot or divergence bar (gap between received % and desired %, by gender)
**Feasible heterogeneities**: gender [F], income [F], leadership [F]
**Connection**: Research Direction 4b

---

### 1.5 Productivity Barriers

#### Plot 1.5a: Factors Negatively Affecting Productivity by Gender
**Question**: Do women face different productivity barriers?
**Variable(s)**: Cols 139-152 (interruptions, planning, motivation, incentives, tools, communication, overload/stress)
**Plot type**: Horizontal grouped bar (% citing each factor, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], work schedule [F], remote [F]
**Key interactions**: gender × work schedule (are part-time women more affected by stress?), gender × remote (does remote work reduce interruptions but increase isolation?)
**Connection**: Research Directions 2a, 2b (flexibility mandates), 4b (firm practices)

---

## Section 2: Plots Motivating Research Questions

---

### 2.1 Childcare Mandates & Cost of Female Labor (Research Directions 1a, 1b)

#### Plot 2.1a: Benefits Adequacy by Gender and Organization Size
**Question**: Do women in small firms (<20 employees, below Sala Cuna threshold) report worse benefit adequacy?
**Variable(s)**: `¿Crees que los beneficios ofrecidos por tu organización se adecúan a tus necesidades?` (_rec1/_rec2) × org size
**Plot type**: Grouped bar, x-axis = org size buckets (<20, 20-49, 50-199, 200+), bars = gender
**Feasible heterogeneities**: gender × org size [F], adding income [F], age [F], work schedule [F]
**Key interaction**: gender × org size (testing if the 20-worker Sala Cuna threshold creates a visible discontinuity in benefit satisfaction)
**Connection**: Research Direction 1a (Art. 203 threshold effects on worker welfare)

#### Plot 2.1b: Childcare/Benefits Importance as Job Attribute by Gender
**Question**: How important are "beneficios laborales (seguro médico, guardería, almuerzo)" for women vs men?
**Variable(s)**: `Beneficios laborales (seguro médico, guardería, almuerzo)` (_rec1)
**Plot type**: Grouped bar (% ranking as important/very important, by gender)
**Feasible heterogeneities**: gender [F], income [F], age [F], org size [F], work schedule [F]
**Key interactions**: gender × age (do women 25-40 value childcare benefits more?), gender × org size
**Aspirational**: gender × parental status [A] (proxy: age 30-44 women)
**Connection**: Research Direction 1a, 1b (Sala Cuna as labor cost)

#### Plot 2.1c: Offer Organization Benefits by Org Size and Gender
**Question**: Do small firms (<20) offer fewer benefits, and does this disproportionately affect women?
**Variable(s)**: `¿Tu organización ofrece beneficios laborales a sus colaboradores?` (_rec1) × org size
**Plot type**: Grouped bar, x-axis = org size buckets, bars = gender
**Feasible heterogeneities**: gender × org size [F]
**Connection**: Research Direction 1a (small firm disadvantage below Sala Cuna threshold)

#### Plot 2.1d: Salary Satisfaction by Org Size and Gender
**Question**: Are women in small firms less satisfied with salary (consistent with wage pass-through of mandates)?
**Variable(s)**: `Tu salario` (_rec1/_rec2) × org size
**Plot type**: Grouped bar (% satisfied, by gender), x-axis = org size
**Feasible heterogeneities**: gender × org size [F], adding income [F], role [F]
**Connection**: Research Direction 1a (wage pass-through)

---

### 2.2 Flexibility Mandates & Worker Sorting (Research Directions 2a, 2b, 2c)

#### Plot 2.2a: Remote Work Access by Gender
**Question**: Do women have equal access to remote/hybrid work?
**Variable(s)**: `¿Tienes la posibilidad de trabajar de manera remota/teletrabajar?`
**Plot type**: Stacked bar (distribution: no / 1-2 days / 3-4 days / 100%, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], org size [F], age [F], work schedule [F]
**Key interactions**: gender × income, gender × role, gender × org size
**Aspirational**: gender × parental status [A]
**Connection**: Research Direction 2a (Law 21.645 — flexibility access)

#### Plot 2.2b: Hourly Flexibility by Gender
**Question**: Do women have more or less control over their work hours?
**Variable(s)**: `¿Qué nivel de flexibilidad horaria tienes en tu trabajo para organizar tus horas de trabajo?` (_rec1)
**Plot type**: Grouped bar (distribution of flexibility levels, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], org size [F], age [F], work schedule [F]
**Key interactions**: gender × age (do mothers-age women have less flexibility?), gender × role
**Connection**: Research Direction 2a

#### Plot 2.2c: Flexibility Satisfaction by Gender
**Question**: Are women more or less satisfied with their flexibility/telework arrangements?
**Variable(s)**: `Flexibilidad laboral, en términos de teletrabajo y horario flexible` (_rec1/_rec2)
**Plot type**: Grouped bar (% satisfied/very satisfied, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], org size [F], age [F], remote [F], work schedule [F], flexibility [F]
**Key interactions**: gender × remote (satisfaction conditional on actual access), gender × work schedule, gender × age
**Connection**: Research Direction 2a, 2b

#### Plot 2.2d: Work Schedule Type by Gender
**Question**: Are women disproportionately in part-time or shift work?
**Variable(s)**: `¿Qué tipo de jornada tienes en tu trabajo actual?`
**Plot type**: Stacked bar (% full-time / part-time / shifts, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], org size [F], age [F]
**Connection**: Research Direction 2c (firm evasion via reclassification)

#### Plot 2.2e: Flexibility Valuation as Job Attribute by Gender
**Question**: Do women value flexibility more when choosing/staying in a job?
**Variable(s)**: `Flexibilidad laboral` (_rec1) (job attribute importance ranking)
**Plot type**: Grouped bar (% ranking high, by gender)
**Feasible heterogeneities**: gender [F], income [F], age [F], work schedule [F], remote [F]
**Key interactions**: gender × age, gender × income
**Aspirational**: gender × parental status [A]
**Connection**: Research Direction 2a, 8e (compensating differentials — do women accept lower wages for flexibility?)

#### Plot 2.2f: Remote/Hybrid Work Valuation as Job Attribute by Gender
**Question**: Do women value remote work options more?
**Variable(s)**: `Posibilidad de trabajar de forma remota o híbrida` (_rec1)
**Plot type**: Grouped bar (% ranking high, by gender)
**Feasible heterogeneities**: gender [F], income [F], age [F], role [F], work schedule [F]
**Connection**: Research Direction 2a, 8e

#### Plot 2.2g: Flexibility Access vs Satisfaction Scatter (Gender-colored)
**Question**: Is there a disconnect between having flexibility and being satisfied with it?
**Variable(s)**: Remote work access × flexibility satisfaction, colored by gender
**Plot type**: Scatter plot or bubble chart (x = flexibility level, y = satisfaction, color = gender)
**Connection**: Research Direction 2a

---

### 2.3 Wage Renegotiation & Bargaining Dynamics (Research Directions 3a, 3b, 3c)

#### Plot 2.3a: Raise Request Rate by Gender × Age
**Question**: Do women reduce raise requests during peak childbearing years (proxy for motherhood)?
**Variable(s)**: `¿Has pedido un aumento de salario en los últimos 2 años?` × age/generation
**Plot type**: Line plot, x-axis = age group, y-axis = % requesting raise, lines = gender
**Feasible heterogeneities**: gender × age [F], adding income [F], leadership [F]
**Aspirational**: gender × parental status [A]
**Connection**: Research Direction 3a, 3b (timing of negotiations around life events)

#### Plot 2.3b: Raise Request Rate by Gender × Income
**Question**: Does the ask gap differ across the income distribution?
**Variable(s)**: Same × income tier
**Plot type**: Grouped bar, x-axis = income tier, bars = gender
**Feasible heterogeneities**: gender × income [F], adding leadership [F], age [F], role [F]
**Connection**: Research Direction 3a, 3c (monopsony interacts with income)

#### Plot 2.3c: Raise Success Rate by Gender × Age
**Question**: Are younger women more or less successful than older women when they ask?
**Variable(s)**: `¿Cuál fue el resultado de tu solicitud de aumento de salario?` (_rec1) × age, filtered to askers
**Plot type**: Line plot, x-axis = age group, y-axis = % successful, lines = gender
**Feasible heterogeneities**: gender × age [F], adding income [F], role [F]
**Connection**: Research Direction 3a (success margin varies with age/lifecycle)

#### Plot 2.3d: Raise Success by Gender × Organization Size
**Question**: Do women fare worse in larger firms (more bureaucratic) or smaller firms (more discretionary)?
**Variable(s)**: Success rate × org size
**Plot type**: Grouped bar, x-axis = org size, bars = gender
**Feasible heterogeneities**: gender × org size [F], adding income [F], role [F]
**Connection**: Research Direction 3c (monopsony — larger firms may have more market power)

#### Plot 2.3e: Raise Denial Reasons by Gender × Income
**Question**: Are high-income women more likely to be told they're at the "band ceiling" while men get "budget" reasons?
**Variable(s)**: Cols 212-223 × income
**Plot type**: Heatmap (reason × gender × income tier, cell = % cited)
**Feasible heterogeneities**: gender × income [F], gender × role [F]
**Connection**: Research Direction 3a (mechanisms of pay ceiling)

#### Plot 2.3f: Pre-Hire Negotiation by Gender × Age
**Question**: Do younger women negotiate more (generational shift) or less (less experience)?
**Variable(s)**: Col 208 × age
**Plot type**: Grouped bar, x-axis = generation, bars = gender (% who negotiated)
**Feasible heterogeneities**: gender × age [F], gender × income [F], gender × role [F]
**Connection**: Research Direction 3a

#### Plot 2.3g: Raise Request × Meritocracy Belief Interaction
**Question**: Do women who believe in meritocracy ask more? Is the gender gap in asking concentrated among those who distrust the system?
**Variable(s)**: Col 207 × cols 155-158 (meritocracy perception)
**Plot type**: Grouped bar: % requesting raise, by gender × meritocracy belief (high/low)
**Feasible heterogeneities**: gender × meritocracy perception [F]
**Connection**: Research Direction 3a, 4b (system credibility affects bargaining behavior)

---

### 2.4 Monopsony, Sorting & Firm Heterogeneity (Research Directions 4a, 4b)

#### Plot 2.4a: Gender Gaps Across All Satisfaction Dimensions by Org Size
**Question**: Are gender gaps in satisfaction larger in small vs large firms?
**Variable(s)**: All satisfaction items (cols 177-197: recognition, promotion, salary, flexibility, diversity, workload, overall) × org size
**Plot type**: Heatmap (satisfaction dimension × org size, cell = female-male gap in % satisfied)
**Feasible heterogeneities**: org size [F], adding income [F], role [F]
**Connection**: Research Direction 4a (first employer shapes trajectories), 4b (HR practice heterogeneity)

#### Plot 2.4b: Raise Success Rate × Org Size × Gender (Monopsony Proxy)
**Question**: Is the gender gap in raise success larger in firms where workers have fewer outside options?
**Variable(s)**: Success rate × org size × gender
**Plot type**: Line plot, x-axis = org size, lines = gender
**Feasible heterogeneities**: gender × org size [F], adding income [F]
**Connection**: Research Direction 3c (monopsony amplifies bargaining disadvantage)

#### Plot 2.4c: Turnover Intention by Gender × Org Size
**Question**: Are women in small firms more likely to want to leave (or less, because of fewer options)?
**Variable(s)**: `¿Cuál de las siguientes afirmaciones es la que mejor describe tu deseo de mantenerte o cambiar de trabajo?` (_rec1/_rec2) × org size
**Plot type**: Grouped bar, x-axis = org size, bars = gender (% wanting to change)
**Feasible heterogeneities**: gender × org size [F], adding income [F], role [F], age [F]
**Connection**: Research Direction 4a, 3c (mobility constraints)

#### Plot 2.4d: HR Software Usage by Org Size and Gender Outcomes
**Question**: Do firms using HR software (BUK) show smaller gender gaps? (Proxy for HR formalization)
**Variable(s)**: Cols 30-33 (HR software use, BUK use) × satisfaction/raise outcomes × gender
**Plot type**: Grouped bar: outcomes by gender, split by HR software presence
**Feasible heterogeneities**: gender × HR software [F], adding org size [F]
**Connection**: Research Direction 4b (HR formalization reduces discretion)

---

### 2.5 Fertility & Career Trajectories (Research Directions 5a-5e)

*Note: No direct fertility/children variable. All plots here use age × gender as proxy for lifecycle effects.*

#### Plot 2.5a: Career Satisfaction by Gender × Age (Lifecycle Trajectory)
**Question**: Does the gender gap in career satisfaction widen during childbearing years?
**Variable(s)**: `Tus posibilidades de promoción y crecimiento profesional` (_rec1/_rec2) × age
**Plot type**: Line plot, x-axis = age group, y-axis = % satisfied, lines = gender
**Feasible heterogeneities**: gender × age [F], adding income [F], role [F], leadership [F]
**Aspirational**: gender × parental status [A]
**Connection**: Research Direction 5a (career cost of fertility timing)

#### Plot 2.5b: Overall Job Satisfaction by Gender × Age
**Question**: Do women's satisfaction trajectories diverge from men's in their 30s?
**Variable(s)**: `Tu trabajo en general` (_rec1/_rec2) × age
**Plot type**: Line plot, x-axis = age group, y-axis = % satisfied, lines = gender
**Feasible heterogeneities**: gender × age [F], adding income [F], work schedule [F]
**Connection**: Research Direction 5a

#### Plot 2.5c: Salary Satisfaction by Gender × Age
**Question**: Does the gender salary satisfaction gap open during prime fertility years?
**Variable(s)**: `Tu salario` (_rec1/_rec2) × age
**Plot type**: Line plot, x-axis = age group, y-axis = % satisfied, lines = gender
**Feasible heterogeneities**: gender × age [F], adding income [F], role [F]
**Connection**: Research Direction 5a

#### Plot 2.5d: Burnout by Gender × Age
**Question**: Are women in their 30s-40s (dual burden of career + caregiving) more burned out?
**Variable(s)**: `Durante 2025, ¿con qué frecuencia experimentaste burnout?` (_rec1/_rec2/_rec3) × age
**Plot type**: Line plot, x-axis = age group, y-axis = % frequent/always burnout, lines = gender
**Feasible heterogeneities**: gender × age [F], adding income [F], work schedule [F], remote [F]
**Aspirational**: gender × parental status [A]
**Connection**: Research Direction 5a, 6a (dual-burden of career and caregiving)

#### Plot 2.5e: Raise Request Rate Lifecycle Profile
**Question**: Do women reduce negotiation effort during peak caregiving years?
**Variable(s)**: `¿Has pedido un aumento de salario en los últimos 2 años?` × age × gender
**Plot type**: Line plot, x-axis = age group, y-axis = % asking, lines = gender
**Feasible heterogeneities**: gender × age [F], adding income [F], leadership [F]
**Connection**: Research Direction 3b (timing of negotiations around life events)

#### Plot 2.5f: Training Access by Gender × Age
**Question**: Do women in their 30s get less employer-funded training?
**Variable(s)**: Training access (col 70/_rec1) × age × gender
**Plot type**: Line plot, x-axis = age group, y-axis = % trained, lines = gender
**Feasible heterogeneities**: gender × age [F], adding income [F], role [F], leadership [F]
**Connection**: Research Direction 5a (employer disinvestment during childbearing years)

---

### 2.6 Work-Life Balance & Household Decisions (Research Directions 6a, 7a-7c)

#### Plot 2.6a: Work-Life Interference Frequency by Gender
**Question**: Do women report more work-family interference?
**Variable(s)**: `Sentiste que el trabajo interfirió con tu vida personal o familiar.` (_rec1/_rec2/_rec3)
**Plot type**: Grouped bar (distribution: nunca to siempre, by gender)
**Feasible heterogeneities**: gender [F], income [F], age [F], role [F], leadership [F], work schedule [F], remote [F], flexibility [F], org size [F], tenure [F]
**Key interactions**: gender × work schedule (part-time women: less interference?), gender × remote, gender × age, gender × income
**Aspirational**: gender × parental status [A]
**Connection**: Research Direction 6a (spousal specialization), 7a (housing/dual income constraint)

#### Plot 2.6b: All Boundary Violation Items by Gender
**Question**: Which boundary violations are gendered?
**Variable(s)**: Cols 270-297 (overtime, weekend work, vacation work, after-hours availability, thinking about work after hours, before sleep, work-life interference) — use _rec2 or _rec3 for numeric
**Plot type**: Radar/spider chart or horizontal grouped bar (mean frequency per item, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], work schedule [F], remote [F], age [F]
**Key interactions**: gender × work schedule, gender × remote, gender × leadership
**Connection**: Research Directions 2b (40-hour workweek), 6a

#### Plot 2.6c: Overtime Work by Gender × Work Schedule
**Question**: Do part-time women still work overtime? (Suggesting the "part-time" label masks full-time hours)
**Variable(s)**: `Trabajaste más horas de las habituales` (_rec2/_rec3) × work schedule
**Plot type**: Grouped bar, x-axis = schedule type, bars = gender (% frequent/always)
**Feasible heterogeneities**: gender × work schedule [F], adding income [F], role [F], org size [F]
**Connection**: Research Direction 2c (firm evasion — part-time in name only)

#### Plot 2.6d: Burnout Frequency by Gender
**Question**: Are Chilean women experiencing more burnout than men?
**Variable(s)**: `Durante 2025, ¿con qué frecuencia experimentaste burnout?` (_rec1/_rec2/_rec3)
**Plot type**: Grouped bar (distribution, by gender)
**Feasible heterogeneities**: gender [F], income [F], age [F], role [F], leadership [F], work schedule [F], remote [F], flexibility [F], org size [F], tenure [F]
**Key interactions**: gender × income, gender × age, gender × work schedule, gender × remote, gender × leadership
**Aspirational**: gender × parental status [A]
**Connection**: Research Directions 5a, 6a, 8b

#### Plot 2.6e: Emotional States by Gender (Happiness, Stress, Commitment, Depression, Boredom)
**Question**: Do women and men differ in emotional experience of work?
**Variable(s)**: Cols 246-265 (Feliz, Estresado, Comprometido, Deprimido, Aburrido) — _rec2/_rec3 for numeric
**Plot type**: Grouped bar or radar chart (mean/% high for each emotion, by gender)
**Feasible heterogeneities**: gender [F], income [F], age [F], role [F], leadership [F], work schedule [F], remote [F]
**Key interactions**: gender × income, gender × age, gender × work schedule
**Connection**: Research Direction 6a, 5a

#### Plot 2.6f: Work-Life Interference by Gender × Remote Work
**Question**: Does remote work reduce work-life interference for women?
**Variable(s)**: Work-life interference (_rec2/_rec3) × remote work access
**Plot type**: Grouped bar, x-axis = remote work level, bars = gender
**Feasible heterogeneities**: gender × remote [F], adding income [F], age [F], work schedule [F]
**Connection**: Research Direction 2a (flexibility mandates)

#### Plot 2.6g: Vacation Length by Gender
**Question**: Do women take shorter vacations? (Constraint vs preference)
**Variable(s)**: `En los últimos 12 meses, ¿Cuántos días seguidos fue tu periodo más largo de vacaciones?` (_rec1/_rec2)
**Plot type**: Grouped bar (distribution of vacation lengths, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], age [F], work schedule [F]
**Key interactions**: gender × income, gender × leadership, gender × age
**Connection**: Research Direction 6a (can women afford to disconnect?)

#### Plot 2.6h: Burnout × Work-Life Interference Correlation by Gender
**Question**: Is the burnout-interference link stronger for women (dual burden)?
**Variable(s)**: Burnout frequency × work-life interference, by gender
**Plot type**: Scatter or grouped heatmap (burnout level × interference level × gender)
**Feasible heterogeneities**: gender [F], adding age [F], income [F]
**Connection**: Research Directions 5a, 6a

---

### 2.7 Turnover, Discrimination & Frontier Questions (Research Directions 8a-8f)

#### Plot 2.7a: Turnover Intention by Gender
**Question**: Are women more likely to want to leave their job?
**Variable(s)**: `¿Cuál de las siguientes afirmaciones es la que mejor describe tu deseo de mantenerte o cambiar de trabajo?` (_rec1/_rec2)
**Plot type**: Stacked bar (stay happy / stay but looking / actively looking / etc., by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], work schedule [F], remote [F], tenure [F]
**Key interactions**: gender × income, gender × age, gender × work schedule
**Connection**: Research Direction 4a (firm quality and retention)

#### Plot 2.7b: Reasons for Wanting to Change Job by Gender
**Question**: Do women cite different reasons for wanting to leave?
**Variable(s)**: Cols 227-242 (growth, environment, compensation, work-life balance, leadership, discrimination, burnout, purpose)
**Plot type**: Horizontal grouped bar (% citing each reason, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], age [F], work schedule [F]
**Key interactions**: gender × income, gender × age
**Connection**: Research Directions 4a, 8b, 8c

#### Plot 2.7c: Work-Life Imbalance as Reason to Leave by Gender × Age
**Question**: Is work-life imbalance a bigger driver of turnover for women in their 30s?
**Variable(s)**: `Desbalance entre trabajo y vida personal` (_rec1) × age
**Plot type**: Line plot, x-axis = age, y-axis = % citing, lines = gender
**Feasible heterogeneities**: gender × age [F], adding income [F], work schedule [F]
**Aspirational**: gender × parental status [A]
**Connection**: Research Directions 5a, 6a, 7c (fertility timing and career)

#### Plot 2.7d: Discrimination as Reason to Leave by Gender × Role
**Question**: Are women in leadership more likely to cite discrimination?
**Variable(s)**: `Discriminación, falta de inclusión o valores en la organización` (_rec1) × role
**Plot type**: Grouped bar, x-axis = role, bars = gender
**Feasible heterogeneities**: gender × role [F], adding income [F], age [F], org size [F]
**Connection**: Research Direction 8b (harassment/discrimination), 8d (board quotas)

#### Plot 2.7e: Burnout as Reason to Leave by Gender × Work Schedule
**Question**: Is burnout-driven turnover higher among part-time women (dual burden despite reduced hours)?
**Variable(s)**: `Burnout o agotamiento` (_rec1) × work schedule
**Plot type**: Grouped bar, x-axis = schedule type, bars = gender
**Feasible heterogeneities**: gender × work schedule [F], adding income [F], age [F]
**Connection**: Research Direction 2c (firm evasion), 8c (informality double penalty)

#### Plot 2.7f: Compensation Inadequacy as Reason to Leave by Gender × Income
**Question**: At what income level does compensation become a turnover driver for women?
**Variable(s)**: `Compensación inadecuada` (_rec1) × income
**Plot type**: Grouped bar, x-axis = income, bars = gender
**Feasible heterogeneities**: gender × income [F], adding role [F], org size [F]
**Connection**: Research Direction 3a (wage renegotiation failure → exit)

---

### 2.8 Training, Human Capital & Compensating Differentials (Research Directions 4b, 8e)

#### Plot 2.8a: Self-Assessment of Performance by Gender
**Question**: Are women less confident about their work performance despite equal or better outcomes?
**Variable(s)**: Cols 130-138 (task completion, quality satisfaction, time efficiency) — _rec1/_rec2
**Plot type**: Grouped bar (% agreeing strongly, by gender, for each performance item)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], age [F], tenure [F]
**Key interactions**: gender × leadership, gender × age
**Connection**: Research Direction 3a (confidence → bargaining)

#### Plot 2.8b: Sense of Responsibility for Own Development by Gender
**Question**: Do women feel equally responsible for their career development?
**Variable(s)**: `Me siento responsable de mi propio desarrollo profesional` (_rec1/_rec2)
**Plot type**: Grouped bar (% agree/strongly agree, by gender)
**Feasible heterogeneities**: gender [F], income [F], age [F], role [F], leadership [F]
**Connection**: Research Direction 4b

---

## Section 3: Additional Interesting Plots

These are exploratory plots that may surface unexpected patterns regardless of specific research questions.

---

### 3.1 Job Attribute Preferences

#### Plot 3.1a: Top Job Attributes Ranked by Gender
**Question**: What do Chilean women vs men value most in a job?
**Variable(s)**: Cols 42-61 (salary, benefits, proximity, stimulating tasks, flexibility, remote, growth, culture, environment, social impact) — _rec1 for numeric
**Plot type**: Horizontal bar chart with gender-paired bars, sorted by female ranking
**Feasible heterogeneities**: gender [F], income [F], age [F], role [F], leadership [F], work schedule [F], remote [F]
**Key interactions**: gender × income (do low-income women prioritize salary while high-income women prioritize flexibility?), gender × age
**Aspirational**: gender × parental status [A]

#### Plot 3.1b: Proximity to Workplace Importance by Gender
**Question**: Is workplace proximity more important to women (suggesting commute as constraint)?
**Variable(s)**: `Cercanía al lugar de trabajo` (_rec1)
**Plot type**: Grouped bar by gender
**Feasible heterogeneities**: gender [F], income [F], age [F], remote [F]
**Key interaction**: gender × age (women with young children value proximity more?)

#### Plot 3.1c: Social Impact Valuation by Gender
**Question**: Do women value social contribution more (compensating differential)?
**Variable(s)**: `Contribución o Impacto social positivo` (_rec1)
**Plot type**: Grouped bar by gender
**Feasible heterogeneities**: gender [F], income [F], age [F], role [F]

---

### 3.2 Organizational Trust & Satisfaction

#### Plot 3.2a: Trust/Satisfaction Across All Organizational Levels by Gender
**Question**: Do women trust management, HR, supervisor, and peers differently?
**Variable(s)**: Cols 162-176 (jefatura directa, empresa, gerencia, RRHH, pares) — _rec1/_rec2
**Plot type**: Grouped bar or radar chart (% satisfied per level, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], tenure [F]
**Key interactions**: gender × role, gender × org size, gender × tenure

#### Plot 3.2b: Supervisor Satisfaction by Gender × Leadership Status
**Question**: Do women leaders rate their supervisors differently than women non-leaders?
**Variable(s)**: `Estoy satisfecho con mi jefatura directa` (_rec1/_rec2) × leadership
**Plot type**: Grouped bar, x-axis = leader/non-leader, bars = gender
**Feasible heterogeneities**: gender × leadership [F], adding income [F], age [F]

#### Plot 3.2c: NPS (Net Promoter Score) by Gender
**Question**: Are women less likely to recommend their employer?
**Variable(s)**: `¿qué tan probable es que recomiendes trabajar en tu actual organización?`
**Plot type**: Distribution histogram by gender, or grouped bar of promoters/passives/detractors
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], org size [F], age [F], work schedule [F], remote [F], tenure [F]
**Key interactions**: gender × income, gender × org size

---

### 3.3 Salary Adjustments & Institutional Response

#### Plot 3.3a: Did Organization Adjust Salaries in 2025 (by Gender Perception)
**Question**: Are women and men equally aware of organizational salary adjustments?
**Variable(s)**: `Durante el 2025, ¿Tu organización realizó algún ajuste general de las remuneraciones?`
**Plot type**: Grouped bar (% yes, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], org size [F], leadership [F]

---

### 3.4 Workload & Stress Patterns

#### Plot 3.4a: Workload Satisfaction by Gender
**Question**: Are women less satisfied with their workload?
**Variable(s)**: `Tu carga laboral` (_rec1/_rec2)
**Plot type**: Grouped bar (% satisfied, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], leadership [F], work schedule [F], remote [F], age [F]
**Key interactions**: gender × work schedule, gender × remote, gender × leadership

#### Plot 3.4b: Stress Frequency by Gender × Work Schedule × Remote
**Question**: Does part-time or remote work reduce stress for women?
**Variable(s)**: `Estresado/a laboralmente` (_rec2/_rec3) × work schedule × remote
**Plot type**: Faceted grouped bar (stress level by gender, faceted by schedule × remote)
**Feasible heterogeneities**: gender × work schedule × remote [F]

#### Plot 3.4c: Depression Frequency by Gender
**Question**: Do women report more work-related depression?
**Variable(s)**: `Deprimido/a` (_rec2/_rec3)
**Plot type**: Grouped bar by gender
**Feasible heterogeneities**: gender [F], income [F], age [F], role [F], work schedule [F], tenure [F]

---

### 3.5 Diversity & Inclusion

#### Plot 3.5a: Satisfaction with Diversity Policies by Gender
**Question**: Are women more or less satisfied with D&I policies?
**Variable(s)**: `Políticas de diversidad e inclusión en la organización` (_rec1/_rec2)
**Plot type**: Grouped bar (% satisfied, by gender)
**Feasible heterogeneities**: gender [F], income [F], role [F], org size [F], age [F], disability [F], sexual orientation [F]

---

### 3.6 Self-Employment Comparisons

#### Plot 3.6a: Employee vs Self-Employed Satisfaction by Gender
**Question**: Are self-employed women more satisfied (autonomy) or less (no protections)?
**Variable(s)**: Compare main-section satisfaction items (employed) vs `.1`-suffix items (self-employed), by gender
**Plot type**: Grouped bar (% satisfied: employee-women, employee-men, self-employed-women, self-employed-men)
**Feasible heterogeneities**: gender × employment type [F], adding income [F], age [F]
**Connection**: Research Direction 8c (informality)

#### Plot 3.6b: Burnout: Employees vs Self-Employed by Gender
**Question**: Are self-employed women more or less burned out?
**Variable(s)**: Burnout frequency (cols 266-269 vs 410-413) × gender
**Plot type**: Grouped bar by gender × employment type
**Feasible heterogeneities**: gender × employment type [F], adding age [F]

#### Plot 3.6c: Work Boundary Violations: Employees vs Self-Employed by Gender
**Question**: Do self-employed women work more overtime, weekends, vacations?
**Variable(s)**: Boundary items (employee cols 270-297 vs self-employed cols 414-441) × gender
**Plot type**: Radar or grouped bar comparing all boundary items across gender × employment type
**Feasible heterogeneities**: gender × employment type [F]

---

### 3.7 Comprehensive Gender Gap Dashboards

#### Plot 3.7a: Gender Gap Heat Map Across All Satisfaction Items
**Question**: Where are the biggest gender gaps in the Chilean labor market?
**Variable(s)**: All satisfaction items (recognition, promotion, salary, flexibility, diversity, workload, overall, supervisor)
**Plot type**: Heatmap: rows = satisfaction items, columns = heterogeneity dimension (e.g., income tiers), cell color = female-male gap
**Feasible heterogeneities**: By income [F], by role [F], by age [F], by org size [F]

#### Plot 3.7b: Gender Gap "Profile" by Role Level
**Question**: How does the gender gap profile change as women climb the hierarchy?
**Variable(s)**: All key outcomes (raise request, success, satisfaction, burnout, turnover) × role
**Plot type**: Multi-panel line chart: x-axis = role level, y-axis = gender gap, panels = outcome
**Feasible heterogeneities**: role [F], adding income [F]

#### Plot 3.7c: Correlation Matrix of Gender Gaps Across Outcomes
**Question**: Are firms with large wage perception gaps also the ones with large training/promotion/burnout gaps?
**Variable(s)**: Compute gender gap per outcome, correlate across individuals or org size groups
**Plot type**: Correlation heatmap
**Connection**: Research Direction 4b (HR practices bundle together)

---

## Summary of Plot Count

| Section | # Plots |
|---------|---------|
| 1. Replicating BUK Report | 19 |
| 2. Motivating Research Questions | 42 |
| 3. Additional Interesting Plots | 18 |
| **Total** | **79** |

---

## Priority Plots for a First Pass

If starting with a smaller set, prioritize these high-impact plots:

1. **Plot 1.2a** — Raise request rate by gender (core for RD 3a)
2. **Plot 1.2c** — Raise success rate by gender (core for RD 3a)
3. **Plot 1.2e** — Full raise funnel by gender (key motivating figure)
4. **Plot 2.3a** — Raise request by gender × age (lifecycle/fertility proxy)
5. **Plot 2.2a** — Remote work access by gender (Law 21.645 motivation)
6. **Plot 2.6a** — Work-life interference by gender (household decisions)
7. **Plot 2.6d** — Burnout by gender (wellbeing)
8. **Plot 2.5a** — Career satisfaction by gender × age (fertility cost proxy)
9. **Plot 2.1a** — Benefits adequacy by gender × org size (Sala Cuna)
10. **Plot 3.1a** — Job attribute preferences by gender (compensating differentials)
11. **Plot 2.7b** — Reasons for wanting to leave by gender (frontier)
12. **Plot 1.1a** — Wage equality perception by gender (baseline)
