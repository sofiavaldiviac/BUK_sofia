# Model Framework: Monopsony Power and Career Dynamics

## Which Modeling Tradition to Build On

There are four candidate frameworks:

### Option A: Static monopsony wage-setting (Sharma 2023)
- Firms face gender-specific upward-sloping labor supply; set wages as markdown on MRP
- Extension: add a promotion threshold decision alongside wages
- **Pro:** clean, directly maps to monopsony literature
- **Con:** static — promotions are inherently dynamic; can't capture job ladders or on-the-job search

### Option B: Search model with job ladder (Burdett & Mortensen 1998 + extensions) — RECOMMENDED
- Workers search on and off the job; firms post wages and career policies
- Workers climb a job ladder; outside offers create pressure to promote/raise
- Extension: firms choose BOTH entry screening AND promotion thresholds; gender enters through differential outside offer arrival rates
- **Pro:** naturally captures dynamics, hiring, promotions, separations — all of which you observe in BUK
- **Con:** more moving parts, but well-established estimation techniques exist

### Option C: Tournament model (Lazear & Rosen 1981)
- Workers compete for promotion slots; firms set tournament prizes
- Monopsony reduces the need for large prizes (workers can't leave)
- **Pro:** clean promotion theory
- **Con:** doesn't naturally capture search/outside options or hiring

### Option D: Structural AKM with firm wage/promotion premia
- Extend Card, Cardoso & Kline (2016) to estimate firm-specific promotion premia by gender
- More reduced-form than structural
- **Pro:** straightforward, well-understood
- **Con:** descriptive, not a model of firm behavior

---

## Recommended Framework: Search Model with Hiring and Promotion

Build on **Burdett & Mortensen (1998)** wage-posting model, extended with:
- A **hiring/screening** stage (from Shi 2002 directed search, or Menzio & Shi 2011)
- A **promotion** decision within the firm (from Gibbons & Waldman 1999 internal labor markets)
- **Gender-specific** outside option arrival rates (from Sharma 2023 for the gender channel)

### Papers to read for each model component:

**For the search/wage-posting backbone:**
- **Burdett & Mortensen (1998, IER)** — "Wage Differentials, Employer Size, and Unemployment" ★★★
  - THE foundational on-the-job search model. Firms post wages; workers search; equilibrium wage distribution emerges from the tension between attracting workers and extracting surplus.
  - Read sections I-III. Your model extends this by adding a promotion decision.

- **Postel-Vinay & Robin (2002, ECMA)** — "Equilibrium Wage Dispersion with Worker and Employer Heterogeneity" ★★
  - Extends B&M with heterogeneous firms and sequential bargaining when workers receive outside offers
  - Key insight: firms match outside offers to retain workers — this is exactly the mechanism you want (firms promote/raise to retain, but less so for workers with fewer outside offers)
  - This could be your bargaining protocol

**For the hiring/screening stage:**
- **Shi (2002, JET)** — "A Directed Search Model of Inequality" ★
  - Workers direct their search toward firms posting wages; firms choose how selective to be
  - Gives you the hiring margin: firms trade off wage offers vs. screening intensity
  - In your model: firms in concentrated markets post lower entry wages AND screen more aggressively

- **Lang & Lehmann (2012, AER)** — "Racial Discrimination in the Labor Market"
  - Models how search frictions + statistical discrimination interact
  - Shows that even small taste discrimination is amplified by monopsony power
  - Useful for thinking about how market power interacts with any baseline gender bias

**For the promotion decision inside the firm:**
- **Gibbons & Waldman (1999, QJE)** — "A Theory of Wage and Promotion Dynamics Inside Firms" ★★★
  - THE internal labor markets model. Workers accumulate human capital; firms learn about ability; promotions happen when expected output in the higher job exceeds current output
  - Read for: how to model the promotion threshold, how learning about ability works
  - Your extension: the promotion threshold is also a function of the worker's outside option — firms delay promotion when the worker won't leave anyway

- **DeVaro & Waldman (2012, RAND)** — "The Signaling Role of Promotions" ★
  - Promotions reveal information to the outside market → firms delay promotions to prevent poaching
  - In your model: when the outside market is thin (monopsony), the poaching risk is lower → firms delay promotions even more → amplifies the gap for women in concentrated markets

**For the gender channel:**
- **Sharma (2023, JPE)** ★★★
  - How to introduce gender into a monopsony model
  - She estimates gender-specific labor supply elasticities
  - Your extension: she only looks at wages; you add the promotion margin
  - Read carefully: how she identifies the gender-specific elasticities from worker flows

- **Caldwell & Harmon (2024)** ★
  - Empirical evidence that outside options causally affect within-firm outcomes
  - Useful for motivating the mechanism: when women's outside options worsen, their within-firm career dynamics deteriorate

---

## Model Sketch

### Environment
- Continuous time, steady state
- Two types of workers: g ∈ {M, F}
- Continuum of firms heterogeneous in productivity p ~ F(p)
- Two job levels within each firm: junior (j=0) and senior (j=1)

### Workers
- Workers are either unemployed (u) or employed at level j in a firm
- While employed, workers receive outside offers at rate λ_g (KEY PARAMETER: λ_F < λ_M)
  - This captures that women face thinner markets / fewer outside options
  - Could be endogenized later (women search less because of constraints)
- Workers separate exogenously at rate δ
- Flow utility = wage w_{gj}
- Workers accept any offer that improves their lifetime value

### Firms
- Each firm has productivity p and employs workers at two levels
- Output of worker type g at level j: y_{gj}(p) = p · a_j (a_1 > a_0; senior workers produce more)
- Firm makes two decisions:

**Decision 1: Hiring (entry)**
- Firm posts entry wage w_0 and a screening threshold q* (minimum quality signal to hire)
- Applicants draw quality signal q; hired if q ≥ q*
- Trade-off: higher q* means better workers but fewer hires
- With more market power (lower λ_g for women): firm can set higher q* for women because women have fewer alternatives → screening discrimination at entry

**Decision 2: Promotion**
- Each period, firm observes a performance signal s for each junior worker
- Firm promotes if s ≥ θ_g(p), where θ is the promotion threshold
- Promoted worker moves to level j=1, wage increases to w_1
- Trade-off: promoting is costly (higher wage) but increases output
- Retention motive: if the worker might leave (high λ_g), firm promotes earlier to retain them
- KEY PREDICTION: θ_F(p) > θ_M(p) — firms set a higher promotion bar for women because women are less likely to leave

### Firm's Problem (for each gender g)

Choose (w_{g0}, w_{g1}, q\*_g, θ_g) to maximize steady-state profits:

π_g(p) = Σ_j [y_{gj}(p) - w_{gj}] · n_{gj}

where n_{gj} is the steady-state mass of type-g workers at level j, which depends on:
- Hiring flow (determined by w_{g0} and q*_g — higher wage and lower threshold attract more)
- Promotion flow (determined by θ_g — lower threshold means faster promotion)
- Separation flow (δ + λ_g · Pr(outside offer is better))

### Key Equilibrium Objects
- Wage distributions G_g(w) for each gender
- Promotion rate P_g(p) = Pr(s ≥ θ_g(p)) for each firm type and gender
- Hiring rate H_g(p) for each firm type and gender
- Separation rate S_g(p) for each firm type and gender

### Detailed Discussion: The Firm's Two Decisions

#### Decision 1: Hiring (Screening threshold q*)

**Where it comes from:** In standard Burdett & Mortensen, there is no screening — firms post a wage and every worker who shows up gets hired. The only instrument is the wage. We add a screening margin.

**Closest paper:** Shi (2002, JET) models firms choosing selectivity alongside wages in a directed search model. In Shi, "screening" comes from the probability of being hired when multiple workers apply to the same job (a queue/rationing problem). Our formulation — firm observes a quality signal q and sets a cutoff q* — is slightly different: it comes more from the statistical discrimination / employer screening tradition (Phelps 1972, Arrow 1973), grafted onto the B&M search structure. Lang & Lehmann (2012, AER) combine search frictions with discrimination but their mechanism is taste-based discrimination amplified by monopsony, not a screening threshold choice.

**Honest assessment:** The hiring screening threshold as a firm choice variable in a search model does NOT have a single clean antecedent paper the way the promotion decision has Gibbons & Waldman. It is a composite of ideas. A referee might push back here. Options: (1) formalize it properly by deriving optimal q* from the firm's problem with a specific signal structure, (2) drop it and focus on promotion as the core contribution, or (3) use Shi (2002) more directly by reframing hiring selectivity as a directed search queue.

**The mechanism:**
- Firm posts entry wage w₀ and a screening threshold q* (minimum quality signal to hire)
- Applicants draw a quality signal q (noisy signal of ability from CV, interview, etc.)
- Hired if q ≥ q*

**The trade-off is quantity vs. quality:**
- High q* → fewer hires, but those hired are better (higher E[ability | q ≥ q*])
- Low q* → more hires, but lower average quality

**Why it interacts with gender (λ_F < λ_M):**
Think about the firm's cost of setting a high bar. If a qualified woman is rejected:
- In a competitive market (high λ_F): she quickly finds another job. But also, the firm loses her to competitors. The cost of being too picky is high — you lose good candidates to rivals.
- In a monopsonistic market (low λ_F): she has fewer alternatives. She may reapply, or stay unemployed longer. The firm's cost of rejecting her is lower.

So lower λ_F allows the firm to raise q*_F without losing its applicant pool. The firm can afford to "cherry-pick" from a group that has fewer outside options.

#### Decision 2: Promotion (Threshold θ_g)

**Where it comes from:** Gibbons & Waldman (1999, QJE) — THE internal labor markets model. Workers accumulate human capital; firms learn about ability; promotions happen when expected output in the higher job exceeds current output. This gives us the promotion threshold structure.

**Our extension** adds a **retention motive** on top of the G&W assignment motive. This comes from the logic in Postel-Vinay & Robin (2002, Econometrica): firms adjust within-firm decisions in response to the threat of outside offers.

**The mechanism — three forces in the promotion cost-benefit:**

*Cost of promoting:*
- Wage increase: w₁ - w₀ (promoted worker is more expensive)

*Benefits of promoting:*
- Output increase: p · (a₁ - a₀) — senior workers produce more
- **Retention value**: a promoted worker is less likely to leave because their value at the current firm increased

**The retention value is the key gender channel.** Ask: what happens if I DON'T promote this worker?
- The worker might get an outside offer (at rate λ_g) and leave
- If they leave, I lose all the surplus I was extracting: p · a₀ - w₀
- Expected loss from not promoting = λ_g × Pr(outside offer beats current value) × (surplus lost)

When λ_F < λ_M:
- The expected loss from not promoting a woman is **smaller** (she's less likely to get an outside offer)
- So the retention benefit of promoting is smaller for women
- The firm needs a **stronger productivity signal** to justify the wage cost → θ_F > θ_M

**Papers for this piece:**
- **Gibbons & Waldman (1999, QJE)** — the assignment/promotion threshold model. Read sections I-II.
- **Postel-Vinay & Robin (2002, Econometrica)** — the retention mechanism. When a worker gets an outside offer, the current firm can counteroffer. Our version: instead of reactive counteroffers, the firm proactively promotes to prevent the worker from wanting to leave.
- **DeVaro & Waldman (2012, RAND)** — adds that promotions signal ability to outside firms. Firms delay promotions partly to keep workers' ability hidden from competitors. When the outside market is thin (low λ), the signaling concern is weaker — but the firm still delays because retention pressure is also weaker. Both forces push θ up for women.

#### How the two decisions interact

They are not independent:
1. **Screening feeds into promotion.** If the firm sets a high q*_F (screens aggressively at hiring), the women who DO get hired are higher quality on average. But despite being higher quality, they STILL face a higher promotion bar θ_F because the retention logic applies regardless of initial quality. This is the "double penalty."
2. **The firm optimizes both jointly.** A firm choosing high q*_F and high θ_F is saying: "I'll be very selective about which women I hire, AND I'll be slow to promote the ones I do hire." Both instruments extract surplus from a group with weak outside options.

#### Notation note

The production function y_j(p) = p · a_j is **gender-neutral**: a man and a woman in the same job at the same firm produce the same output. Gender enters entirely through the firm's optimal response to differential outside options. This is intentional — it means the entire gap is a market failure (monopsony distortion), not an efficient response to productivity differences.

The state variable for the worker's value function is firm productivity p, not the wage: V_{jg}(p). This follows Postel-Vinay & Robin (2002). In B&M (1998), the state is the wage w because the firm has one instrument. In our model, the firm has multiple instruments (w₀, w₁, θ, q*), all functions of p, so p is the sufficient statistic for the worker's lifetime value at the firm.

### Main Predictions

1. **Promotion gap increases with market power:**
   ∂(θ_F - θ_M)/∂(1/λ_F) > 0
   Firms in more concentrated markets have larger gender promotion gaps

2. **Hiring screening gap increases with market power:**
   ∂(q\*_F - q\*_M)/∂(1/λ_F) > 0
   Firms in more concentrated markets screen women more aggressively

3. **The broken rung:** The gap is largest at the FIRST promotion (j=0 → j=1) because:
   - At entry, there's no incumbent relationship — the outside option fully determines bargaining
   - At the first promotion, the retention motive is strongest (the worker has been at the firm longest without advancement)

4. **Reinforcing cycle:** lower λ_F → fewer promotions → lower wage growth → fewer outside offers → even lower λ_F

---

## Detailed Walkthrough: The Firm's Optimization Problem

This section walks through the steady-state profit maximization problem in detail.

### The Objective Function

The firm with productivity p chooses (w_{g0}, w_{g1}, q*_g, θ_g) to maximize steady-state flow profits:

π_g(p) = Σ_j [y_j(p) - w_{gj}] · n_{gj}(p)

Expanded:

π_g(p) = (p · a₀ - w_{g0}) · n_{g0} + (p · a₁ - w_{g1}) · n_{g1}

- **(p · a_j - w_{gj})** = profit per worker at level j (output minus wage). This is the monopsony surplus — the wedge between what the worker produces and what they're paid.
- **n_{gj}(p)** = the steady-state mass (stock) of gender-g workers at level j in this firm.

The firm earns surplus from juniors and surplus from seniors. It controls both the wages (surplus per worker) and the flows that determine how many workers it has at each level. The workforce n_{gj} is not a direct choice — it's an equilibrium object determined by the three flows below.

### Flow 1: Inflow (Hiring)

h_g(p) = λ_g^u · u_g · [1 - H(q_g*)] · 𝟙{V_{g0}(p) ≥ U_g}

Each piece:

- **λ_g^u** = rate at which unemployed workers of gender g encounter this firm's job posting. From B&M — in a random search model, unemployed workers sample firms at some rate.
- **u_g** = mass of unemployed gender-g workers in the market (the pool of potential hires).
- **[1 - H(q_g\*)]** = probability an applicant passes the screening threshold. If the quality signal q ~ H(q), then Pr(q ≥ q*) = 1 - H(q*). Higher q* → smaller pass rate → fewer hires. This is our screening addition.
- **𝟙{V_{g0}(p) ≥ U_g}** = the worker only accepts if the value of being a junior at this firm is at least as good as unemployment. This is the standard B&M voluntary participation constraint.

**On the indicator and reservation wages:** In standard B&M with one instrument, you can define a reservation wage w_R where V(w_R) = U, and the indicator is equivalent to 𝟙{w ≥ w_R}. In our model, a reservation wage doesn't cleanly work because the worker's value V_{g0}(p) depends on the whole package — not just w₀, but also promotion prospects (θ_g) and the senior wage (w₁). A worker might accept a lower entry wage from a firm with great promotion prospects. Since V_{g0}(p) is monotonically increasing in p (higher productivity firms offer better packages on all dimensions), the correct object is a **reservation firm type** p_R such that V_{g0}(p_R) = U_g. Workers accept any firm with p ≥ p_R.

**Where each piece comes from:**
- λ_g^u · u_g is pure B&M (1998) — the flow of contacts between unemployed workers and firms
- [1 - H(q*)] is our screening addition (composite; see discussion in "Detailed Discussion" section above)
- The indicator is B&M's voluntary acceptance condition

### Flow 2: Internal Flow (Promotion)

μ_g(p) = 1 - G(θ_g)

Each period, a junior worker draws a performance signal s ~ G(s). If s ≥ θ_g, they're promoted. The promotion rate is Pr(s ≥ θ_g) = 1 - G(θ_g).

- Higher θ_g → lower promotion rate (higher bar)
- This is from **Gibbons & Waldman (1999)** — promotion happens when observed performance exceeds a threshold
- μ_g(p) is a rate (continuous time), not a probability per se, but the logic is the same

### Flow 3: Outflow (Separation)

s_g(p) = δ + λ_g · [1 - F_g(V_{gj}(p))]

Two ways a worker leaves:

- **δ** = exogenous separation (life events, relocation, etc.). Same for everyone. Pure B&M.
- **λ_g · [1 - F_g(V_{gj}(p))]** = endogenous separation through outside offers. This is the heart of the B&M model:
  - λ_g = rate at which outside offers arrive (**KEY: λ_F < λ_M**)
  - F_g(V_{gj}(p)) = fraction of outside offers that are *worse* than the worker's current value at this firm
  - [1 - F_g(V_{gj}(p))] = fraction of outside offers that are *better* → the worker leaves

A worker at a high-value firm (high V) has few better offers → low separation. A worker at a low-value firm has many better offers → high separation. And women (low λ_F) get fewer offers in the first place → lower separation at any given firm.

**This is exactly the monopsony channel:** lower λ_F → lower s_F → the firm knows women won't leave → less pressure to pay well or promote.

### Steady-State Workforce

Setting the time derivatives to zero gives the steady-state stocks:

**For juniors:**
ṅ_{g0} = h_g(p) - [μ_g(p) + s_g(p)] · n_{g0} = 0

Solving: n_{g0} = h_g(p) / [μ_g(p) + s_g(p)]

Juniors flow in through hiring and flow out through either promotion or separation.

**For seniors:**
ṅ_{g1} = μ_g(p) · n_{g0} - s_g(p) · n_{g1} = 0

Solving: n_{g1} = μ_g(p) · n_{g0} / s_g(p)

Seniors flow in from promotion and flow out through separation only (no further promotion in the two-level model).

**Substituting to get n_{g1} as a function of primitives:**

n_{g1} = μ_g(p) · h_g(p) / [s_g(p) · (μ_g(p) + s_g(p))]

### How Everything Connects

This is where the full picture comes together. The firm's choice of (w_{g0}, w_{g1}, q*, θ) flows through the three rates:

- w_{g0} and q* affect **h_g** (hiring flow) — higher entry wage attracts more; higher screening rejects more
- θ affects **μ_g** (promotion rate) — higher threshold means fewer promotions
- w_{g0}, w_{g1}, and θ all affect **s_g** (separation) through V_{gj}(p) — better packages reduce quits
- h_g, μ_g, and s_g determine **n_{g0} and n_{g1}** (the workforce)
- n_{g0}, n_{g1}, and the wages determine **π_g** (profits)

The firm maximizes π_g by choosing all four instruments optimally. The key result: because λ_F < λ_M enters through s_g (separation), the optimal θ_g depends on λ_g — and θ_F* > θ_M* (higher promotion bar for women).

### The Retention Trade-Off: Why Monopsony Distorts Promotions

The firm's promotion decision balances two forces:

**Force 1: Direct profit effect.** Promoting changes per-worker surplus. Output rises (a₁ > a₀), but so does the wage (w_{g1} > w_{g0}). The output gain p(a₁ - a₀) is gender-neutral (production doesn't depend on gender), but the surplus change π₁ - π₀ depends on gender-specific wages.

**Force 2: Retention effect.** Promoting makes the worker less likely to leave. A promoted worker has higher continuation value V_{1g} > V_{0g}, so fewer outside offers are attractive, which lowers separation. This benefit depends on λ_g.

**How gender enters through the retention effect:**

For men (high λ_M): "If I don't promote him, he'll leave." Retention urgency is high → promote to retain.

For women (low λ_F): "Even without promotion, she won't leave." Retention urgency is low → delay is low-cost.

→ θ_F* > θ_M*: higher bar for women, not from productivity differences, but because firms face less competitive pressure to promote them.

#### Formal promotion condition (two-period simplification)

To see this cleanly, consider a two-period simplification:

- Period 1: worker is junior, firm earns π₀ = p·a₀ - w_{g0}
- Between periods: outside offer arrives with probability λ_g. If promoted, continuation value is higher, so the worker is less likely to leave.

Define retention probabilities:
- r_g^P = 1 - λ_g[1 - F_g(V_{1g})]  (retention if promoted)
- r_g^N = 1 - λ_g[1 - F_g(V_{0g})]  (retention if not promoted)

Since V_{1g} > V_{0g}: r_g^P > r_g^N (promoted workers are easier to retain).

**Promote if period-2 expected profit is higher with promotion:**

(π₁ - π₀) · r_g^N + π₁ · (r_g^P - r_g^N) ≥ 0
|---- Direct profit ----|   |-- Retention value --|

- **Direct profit effect:** (π₁ - π₀) · r_g^N. If seniors are more profitable (π₁ > π₀), this is positive. Scaled by the baseline retention probability.
- **Retention value of promoting:** π₁ · (r_g^P - r_g^N). Promoting increases retention. Always positive.

**The retention term is proportional to λ_g:**

r_g^P - r_g^N = λ_g · [F_g(V_{1g}) - F_g(V_{0g})]

- As λ_g → 0: retention term vanishes → promote only if π₁ > π₀
- As λ_g → ∞: retention dominates → always promote to retain
- Since λ_F < λ_M: retention motive is weaker for women → θ_F* > θ_M*

#### Note on the production function and the direct profit effect

The output gain from promotion p(a₁ - a₀) is gender-neutral. But the surplus change π₁ - π₀ = p(a₁ - a₀) - (w_{g1} - w_{g0}) depends on gender-specific wages. Since w_{g0} and w_{g1} are both set by the firm as a function of λ_g, the direct profit effect also has a gender component — but the first-order mechanism driving differential promotion is the retention effect, which is directly proportional to λ_g.

### The Hiring Mechanism: Two Opposing Forces

Unlike the promotion result (which delivers a clear sign: θ_F > θ_M), the hiring screening decision involves **two opposing forces** whose net effect is theoretically ambiguous.

When λ_F < λ_M:

**Force 1: "Longer tenure" → screen women LESS (lower q*_F)**
Women stay longer at the firm → each hire generates surplus over more periods → the expected value of a marginal hire is higher → the firm should lower the bar to hire more women.

**Force 2: "Less competition" → screen women MORE (higher q*_F)**
Women have fewer outside options → they apply even when the bar is high → the firm can raise q*_F without losing its applicant pool → "cherry-pick" from a captive group.

**The sign of q*_F - q*_M is theoretically ambiguous.** The model does not deliver a clear prediction on the hiring margin the way it does on the promotion margin. Which force dominates is an empirical question.

**Why is this ambiguous when the promotion result is not?** For promotions, both the direct and retention effects push in the same direction: low λ_F means the firm can delay because the worker won't leave AND the retention benefit of promoting is small. For hiring, the two forces oppose: low λ_F makes each hire more valuable (favoring lower q*) but also makes the applicant pool more captive (favoring higher q*).

**Empirical test:** BUK application-to-hire conversion rates by gender, across markets with different concentration, reveal which force dominates in practice. This positions the ambiguity as a contribution — the data will resolve what theory alone cannot.

**Note on theoretical foundations:** The screening threshold q* as a firm choice variable in a search model does not have a single clean antecedent paper (see discussion in "Detailed Discussion" section). The two-force decomposition is the economically grounded way to present the hiring margin without relying on a specific FOC that lacks clean foundations.

---

## Estimation Strategy

### Targeted moments (all from BUK, by gender):
- Promotion rates at each firm (P_g(p)) — from boss_id and title changes
- Entry wages (w_{g0}) — from first salary observation in job spell
- Wage growth at promotion (w_{g1} - w_{g0}) — from salary changes at title change
- Separation rates (S_g(p)) — from job spell end dates
- Hiring rates by gender — from recruitment tables (applications → hires)
- Application rates (λ_g proxy) — from recruitment pipeline

### Identification:
- λ_F vs. λ_M identified from gender differences in application behavior and separation rates
- Productivity p identified from firm wage premia (AKM-style)
- Screening threshold q* identified from application-to-hire conversion rates by gender
- Promotion threshold θ identified from promotion rates conditional on tenure

### Variation:
- Cross-sectional: across occupation × region cells with different HHI
- Key test: do the gender gaps in promotion and hiring widen in more concentrated cells?

---

## Simplification Options

### Minimal version (1 slide):
- Drop the hiring margin; focus only on promotion
- Two-period model: worker enters at j=0, may be promoted to j=1
- Firm chooses θ_g to maximize two-period profits
- Outside offer arrives with probability λ_g between periods
- Solve for θ_g as a function of λ_g → show θ_F > θ_M when λ_F < λ_M

### Medium version (3-4 slides):
- Steady-state Burdett-Mortensen with two levels
- Firm posts (w_0, θ) — entry wage and promotion threshold
- Derive equilibrium promotion rates as a function of market concentration
- Add gender through λ_F < λ_M

### Full version (6-8 slides):
- Everything above including hiring screening
- Estimation
- Counterfactuals

---

## Reading Order for the Structural Model

1. **Burdett & Mortensen (1998)** — the backbone search model
2. **Gibbons & Waldman (1999)** — how to model promotions inside firms
3. **Sharma (2023)** — how to add gender to a monopsony model
4. **Postel-Vinay & Robin (2002)** — sequential bargaining with outside offers
5. **DeVaro & Waldman (2012)** — signaling role of promotions
6. **Shi (2002)** — directed search for the hiring margin
7. **Lang & Lehmann (2012)** — how search frictions amplify discrimination
