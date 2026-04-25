# Presentation Script: Market Power and the Gender Career Gap

---

## Slide 1: Title

**"Market Power and the Gender Career Gap: Evidence from Matched HR Records in Chile"**

> Today I'm going to present a project that asks whether labor market power — monopsony — distorts not just wages, but the entire career trajectory of women. Specifically, I'm interested in two margins that have been largely overlooked in the monopsony literature: hiring decisions and promotion decisions.
>
> The setting is Chile, where I have access to an unusually rich dataset — matched employer-employee records from an HR platform that covers the full pipeline from job application through separation. I'll walk you through the motivation, the data, and then spend most of the time on the structural model.

---

## Slide 2: Motivation — "Firms shape careers through hiring and promotion"

> Let me start with what motivates this project.
>
> The gender gap literature has made enormous progress on understanding wage differences. We know a lot about how firms set wages differently for men and women. But wages are only one dimension of what firms do — firms also decide **who to hire** and **who to promote**, and these decisions shape careers in ways that wages alone don't capture.
>
> The question I'm asking is: how does labor market power distort these decisions by gender?
>
> **At the hiring margin:** We have a rich audit study literature — Bertrand and Mullainathan's classic 2004 paper shows callback gaps by race, and similar work exists for gender. But audit studies have a fundamental limitation: they observe callbacks, not the full hiring pipeline. They can't link screening behavior to firm characteristics like market power. So we don't know: do firms with more monopsony power screen more aggressively against women?
>
> **At the promotion margin:** Benson, Li, and Shue's 2024 QJE paper shows that women are promoted less than men despite higher performance ratings — but this is evidence from one firm. We don't know how this varies across firms, and specifically whether market structure explains why some firms have larger promotion gaps than others. The key economic insight is: if women have fewer outside options, firms can extract rents not just through lower wages, but through slower career progression.
>
> **This paper** brings these together — I test whether firms with greater labor market power distort career dynamics for women at both margins, using data that lets me observe the full HR pipeline.

**Transition:** Before I get to the model, let me give you some context on why Chile is a good setting for this.

---

## Slide 3: Chile Context — "The puzzle of Chile"

> Chile presents a striking puzzle. Women have surpassed men in educational attainment. The total fertility rate has fallen to 1.2 — one of the lowest in the world. And yet, the gender wage gap persists at 15 to 20 percent, and female labor force participation remains at 53 percent, well below the OECD average of 65 percent.
>
> So the standard explanations — human capital differences, fertility decisions — can't fully account for what we see. This points us toward **firm-side frictions**: how firms hire, promote, and retain workers. Something about what happens inside firms is holding back women's careers even as the supply-side constraints have loosened.
>
> Chile is also attractive as a **natural laboratory**. There are several overlapping labor market reforms that create useful variation. The 40-hour workweek law — Ley 21.561 — changes the cost of what Goldin calls "greedy jobs." The flexible work law for caregivers — Ley 21.645 — shifts women's outside options by making more jobs feasible. And Article 203, the childcare mandate that kicks in at 20 female workers, creates a regression discontinuity at a firm-size threshold.
>
> What's nice from a structural perspective is that each of these reforms ideally shifts a **parameter of the model**. The flexible work law shifts lambda_F — women's outside option arrival rate. The 40-hour law shifts hours norms. Article 203 shifts the cost of female labor. So we have potential policy variation to discipline the model.

**Transition:** Now let me tell you about the data that makes this possible.

---

## Slide 4: BUK Data — "BUK records the full HR pipeline"

> The data comes from BUK, which is an HR software platform used by over 19,000 Chilean firms, covering 4.7 million workers from 2022 to 2026. What makes this dataset special is that it records **every stage** of the employment relationship.
>
> As you can see in the diagram, the data covers:
> - **Hiring**: applications, candidates, and selection decisions — this is the full recruitment pipeline, not just who gets hired
> - **Contracts**: job title, area, hours, start date
> - **Payroll**: base, gross, and net salary with bonuses
> - **Promotions**: title changes, wage changes, and crucially, the hierarchical structure through supervisor links
> - **Separations**: end dates, exit reasons, turnover
>
> This is a worker-month panel with firm, occupation, and supervisor identifiers. The supervisor link is particularly valuable — it lets me construct organizational hierarchies and identify promotions, which is essential for the promotion margin.
>
> On the recruitment side, I observe 186,000 selection processes with 2.7 million applications. This means I can see the full pipeline from application to hire, by gender, at the firm level. This is my identification advantage for the hiring margin — I don't just see who gets hired, I see the full funnel.
>
> There's also a complementary survey — the Work in Progress survey — which provides subjective measures like satisfaction, perceptions of discrimination, and work-life balance. It's a separate instrument, so it can't be linked to the platform data at the individual level, but it provides useful context.

**Transition:** Let me give you a sense of the scale and composition of this data.

---

## Slide 5: Summary Statistics — Firms

> Starting with firms. We have over 19,000 Chilean firms in the panel. The size distribution is skewed — about 40 percent are small firms with fewer than 50 employees, but the large firms with over 250 employees, which are 28 percent of firms, employ nearly 80 percent of the workers. So the data is weighted toward large employers, which is actually useful because these are the firms where internal labor markets and promotion ladders are most relevant.
>
> The panel is growing over time — from about 6,500 firms in 2022 to over 19,000 in 2026 — as BUK's market share expands. We cover 20 economic sectors, with the biggest being retail, professional services, administrative services, finance, and manufacturing. And for 87 percent of firms, I can link to SII tax records, which gives me additional information on sector, sales bracket, and equity.

**Transition:** Now the workers.

---

## Slide 6: Summary Statistics — Workers

> On the worker side, we have 4.7 million unique workers and 8.3 million job spells. The gender composition is 63 percent male, 37 percent female — so women are underrepresented relative to the population, which is itself informative about labor force participation.
>
> Workers have on average about 6 job spells in the data, with a median of 3. The distribution is right-skewed — some workers have 14 or more spells at the 90th percentile, which gives us rich job mobility data for estimating outside option rates.
>
> A few key features: The supervisor link — the boss_id variable — is populated for 99.8 percent of workers, which is what enables the organizational hierarchy and promotion analysis. We observe base, gross, and net salary, which lets us decompose fixed versus variable compensation. And for separations, we have end dates for 83 percent of completed spells, though exit reason coverage is low.

**Transition:** And the recruitment data, which is particularly novel.

---

## Slide 7: Summary Statistics — Recruitment

> The recruitment data is where this project has a real empirical advantage. We observe 186,000 selection processes with 2.7 million applications from over a million unique candidates.
>
> The distribution of applications per vacancy is heavily right-skewed. The median is just 2 applications, but the mean is about 19, and at the 90th percentile we see 42 applications per vacancy. There are even some vacancies with over 1,000 applicants. This variation in selectivity is exactly what I need to measure screening intensity.
>
> On the candidate side, the gender split is 55 percent male, 45 percent female. About 69 percent of processes result in a hire, and roughly half are replacements while 40 percent are new vacancies.
>
> The key point is: I observe the **full application-to-hire pipeline** at the firm level, by gender. This lets me construct application-to-hire conversion rates by gender for each firm, which is my empirical measure of screening intensity. No audit study can do this at scale — audit studies send a handful of resumes to a handful of firms. I see millions of real applications across thousands of firms.

**Transition:** So with this data, there are many possible research questions. Let me show you the landscape.

---

## Slide 8: Research Directions ��� "Many possible research questions"

> Given the richness of this data, there are several directions I could go.
>
> **First**, there's the broken rung question. Is there a gender gap at the first promotion specifically? We know from McKinsey's Women in the Workplace reports and from Benson et al. that the first promotion is where the pipeline narrows most. With BUK, I can test this across 19,000 firms and ask what firm and worker characteristics predict it — are firms sorting on availability rather than productivity? Do long-hours norms explain who gets promoted?
>
> **Second** — and this is where I'm going — there's the monopsony power and career dynamics question. Do firms with greater labor market power offer fewer promotions to women? Do they screen women out at hiring or offer lower entry wages? This connects the monopsony literature to career dynamics in a way that hasn't been done.
>
> **Third**, there's a policy question about how firms adjust to mandate costs. When regulations like Article 203 increase the cost of employing women, do firms reclassify contracts, substitute toward male labor, or outsource roles?
>
> And there are many more — the data supports a wide range of questions at the intersection of firm behavior and gender.

**Transition:** [Click to next slide — the highlight slide]

---

## Slide 9: Research Directions — Monopsony Highlighted

> For this class, I'm going to focus on the **second question**: monopsony power and career dynamics. This is where I think there's the most scope for a structural contribution.
>
> The core question is: do firms with greater labor market power offer fewer promotion opportunities to women, and do they screen women out more aggressively at hiring? The mechanism I have in mind is that if women face thinner labor markets — fewer outside options — then firms face less competitive pressure to treat them well on these career margins. Monopsony power lets firms extract rents not just through lower wages, but through slower career progression.

**Transition:** Let me show you where this fits in the literature.

---

## Slide 10: Literature — "Two literatures have developed in parallel"

> There are two literatures that are highly relevant but have developed essentially in parallel.
>
> **The first** is the monopsony and gender literature. Webber's 2016 JOLE paper shows that firms facing less elastic labor supply pay women relatively less. Sharma's 2023 JPE paper structurally estimates gender-specific labor supply elasticities and shows that firms set larger wage markdowns for women. Caldwell and Danieli show that outside options causally affect within-firm outcomes. But here's the gap: **this entire literature is about wages**. Nobody has asked whether monopsony power also distorts hiring and promotion decisions.
>
> **The second** is the gender and career dynamics literature. Benson, Li, and Shue's 2024 QJE paper shows promotion gaps persist after controlling for performance. Bertrand and Mullainathan document hiring discrimination through audits. But here's the gap on this side: **there's no connection to market structure**. We know promotion gaps exist, but we don't have a theory of why they vary across firms or markets.
>
> **The missing intersection** — which is what this paper provides — is asking whether market power distorts hiring screening or promotion decisions by gender. The mechanism is simple: if women have fewer outside options, firms face less competitive pressure to hire fairly or promote fairly. Rents are extracted through slower career progression.
>
> **My contribution** is to connect monopsony to career dynamics at both margins, using application-level data to measure market power directly — not through wage markdowns, but through the recruitment pipeline.

**Transition:** OK, now let me walk you through the model. This is going to take a few slides.

---

## Slide 11: Model Overview — Diagram

> The model builds on three pillars from the literature.
>
> The **backbone** is Burdett and Mortensen's 1998 wage-posting search model. This gives us the market structure: workers search on and off the job, firms post wages, and search frictions generate monopsony power. The key parameter is lambda_g — the rate at which employed workers receive outside offers. This is what creates monopsony power: if lambda is low, workers don't get many outside offers, so firms can underpay them.
>
> On top of B&M, I add an **internal promotion decision** from Gibbons and Waldman's 1999 QJE model of internal labor markets. This gives us two job levels within each firm — junior and senior — and a promotion threshold that determines how quickly workers move up.
>
> The **gender channel** comes from Sharma's 2023 JPE paper. Gender enters through lambda_F < lambda_M — women receive outside offers at a lower rate than men. This could be because of geographic constraints, occupational segregation, household responsibilities reducing job search — the model is agnostic about the source, it just takes the differential as given.
>
> Looking at the diagram: workers start unemployed, get hired into junior positions at a screening threshold q_g_star, may be promoted to senior at threshold theta_g, and separate back to unemployment at rate delta. The dashed arrows show separations — these include both exogenous exits to unemployment at rate delta and job-to-job transitions when workers get better outside offers. The firm chooses both q_g_star and theta_g, and both instruments can vary by gender.
>
> A few important features of the environment: continuous time, steady state. Two worker types — male and female. Firms are heterogeneous in productivity p, drawn from some distribution F(p). And each firm has two job levels.

**If someone asks "why not a life cycle model?":** This is a steady-state model, not a life cycle model. Workers flow between states continuously — the diagram shows stocks and flows, not a sequence of life stages. A junior who separates goes back to unemployed and may be rehired elsewhere.

**If someone asks "why is lambda_F < lambda_M?":** This is a reduced-form assumption that captures many underlying mechanisms — women may search less due to household responsibilities, may be geographically constrained, may face occupational segregation that thins their market. Sharma 2023 estimates these elasticities structurally. In principle you could endogenize lambda, but for now it's a primitive.

**Transition:** Let me now write down the worker's problem formally.

---

## Slide 12: Workers' Problem — Bellman Equations

> Workers of gender g are in one of three states: unemployed, employed as a junior (j=0), or employed as a senior (j=1) at some firm of type p.
>
> **The value of unemployment** is standard from B&M. The flow value rU_g equals the flow payoff from unemployment b, plus the option value of receiving job offers. Unemployed workers receive offers at rate lambda_g_u, and they accept any offer where the value of being employed V_{g0} exceeds their unemployment value U_g. The integral is over the distribution of wage offers in the market.
>
> **The value of employment** at level j in a firm of type p is where it gets more interesting. Let me walk through each term in the Bellman equation:
>
> The first term, w_{gj}(p), is the flow wage — what the worker earns right now.
>
> The second term is the **on-the-job search** term. At rate lambda_g, the worker gets an outside offer from the distribution F_g. They accept if the new firm's value exceeds their current value. This is the B&M on-the-job search mechanism — it's what creates the job ladder.
>
> The third term, delta times [U_g - V_{gj}(p)], is the **exogenous separation** term. At rate delta, the worker loses their job and falls back to unemployment. This is always a loss (U_g < V_{gj} for employed workers), so it enters negatively.
>
> The fourth term — and this is the new piece relative to standard B&M — is the **promotion option**. The indicator function says this term only applies to junior workers (j=0). At rate mu_g(p) — the promotion rate, which is determined by the firm's choice of theta_g — the worker moves from junior to senior, and their value jumps from V_{g0} to V_{g1}. This is always positive (V_{g1} > V_{g0}), so it makes the junior job more attractive.
>
> **Two key things to note:**
>
> First, the state variable is firm productivity p, not the wage. This follows Postel-Vinay and Robin 2002. In standard B&M with one instrument, the wage is a sufficient state variable. But in our model, the worker cares about the whole package — entry wage, promotion prospects, senior wage — all of which are functions of p. So p is the sufficient statistic for the worker's lifetime value at the firm.
>
> Second, lambda_g with lambda_F < lambda_M is the key parameter. It appears in the on-the-job search term. Lower lambda means fewer outside offers, which means the worker's value function is less sensitive to what other firms are doing. This is what gives the current firm market power.

**If someone asks "why does the outside offer lead to V_{g0}(w') not V_{gj}?":** Good question — I'm assuming that when a worker moves to a new firm, they start as a junior at that firm. This is a simplification. You could model it differently — maybe senior workers get hired at senior level — but this keeps things tractable and is consistent with the idea that firm-specific human capital doesn't transfer perfectly.

**Transition:** Now let me turn to the firm's problem, which is where the action is.

---

## Slide 13: Firm's Problem Setup — Two Instruments

> A firm with productivity p employs workers at two levels. The production function is y_j(p) = p times a_j, with a_1 > a_0 — senior workers produce more than junior workers.
>
> **This is critically important:** the production function is **gender-neutral**. A man and a woman in the same job at the same firm produce the same output. There is no productivity difference by gender in this model. All of the differential treatment — different wages, different promotion rates, different screening — comes from the firm's optimal response to differential outside options. This means any gender gap we find is a **market failure** — a monopsony distortion — not an efficient response to real productivity differences.
>
> The firm chooses **four objects** for each gender g:
>
> **Decision 1: Hiring.** The firm posts an entry wage w_{g0} and a screening threshold q_g_star. Applicants draw a quality signal q from some distribution H. The firm hires if q exceeds q_g_star. The trade-off is straightforward: a higher threshold means better workers but fewer hires.
>
> I should be upfront that the screening threshold as a firm choice variable in a search model doesn't come from a single paper the way the promotion decision comes from Gibbons and Waldman. The closest antecedent is Shi 2002 on directed search. This is more of a proposed extension.
>
> **Decision 2: Promotion.** The firm sets a promotion threshold theta_g and a senior wage w_{g1}. Each period, junior workers draw a performance signal s from distribution G. If s exceeds theta_g, they're promoted. Lower theta means more promotions, which increases output (more workers producing at the senior level), but also increases the wage bill. And here's the key additional force: **the retention motive**. Promoting a worker makes them less likely to leave, because their value at the firm increases. This retention motive is what connects promotion decisions to outside options and therefore to monopsony power.

**Transition:** Let me now write down the firm's optimization problem formally.

---

## Slide 14: Firm's Problem — Steady-State Optimization

> The firm chooses its four instruments to maximize steady-state profits. The profit function is:
>
> pi_g(p) = sum over j of [y_j(p) - w_{gj}] times n_{gj}(p)
>
> This is the sum of per-worker surplus times the number of workers at each level. The firm earns the gap between output and wages, summed across its workforce.
>
> The key insight is that **n_{gj} is not a direct choice** — it's an equilibrium object determined by three flows:
>
> **Flow 1: Inflow through hiring.** The hiring rate h_g(p) has four components. Lambda_g_u times u_g is the rate at which unemployed workers of gender g encounter this firm — this is the standard B&M contact rate. [1 - H(q_g_star)] is the fraction of applicants who pass the screening threshold — higher q_star means fewer pass. And the indicator function says the worker only accepts if the job is better than unemployment.
>
> Note that I said the worker accepts if V_{g0}(p) exceeds U_g. You might ask: isn't this just a reservation wage condition? In standard B&M with one instrument, yes — there's a reservation wage w_R where V(w_R) = U. But in our model, the worker cares about the whole package — entry wage, promotion prospects, senior wage — so a single reservation wage doesn't work. Instead, we have a **reservation firm type** p_R: workers accept any firm with p above p_R.
>
> **Flow 2: Internal flow through promotion.** The promotion rate mu_g(p) = 1 - G(theta_g) — just the probability that the performance signal exceeds the threshold. Higher theta means lower promotion rate. This comes directly from Gibbons and Waldman.
>
> **Flow 3: Outflow through separation.** The separation rate s_g(p) = delta + lambda_g times [1 - F_g(V_{gj}(p))]. There are two components: delta is the exogenous separation rate — layoffs, life events. The lambda_g component is endogenous separation through job-to-job transitions: the worker gets an outside offer at rate lambda_g, and [1 - F_g(V_{gj})] is the probability the offer is better than their current value. **This is the monopsony channel**: lower lambda_F means fewer outside offers, which means lower separation, which means the firm knows women won't leave.
>
> **The steady-state conditions** are just flow balance. For juniors: inflow from hiring equals outflow through promotion plus separation. For seniors: inflow from promotion of juniors equals outflow through separation. Setting these to zero gives us the steady-state stocks.
>
> So the whole thing connects: the firm's choice of wages, screening threshold, and promotion threshold flows through the three rates — hiring, promotion, separation — which determine the workforce, which determines profits. The firm maximizes by choosing all four instruments optimally. And because lambda_F < lambda_M enters through the separation rate, the optimal choices differ by gender.

**Transition:** Now the key question: what does the optimal promotion threshold look like, and why does it differ by gender?

---

## Slide 15: The Retention Trade-off — Intuitive Version

> The firm's promotion decision balances two forces.
>
> **Force 1: The direct profit effect.** When you promote a worker, output rises — a_1 > a_0, seniors are more productive. But the wage also rises — w_{g1} > w_{g0}. So the net effect on per-worker surplus could go either way. The output gain p(a_1 - a_0) is gender-neutral — remember, production doesn't depend on gender. But the surplus change pi_1 - pi_0 depends on gender-specific wages, which are set as a function of lambda_g.
>
> **Force 2: The retention effect.** Promoting a worker makes them less likely to leave. Why? Because promotion increases their continuation value — V_{1g} is greater than V_{0g}. With a higher value at the current firm, fewer outside offers look attractive, so the separation rate falls. This is a pure benefit of promoting — you retain a valuable worker.
>
> **Here's where gender enters.** The retention effect depends critically on lambda_g — the rate of outside offers.
>
> For **men**, with high lambda_M: outside offers arrive frequently. If you don't promote him, there's a good chance he gets a better offer and leaves. The retention urgency is high. The firm thinks: "I need to promote this worker or I'll lose him."
>
> For **women**, with low lambda_F: outside offers arrive rarely. Even without a promotion, she probably won't leave. The retention urgency is low. The firm thinks: "I can delay this promotion — she's not going anywhere."
>
> And that gives us the main result: **theta_F_star > theta_M_star**. The firm sets a higher promotion bar for women. Not because women are less productive — production is gender-neutral. Not because the firm prefers men — there's no taste discrimination in the model. It's purely because the firm faces **less competitive pressure** to promote women. The market lets them get away with it.
>
> If someone wants the formal version, there's a button here that links to the appendix where I work through a two-period simplification of the FOC. The key equation decomposes the promotion condition into a direct profit effect and a retention value, and shows that the retention term is proportional to lambda_g — so it vanishes as lambda goes to zero.

**If someone asks "why not just pay women less instead of delaying promotion?":** The firm does both. In the model, w_{F0} < w_{M0} and w_{F1} < w_{M1} — women are paid less at both levels. But the firm ALSO delays promotions because that's an additional margin for extracting surplus. Wages and promotions are complementary instruments for the monopsonist.

**If someone asks "is this testable?":** Yes — the model predicts that promotion gaps should be larger in more concentrated labor markets. I can test this by looking at promotion rates across occupation-by-region cells with different HHI, using the BUK data.

**Transition:** Now let me turn to the hiring margin, where the story is more nuanced.

---

## Slide 16: The Hiring Mechanism — Two Opposing Forces

> Unlike the promotion result, which has a clear sign — theta_F > theta_M — the hiring screening decision involves **two opposing forces**, and the net effect is theoretically ambiguous.
>
> **Force 1: The "longer tenure" force**, which pushes toward screening women **less**. The logic: women stay longer at the firm because they have fewer outside options. That means each hire generates surplus over more periods. The expected lifetime value of a female hire is higher. So the firm should **lower** the bar — accept more women, because each one is a more valuable long-term asset.
>
> **Force 2: The "less competition" force**, which pushes toward screening women **more**. The logic: women have fewer alternatives. They'll apply even when the bar is high, because they don't have many other options. So the firm can raise q_F_star without losing its applicant pool. It can afford to cherry-pick from a captive group.
>
> These two forces push in opposite directions, and **the model does not deliver a clear prediction** on the sign of q_F_star minus q_M_star. This is actually an important and honest result. Unlike the promotion margin where both the direct and retention effects push in the same direction for women, here the two effects oppose each other.
>
> **Why is this a feature, not a bug?** Because it makes the hiring margin an **empirical question**. The model tells us what to look for — variation in screening intensity by gender across markets with different concentration — but it doesn't predetermine the answer. The BUK data, with its application-to-hire conversion rates by gender across thousands of firms, can tell us which force dominates in practice.
>
> I should also note that the theoretical foundations for the hiring screening threshold are less developed than for the promotion decision. The promotion mechanism builds cleanly on Gibbons and Waldman 1999 and the retention logic from Postel-Vinay and Robin 2002. The screening threshold as a firm choice variable doesn't have a single clean antecedent — it's more of a composite, drawing on Shi 2002 and the statistical discrimination tradition. This is something I want to develop further.

**If someone asks "what would resolve the ambiguity?":** Functional form assumptions on the signal distribution H(q) and the offer distribution F_g would pin down the sign. But I'd rather let the data speak — the reduced-form test is whether application-to-hire conversion rates for women are lower at high-concentration firms.

**Transition:** Let me wrap up with what we could learn from counterfactual exercises.

---

## Slide 17: Counterfactuals

> Once the model is estimated, there are three natural counterfactual exercises.
>
> **First: equalize outside options.** Set lambda_F = lambda_M — give women the same outside offer arrival rate as men. This tells us: what fraction of the gender promotion gap is explained by differential outside options versus other forces? If the gap closes entirely, then the whole story is about market power and outside options. If a gap remains, there must be other forces at work — taste discrimination, statistical discrimination, something else. This follows the decomposition approach in Sharma 2023, but applied to promotions rather than wages.
>
> **Second: eliminate market power entirely.** Set lambda to infinity for everyone — make all markets perfectly competitive. This asks: how much of the gender gap in career dynamics is attributable to market power as opposed to other frictions? In a perfectly competitive market, firms can't delay promotions because workers would immediately leave. So this counterfactual gives us an upper bound on how much monopsony power matters.
>
> **Third: a policy simulation tied to Chile's 40-hour workweek reform.** If the reform increases lambda_F — by making more firms viable options for women who face hours constraints — how much does the promotion gap close? This is where the structural model connects to real policy. Instead of just asking "did the reform affect wages," we can ask whether it changed the fundamental competitive pressure firms face on the career dynamics margin. This connects to Goldin's work on greedy jobs — if the reform reduces the penalty for wanting reasonable hours, it effectively thickens the market for women, increasing their outside options.
>
> These counterfactuals are what make the structural model worth building. The reduced-form evidence can tell us that promotion gaps are larger in concentrated markets. But only the structural model can decompose the gap, quantify the role of market power, and simulate policy counterfactuals.

**If someone asks about estimation:** The plan is simulated method of moments, targeting promotion rates by gender and firm, entry wages, wage growth at promotion, separation rates, and application-to-hire conversion rates — all directly observed in BUK. The identification comes from cross-sectional variation across occupation-by-region cells with different HHI. I have the estimation and identification details in backup slides.

---

## Appendix Notes

### If someone asks about the Survey (Appendix Slide)

> The Work in Progress survey is a complementary data source. It covers about 6,800 respondents across Chile, Colombia, Mexico, and Peru. It's an open survey — anyone can respond — so it cannot be linked to the BUK platform data at the individual level. But it provides subjective measures that the administrative data can't: perceptions of discrimination, job satisfaction, burnout, work-life balance, and views on gender equity policies. I use it mainly as context and motivation, not as part of the structural estimation.

### If someone asks about the Formal FOC (Appendix Slide)

> Let me walk through the formal promotion condition. I use a two-period simplification to make the math transparent.
>
> In period 1, the worker is a junior, and the firm earns pi_0 = p times a_0 minus w_{g0}. Between periods, an outside offer arrives with probability lambda_g. If the worker was promoted, their continuation value is higher — V_{1g} > V_{0g} — so they're less likely to accept the outside offer.
>
> I define retention probabilities: r_g^P is the probability the worker stays if promoted, r_g^N is the probability they stay if not promoted. Since V_{1g} > V_{0g}, we know r_g^P > r_g^N — promoted workers are easier to retain.
>
> The firm promotes if period-2 expected profit is higher with promotion. This gives us the condition:
>
> (pi_1 - pi_0) times r_g^N + pi_1 times (r_g^P - r_g^N) >= 0
>
> The first term is the **direct profit effect**: the change in per-worker surplus, scaled by the baseline retention probability. The second term is the **retention value of promoting**: the additional profit you get from the higher retention that promotion creates.
>
> The key insight: the retention term r_g^P - r_g^N = lambda_g times [F_g(V_{1g}) - F_g(V_{0g})]. It's **proportional to lambda_g**. So as lambda goes to zero — the monopsony extreme — the retention term vanishes entirely, and the firm only promotes when pi_1 > pi_0 (direct profit gain). As lambda goes to infinity — perfect competition — the retention effect dominates and the firm always promotes to retain.
>
> Since lambda_F < lambda_M, the retention motive is weaker for women. The firm requires a higher threshold — stronger evidence that promotion is directly profitable — to justify promoting a woman. That's why theta_F_star > theta_M_star.

---

## General Tips for Delivery

- **Pace the model slides.** Slides 11-16 are dense. Take your time, pause after key equations, and check whether the audience is following before moving on.
- **Emphasize the gender-neutral production function** (slide 13). This is the most important modeling choice — it means the entire gap is a market failure. Come back to it when presenting the retention trade-off.
- **The retention trade-off slide (15) is the punchline of the model.** Spend the most time here. The men-vs-women comparison is intuitive and memorable.
- **Be honest about the hiring margin (slide 16).** The ambiguity is intellectually honest and positions the empirical work as resolving something the theory alone cannot. Don't oversell what the model delivers.
- **For the counterfactuals (slide 17)**, emphasize that this is what the structural model buys you beyond reduced form. The decomposition is the value-added.
- **Anticipate questions about lambda_F < lambda_M.** Be ready to discuss why women face thinner markets (geographic constraints, occupational segregation, household responsibilities, hours constraints) and that the model takes this as a primitive — it could be endogenized but isn't in the current version.
