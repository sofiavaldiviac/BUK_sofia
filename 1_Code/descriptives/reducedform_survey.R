# ==============================================================================
# Reduced-Form Survey Evidence — Issue #2 Descriptive Plots
# ==============================================================================
# Plots for the paper's reduced-form evidence section using WiP 2026 survey.
# Variable positions and cleaning follow survey2026.R conventions.
#
# Covers:
#   Plot 1.5  (task issue2_08) — Turnover intention by gender
#   Plot 1.6  (task issue2_09) — Reasons for wanting to leave by gender
#   Plot 1.7  (task issue2_10) — Perceived promotion opportunities by gender
#   Plot 5.1  (task issue2_27) — Pay equity perceptions by gender
#   Plot 5.2  (task issue2_28) — Salary negotiation funnel by gender
#   Plot 5.3  (task issue2_29) — Job satisfaction heatmap by gender
#   Plot 5.4  (task issue2_30) — Burnout and work-life interference by gender
#   Plot 5.5  (task issue2_31) — Most valued job attributes by gender
#   Plot 5.6  (task issue2_32) — Pay equity perceptions by gender x org size
#
# --- WiP 2025 Survey (new) ---
#   Plot 5.7  — Promotion negotiation funnel by gender (2025 J3)
#   Plot 5.8  — Reasons for promotion denial by gender (2025 J3_1)
#   Plot 5.9  — Salary negotiation funnel by gender (2025 J4)
#   Plot 5.10 — Reasons for salary denial by gender (2025 J4_1)
#   Plot 5.11 — Overtime hours by gender (2025 B2)
# ==============================================================================

# --- Libraries ----------------------------------------------------------------
library(readxl)
library(tidyverse)

# --- Paths --------------------------------------------------------------------
data_path <- file.path(
  "/Users/sofiavaldivia/Dropbox/BUK/data/buk_data/survey_data/Base de datos WiP 2026.xlsx"
)
fig_dir <- "/Users/sofiavaldivia/Documents/GitHub/Chile_BUK_CNS/BUK_sofia/1_Code/figures"
dir.create(fig_dir, showWarnings = FALSE, recursive = TRUE)

# ==============================================================================
# 1. DATA LOADING
# ==============================================================================
# Load full Excel, then select and rename columns by position.
# Positions match the naming convention in survey2026.R.

raw <- read_excel(data_path, sheet = "Base de datos WiP")
cat("Raw data:", nrow(raw), "rows,", ncol(raw), "columns\n")

df <- tibble(
  # --- Demographics ---
  gender               = raw[[2]],    #  A2: Gender
  gender_rec           = raw[[3]],
  country              = raw[[8]],    #  A4: Country
  org_size             = raw[[28]],   # A10: Organization size
  org_size_rec         = raw[[29]],

  # --- Promotion opportunities (F7, F8) ---
  promotion_opp        = raw[[153]],  #  F7: Promotion opportunities (text)
  promotion_opp_rec    = raw[[154]],
  promotion_eval       = raw[[155]],  #  F8: Promotions consider evaluation
  promotion_eval_rec1  = raw[[156]],
  promotion_eval_rec2  = raw[[157]],

  # --- Satisfaction with promotions (I2) ---
  satis_promotion      = raw[[180]],  #  I2: Satisfaction with promotion
  satis_promotion_rec1 = raw[[181]],
  satis_promotion_rec2 = raw[[182]],

  # --- Turnover intention (K1) ---
  turnover_intent      = raw[[224]],  #  K1: Desire to stay/change
  turnover_intent_rec1 = raw[[225]],
  turnover_intent_rec2 = raw[[226]],  #  Collapsed: 1=change, 2=undecided, 3=stay


  # --- Turnover reasons (K1_1, multiple selection, _rec = 0/1) ---
  turn_no_growth_rec       = raw[[228]],  # Lack of growth
  turn_bad_environment_rec = raw[[230]],  # Bad environment
  turn_compensation_rec    = raw[[232]],  # Inadequate compensation
  turn_work_life_rec       = raw[[234]],  # Work-life imbalance
  turn_leadership_rec      = raw[[236]],  # Inadequate leadership
  turn_discrimination_rec  = raw[[238]],  # Discrimination / inclusion
  turn_burnout_rec         = raw[[240]],  # Burnout / exhaustion
  turn_no_purpose_rec      = raw[[242]],  # Lack of purpose

  # --- Job attributes (C2, multiple selection, _rec = 0/1) ---
  val_salary_rec        = raw[[43]],   # Salary & incentives
  val_benefits_rec      = raw[[45]],   # Benefits
  val_proximity_rec     = raw[[47]],   # Proximity to work
  val_stimulating_rec   = raw[[49]],   # Stimulating tasks
  val_flexibility_rec   = raw[[51]],   # Work flexibility
  val_remote_rec        = raw[[53]],   # Remote/hybrid work
  val_growth_rec        = raw[[55]],   # Development & growth
  val_culture_rec       = raw[[57]],   # Values & culture
  val_environment_rec   = raw[[59]],   # Good work environment
  val_social_impact_rec = raw[[61]],   # Social impact

  # --- Satisfaction (I1-I7, _rec1 = numeric 1-5 Likert) ---
  satis_recognition_rec1 = raw[[178]], # I1: Recognition
  satis_salary_rec1      = raw[[184]], # I3: Salary
  satis_flexibility_rec1 = raw[[187]], # I4: Flexibility
  satis_dei_rec1         = raw[[190]], # I5: D&I
  satis_workload_rec1    = raw[[193]], # I6: Workload
  satis_general_rec1     = raw[[196]], # I7: Overall

  # --- Pay equity (J3, J4) ---
  pay_equity_rec2        = raw[[203]], # J3 collapsed: 1=disagree, 2=neutral, 3=agree

  # --- Raise request (J5-J7) ---
  asked_raise            = raw[[207]], # J5: Asked for raise? (text Sí/No)
  raise_result           = raw[[209]], # J7: Result (text)
  raise_result_rec       = raw[[210]], # J7: Result (recoded)

  # --- Denial reasons (J7_2, _rec = 0/1) ---
  deny_market_aligned_rec = raw[[213]],
  deny_band_limit_rec     = raw[[215]],
  deny_recent_adjust_rec  = raw[[217]],
  deny_performance_rec    = raw[[219]],
  deny_budget_rec         = raw[[221]],
  deny_other_reason_rec   = raw[[223]],

  # --- Burnout (M6, _rec1 = numeric 1-5) ---
  burnout_freq_rec1      = raw[[267]],

  # --- Work-life interference (N7, _rec1 = numeric 1-5) ---
  wlb_interfere_rec1     = raw[[295]]
)
rm(raw); gc()

# --- Convert character columns that should be numeric -------------------------
df <- df %>%
  mutate(across(
    where(is.character),
    ~ {
      num <- suppressWarnings(as.numeric(.x))
      if (all(is.na(.x) | !is.na(num))) num else .x
    }
  ))

# --- Recode gender to English (before country filter) -------------------------
df <- df %>%
  mutate(gender = case_when(
    gender == "Femenino"  ~ "Female",
    gender == "Masculino" ~ "Male",
    gender == "Otro"      ~ "Other",
    TRUE ~ NA_character_
  ))

df$gender <- factor(df$gender, levels = c("Female", "Male", "Other"))

# --- Org size factor (English labels) -----------------------------------------
df <- df %>%
  mutate(
    org_size_f = case_when(
      org_size_rec == "Micro"   ~ "10 or fewer",
      org_size_rec == "Pequeña" ~ "11-49",
      org_size_rec == "Mediana" ~ "50-199",
      org_size_rec == "Grande"  ~ "200+",
      TRUE ~ NA_character_
    ),
    org_size_f = factor(org_size_f, levels = c("10 or fewer", "11-49", "50-199", "200+"))
  )

# --- All-countries dataset (binary gender) ------------------------------------
df_bin_all <- df %>% filter(gender %in% c("Female", "Male"))
df_bin_all$gender <- droplevels(df_bin_all$gender)
cat("All countries:", nrow(df_bin_all), "observations\n")

# --- Chile-only dataset -------------------------------------------------------
df_bin <- df_bin_all %>% filter(country == "Chile")
cat("Chile only:", nrow(df_bin), "observations\n")
cat("  Female:", sum(df_bin$gender == "Female"),
    " Male:", sum(df_bin$gender == "Male"), "\n\n")

# --- Datasets to loop over ---------------------------------------------------
plot_sets <- list(
  list(data = df_bin,     label = "Chile subsample", pfx = "rf"),
  list(data = df_bin_all, label = "all countries",   pfx = "rf_all")
)

# ==============================================================================
# 1B. DATA LOADING — WiP 2025
# ==============================================================================
# The 2025 survey has NO pre-recoded columns — all raw text.
# Column positions verified against the actual Excel headers.

data_path_25 <- file.path(
  "/Users/sofiavaldivia/Dropbox/BUK/data/buk_data/survey_data/Base de datos WiP 2025.xlsx"
)

raw25 <- read_excel(data_path_25, sheet = 1)
cat("2025 raw data:", nrow(raw25), "rows,", ncol(raw25), "columns\n")

df25 <- tibble(
  # --- Demographics ---
  gender            = raw25[[3]],    # A1: Gender
  country           = raw25[[6]],    # A4: Country
  org_size          = raw25[[9]],    # A7: Organization size
  industry          = raw25[[10]],   # A8: Industry

  # --- Overtime (B2) ---
  overtime_raw      = raw25[[30]],   # B2: Weekly overtime hours

  # --- Promotion negotiation (J3) ---
  promo_negotiation = raw25[[103]],  # J3: Promotion request experience

  # --- Promotion denial reasons (J3_1, multiple selection) ---
  promo_deny_experience  = raw25[[104]],  # J3_1_1: Lack of experience
  promo_deny_technical   = raw25[[105]],  # J3_1_2: Lack of technical skills
  promo_deny_leadership  = raw25[[106]],  # J3_1_3: Lack of leadership skills
  promo_deny_performance = raw25[[107]],  # J3_1_4: Insufficient performance
  promo_deny_other_cand  = raw25[[108]],  # J3_1_5: Preference for another candidate
  promo_deny_no_reason   = raw25[[109]],  # J3_1_6: No clear reasons

  # --- Salary raise negotiation (J4) ---
  raise_negotiation = raw25[[110]],  # J4: Salary raise experience

  # --- Salary denial reasons (J4_1, multiple selection) ---
  raise_deny_market      = raw25[[111]],  # J4_1_1: Market aligned
  raise_deny_recent      = raw25[[112]],  # J4_1_2: Recent adjustment
  raise_deny_performance = raw25[[113]],  # J4_1_3: Insufficient performance
  raise_deny_budget      = raw25[[114]],  # J4_1_4: Lack of budget
  raise_deny_no_reason   = raw25[[115]]   # J4_1_5: No clear reasons
)
rm(raw25); gc()

# --- Gender recoding (same as 2026) -------------------------------------------
df25 <- df25 %>%
  mutate(gender = case_when(
    gender == "Femenino"  ~ "Female",
    gender == "Masculino" ~ "Male",
    gender == "Otro"      ~ "Other",
    TRUE ~ NA_character_
  ))
df25$gender <- factor(df25$gender, levels = c("Female", "Male", "Other"))

# --- Org size factor (match 2026 levels) --------------------------------------
df25 <- df25 %>%
  mutate(
    org_size_f = case_when(
      org_size == "<10"        ~ "10 or fewer",
      org_size == "11-49"      ~ "11-49",
      org_size == "50-199"     ~ "50-199",
      org_size %in% c("200-499", "500-999", "1000 o más") ~ "200+",
      TRUE ~ NA_character_
    ),
    org_size_f = factor(org_size_f, levels = c("10 or fewer", "11-49", "50-199", "200+"))
  )

# --- Industry normalization (fix casing, top 6 + Other) -----------------------
df25 <- df25 %>%
  mutate(
    industry_clean = case_when(
      grepl("(?i)tecnolog", industry)        ~ "Technology",
      grepl("(?i)comercio", industry)        ~ "Retail",
      grepl("(?i)educaci", industry)         ~ "Education",
      grepl("(?i)servicio", industry)        ~ "Services",
      grepl("(?i)financiera", industry)      ~ "Finance & Insurance",
      grepl("(?i)salud", industry)           ~ "Health",
      is.na(industry)                        ~ NA_character_,
      TRUE                                   ~ "Other"
    ),
    industry_clean = factor(industry_clean,
                            levels = c("Technology", "Retail", "Education",
                                       "Services", "Finance & Insurance", "Health", "Other"))
  )

# --- Overtime recoding (B2) ---------------------------------------------------
df25 <- df25 %>%
  mutate(
    overtime_hrs = case_when(
      overtime_raw == "No trabajo horas extra" ~ 0,
      overtime_raw == "Más de 15 horas"        ~ 16,
      TRUE ~ suppressWarnings(as.numeric(gsub(",", "", overtime_raw)))
    )
  )

# --- Promotion funnel recoding (J3) -------------------------------------------
df25 <- df25 %>%
  mutate(
    promo_stage = case_when(
      grepl("No he pedido un ascenso", promo_negotiation)        ~ "Didn't ask",
      grepl("me lo ofreci\u00f3", promo_negotiation)             ~ "Company offered",
      grepl("S\u00ed.*y S\u00cd me lo dieron", promo_negotiation) ~ "Asked & received",
      grepl("S\u00ed.*NO me lo dieron", promo_negotiation)       ~ "Asked & denied",
      TRUE ~ NA_character_
    ),
    promo_stage = factor(promo_stage,
                         levels = c("Didn't ask", "Company offered",
                                    "Asked & received", "Asked & denied"))
  )

# --- Salary raise funnel recoding (J4) ----------------------------------------
df25 <- df25 %>%
  mutate(
    raise_stage = case_when(
      grepl("No he pedido un aumento", raise_negotiation)        ~ "Didn't ask",
      grepl("me lo ofreci\u00f3", raise_negotiation)             ~ "Company offered",
      grepl("S\u00ed.*y S\u00cd me lo dieron", raise_negotiation) ~ "Asked & received",
      grepl("S\u00ed.*NO me lo dieron", raise_negotiation)       ~ "Asked & denied",
      TRUE ~ NA_character_
    ),
    raise_stage = factor(raise_stage,
                         levels = c("Didn't ask", "Company offered",
                                    "Asked & received", "Asked & denied"))
  )

# --- Multiple-selection: non-NA = 1, NA = 0 -----------------------------------
df25 <- df25 %>%
  mutate(
    across(starts_with("promo_deny_"), ~ as.integer(!is.na(.x))),
    across(starts_with("raise_deny_"), ~ as.integer(!is.na(.x)))
  )

# --- Filter to binary gender --------------------------------------------------
df25_bin_all <- df25 %>% filter(gender %in% c("Female", "Male"))
df25_bin_all$gender <- droplevels(df25_bin_all$gender)
cat("2025 all countries:", nrow(df25_bin_all), "observations\n")

df25_bin <- df25_bin_all %>% filter(country == "Chile")
cat("2025 Chile only:", nrow(df25_bin), "observations\n")
cat("  Female:", sum(df25_bin$gender == "Female"),
    " Male:", sum(df25_bin$gender == "Male"), "\n\n")

# --- Datasets to loop over (2025) ---------------------------------------------
plot_sets_25 <- list(
  list(data = df25_bin,     label = "Chile subsample, 2025", pfx = "rf25"),
  list(data = df25_bin_all, label = "all countries, 2025",   pfx = "rf25_all")
)


# ==============================================================================
# 2. THEME & HELPERS
# ==============================================================================

# Academic palette — tones of blue (distinguishable in grayscale)
pal_gender <- c("Female" = "#1B4F72", "Male" = "#85C1E9")

theme_rf <- theme_minimal(base_size = 13) +
  theme(
    plot.title      = element_text(face = "bold", size = 14),
    plot.subtitle   = element_text(color = "grey40", size = 11),
    plot.caption    = element_text(color = "grey60", size = 9, hjust = 0),
    legend.position = "top",
    legend.title    = element_blank(),
    panel.grid.major.x = element_blank(),
    strip.text      = element_text(face = "bold")
  )

save_plot <- function(p, name, w = 8, h = 5) {
  path <- file.path(fig_dir, paste0(name, ".png"))
  ggsave(path, p, width = w, height = h, dpi = 300, bg = "white")
  cat("  Saved:", path, "\n")
}

# ==============================================================================
# PLOT 1.5 — Turnover Intention by Gender (Task issue2_08)
# ==============================================================================
cat("--- Plot 1.5: Turnover Intention by Gender ---\n")

for (ps in plot_sets) {
  d <- ps$data %>%
    filter(!is.na(turnover_intent_rec2)) %>%
    mutate(
      intention = case_when(
        turnover_intent_rec2 == 3 ~ "Do not plan\nto change",
        turnover_intent_rec2 == 2 ~ "Want to change,\nnot actively trying",
        turnover_intent_rec2 == 1 ~ "Actively trying\nto change"
      ),
      intention = factor(intention,
                         levels = c("Actively trying\nto change",
                                    "Want to change,\nnot actively trying",
                                    "Do not plan\nto change"))
    ) %>%
    filter(!is.na(intention)) %>%
    group_by(gender, intention) %>%
    summarise(n = n(), .groups = "drop") %>%
    group_by(gender) %>%
    mutate(pct = n / sum(n) * 100)

  nn <- sum(d$n)
  cat("  [", ps$label, "] N:", nn, "\n")

  p <- ggplot(d, aes(x = gender, y = pct, fill = intention)) +
    geom_col(width = 0.6) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_stack(vjust = 0.5), size = 3.5,
              color = "white", fontface = "bold") +
    scale_fill_manual(
      values = c("Actively trying\nto change"          = "#1B4F72",
                 "Want to change,\nnot actively trying" = "#5DADE2",
                 "Do not plan\nto change"               = "#D6EAF8"),
      name = "Intention"
    ) +
    labs(
      title    = "Turnover Intention by Gender",
      subtitle = "Distribution of job change plans among workers",
      x = "", y = "Share of respondents (%)",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.02)))

  save_plot(p, paste0(ps$pfx, "_1_5_turnover_intention_by_gender"))
}


# ==============================================================================
# PLOT 1.6 — Reasons for Wanting to Leave by Gender (Task issue2_09)
# ==============================================================================
cat("\n--- Plot 1.6: Reasons for Wanting to Leave by Gender ---\n")

turn_vars   <- c("turn_no_growth_rec", "turn_compensation_rec",
                 "turn_work_life_rec", "turn_leadership_rec",
                 "turn_burnout_rec", "turn_bad_environment_rec",
                 "turn_discrimination_rec", "turn_no_purpose_rec")
turn_labels <- c("Lack of growth", "Inadequate compensation",
                 "Work-life imbalance", "Inadequate leadership",
                 "Burnout / exhaustion", "Bad environment",
                 "Discrimination", "Lack of purpose")

for (ps in plot_sets) {
  d <- ps$data %>%
    filter(turnover_intent_rec2 %in% c(1, 2)) %>%
    select(gender, all_of(turn_vars)) %>%
    pivot_longer(-gender, names_to = "reason", values_to = "selected") %>%
    filter(!is.na(selected)) %>%
    group_by(gender, reason) %>%
    summarise(pct = mean(selected == 1, na.rm = TRUE) * 100,
              n = n(), .groups = "drop") %>%
    mutate(
      reason_label = turn_labels[match(reason, turn_vars)],
      reason_label = fct_reorder(reason_label, pct, .fun = max)
    )

  nn <- ps$data %>% filter(turnover_intent_rec2 %in% c(1, 2)) %>% nrow()
  cat("  [", ps$label, "] N wanting to change:", nn, "\n")

  p <- ggplot(d, aes(x = reason_label, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), hjust = -0.15, size = 3) +
    coord_flip() +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Reasons for Wanting to Change Job, by Gender",
      subtitle = "Among workers who want to change (conditional on turnover intent)",
      x = "", y = "% citing reason",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.20)))

  save_plot(p, paste0(ps$pfx, "_1_6_turnover_reasons_by_gender"), w = 9, h = 5.5)

  # --- Plot 1.6b: Turnover reasons by gender x org size -----------------------
  d_org <- ps$data %>%
    filter(turnover_intent_rec2 %in% c(1, 2), !is.na(org_size_f)) %>%
    select(gender, org_size_f, all_of(turn_vars)) %>%
    pivot_longer(-c(gender, org_size_f), names_to = "reason", values_to = "selected") %>%
    filter(!is.na(selected)) %>%
    group_by(gender, org_size_f, reason) %>%
    summarise(pct = mean(selected == 1, na.rm = TRUE) * 100,
              n = n(), .groups = "drop") %>%
    mutate(
      reason_label = turn_labels[match(reason, turn_vars)],
      reason_label = fct_reorder(reason_label, pct, .fun = max)
    )

  nn_org <- ps$data %>%
    filter(turnover_intent_rec2 %in% c(1, 2), !is.na(org_size_f)) %>% nrow()
  cat("  [", ps$label, "] N wanting to change (with org size):", nn_org, "\n")

  p_org <- ggplot(d_org, aes(x = reason_label, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), hjust = -0.15, size = 2.5) +
    coord_flip() +
    facet_wrap(~ org_size_f, nrow = 1) +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Reasons for Wanting to Change Job, by Gender and Organization Size",
      subtitle = "Among workers who want to change (conditional on turnover intent)",
      x = "", y = "% citing reason",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nn_org, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.25)))

  save_plot(p_org, paste0(ps$pfx, "_1_6_turnover_reasons_by_gender_org"), w = 14, h = 6)
}


# ==============================================================================
# PLOT 1.7 — Perceived Promotion Opportunities by Gender (Task issue2_10)
# ==============================================================================
cat("\n--- Plot 1.7: Perceived Promotion Opportunities by Gender ---\n")

for (ps in plot_sets) {
  d <- ps$data %>%
    filter(!is.na(promotion_opp)) %>%
    mutate(
      promo_cat = case_when(
        grepl("política clara y percibo", promotion_opp) ~
          "Clear policy,\nreal opportunities",
        grepl("política clara, pero las oportunidades son limitadas", promotion_opp) ~
          "Clear policy,\nlimited opportunities",
        grepl("no hay una política clara", promotion_opp) ~
          "Promotions exist,\nno clear policy",
        grepl("No existen", promotion_opp) ~
          "No promotions\nexist",
        grepl("No lo sé", promotion_opp) ~
          "Don't know",
        TRUE ~ NA_character_
      ),
      promo_cat = factor(promo_cat,
                         levels = c("Clear policy,\nreal opportunities",
                                    "Clear policy,\nlimited opportunities",
                                    "Promotions exist,\nno clear policy",
                                    "No promotions\nexist",
                                    "Don't know"))
    ) %>%
    filter(!is.na(promo_cat)) %>%
    group_by(gender, promo_cat) %>%
    summarise(n = n(), .groups = "drop") %>%
    group_by(gender) %>%
    mutate(pct = n / sum(n) * 100)

  nn <- sum(d$n)
  cat("  [", ps$label, "] N:", nn, "\n")

  p <- ggplot(d, aes(x = promo_cat, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), vjust = -0.4, size = 3) +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Perceived Promotion Opportunities by Gender",
      subtitle = "How workers characterize promotion/advancement at their organization",
      x = "", y = "Share of respondents (%)",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.15)))

  save_plot(p, paste0(ps$pfx, "_1_7_promotion_perceptions_by_gender"), w = 10, h = 5.5)
}


# ==============================================================================
# PLOT 5.1 — Pay Equity Perceptions by Gender (Task issue2_27)
# ==============================================================================
cat("\n--- Plot 5.1: Pay Equity Perceptions by Gender ---\n")

for (ps in plot_sets) {
  d <- ps$data %>%
    filter(!is.na(pay_equity_rec2)) %>%
    mutate(
      response = case_when(
        pay_equity_rec2 == 1 ~ "Disagree",
        pay_equity_rec2 == 2 ~ "Neutral",
        pay_equity_rec2 == 3 ~ "Agree"
      ),
      response = factor(response, levels = c("Agree", "Neutral", "Disagree"))
    ) %>%
    group_by(gender, response) %>%
    summarise(n = n(), .groups = "drop") %>%
    group_by(gender) %>%
    mutate(pct = n / sum(n) * 100)

  nn <- sum(d$n)
  cat("  [", ps$label, "] N:", nn, "\n")

  p <- ggplot(d, aes(x = gender, y = pct, fill = response)) +
    geom_col(width = 0.6) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_stack(vjust = 0.5), size = 3.5,
              color = "white", fontface = "bold") +
    scale_fill_manual(
      values = c("Agree"    = "#D6EAF8",
                 "Neutral"  = "#5DADE2",
                 "Disagree" = "#1B4F72"),
      name = ""
    ) +
    labs(
      title    = "Pay Equity Perceptions by Gender",
      subtitle = "'Men and women receive equal pay for equal responsibility'",
      x = "", y = "Share of respondents (%)",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.02)))

  save_plot(p, paste0(ps$pfx, "_5_1_pay_equity_by_gender"))
}


# ==============================================================================
# PLOT 5.2 — Salary Negotiation Funnel by Gender (Task issue2_28)
# ==============================================================================
cat("\n--- Plot 5.2: Salary Negotiation Funnel by Gender ---\n")

deny_vars   <- c("deny_budget_rec", "deny_performance_rec",
                 "deny_market_aligned_rec", "deny_band_limit_rec",
                 "deny_recent_adjust_rec", "deny_other_reason_rec")
deny_labels <- c("Lack of budget", "Low performance",
                 "Aligned with market", "Salary band limit",
                 "Recent adjustment", "Other reason")

for (ps in plot_sets) {
  stage1 <- ps$data %>%
    filter(!is.na(asked_raise)) %>%
    group_by(gender) %>%
    summarise(pct = mean(asked_raise == 1, na.rm = TRUE) * 100,
              n = n(), .groups = "drop") %>%
    mutate(stage = "Asked for\na raise")

  stage2 <- ps$data %>%
    filter(asked_raise == 1, !is.na(raise_result_rec)) %>%
    group_by(gender) %>%
    summarise(pct = mean(raise_result_rec == 1, na.rm = TRUE) * 100,
              n = n(), .groups = "drop") %>%
    mutate(stage = "Received\nthe raise")

  stage3_base <- ps$data %>%
    filter(asked_raise == 1, raise_result_rec != 1)

  d <- bind_rows(stage1, stage2) %>%
    mutate(stage = factor(stage, levels = c("Asked for\na raise",
                                            "Received\nthe raise")))

  nn <- sum(stage1$n)
  cat("  [", ps$label, "] N base:", nn,
      " | asked:", sum(ps$data$asked_raise == 1, na.rm = TRUE),
      " | denied:", nrow(stage3_base), "\n")

  p <- ggplot(d, aes(x = stage, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), vjust = -0.4, size = 3.2) +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Salary Negotiation Funnel by Gender",
      subtitle = "% who asked for a raise, and % who received it (among those who asked)",
      x = "", y = "%",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.15)))

  save_plot(p, paste0(ps$pfx, "_5_2_negotiation_funnel_by_gender"))

  # Denial reasons
  d_deny <- stage3_base %>%
    select(gender, all_of(deny_vars)) %>%
    pivot_longer(-gender, names_to = "reason", values_to = "selected") %>%
    filter(!is.na(selected)) %>%
    group_by(gender, reason) %>%
    summarise(pct = mean(selected == 1, na.rm = TRUE) * 100,
              n = n(), .groups = "drop") %>%
    mutate(
      reason_label = deny_labels[match(reason, deny_vars)],
      reason_label = fct_reorder(reason_label, pct, .fun = max)
    )

  p_d <- ggplot(d_deny, aes(x = reason_label, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), hjust = -0.15, size = 3) +
    coord_flip() +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Reasons for Raise Denial, by Gender",
      subtitle = "Among workers whose raise request was denied",
      x = "", y = "% citing reason",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nrow(stage3_base), big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.20)))

  save_plot(p_d, paste0(ps$pfx, "_5_2_denial_reasons_by_gender"), w = 9, h = 5)
}


# ==============================================================================
# PLOT 5.3 — Job Satisfaction Heatmap by Gender (Task issue2_29)
# ==============================================================================
cat("\n--- Plot 5.3: Job Satisfaction Heatmap by Gender ---\n")

satis_vars   <- c("satis_salary_rec1", "satis_promotion_rec1",
                  "satis_recognition_rec1", "satis_flexibility_rec1",
                  "satis_workload_rec1", "satis_dei_rec1",
                  "satis_general_rec1")
satis_labels <- c("Salary", "Promotions", "Recognition",
                  "Flexibility", "Workload", "D&I", "Overall")

for (ps in plot_sets) {
  d <- ps$data %>%
    select(gender, all_of(satis_vars)) %>%
    pivot_longer(-gender, names_to = "dimension", values_to = "score") %>%
    filter(!is.na(score)) %>%
    group_by(gender, dimension) %>%
    summarise(mean_score = mean(score, na.rm = TRUE),
              n = n(), .groups = "drop") %>%
    mutate(
      dim_label = satis_labels[match(dimension, satis_vars)],
      dim_label = factor(dim_label, levels = rev(satis_labels))
    )

  nn <- ps$data %>% filter(!is.na(satis_general_rec1)) %>% nrow()
  cat("  [", ps$label, "] N:", nn, "\n")

  p <- ggplot(d, aes(x = gender, y = dim_label, fill = mean_score)) +
    geom_tile(color = "white", linewidth = 1.5) +
    geom_text(aes(label = sprintf("%.2f", mean_score)),
              size = 4, fontface = "bold", color = "white") +
    scale_fill_gradient(low = "#1B4F72", high = "#AED6F1",
                        limits = c(1, 5), name = "Mean\n(1-5)") +
    labs(
      title    = "Job Satisfaction by Gender",
      subtitle = "Mean satisfaction score (1 = very dissatisfied, 5 = very satisfied)",
      x = "", y = "",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    theme(panel.grid = element_blank(),
          legend.position = "right")

  save_plot(p, paste0(ps$pfx, "_5_3_satisfaction_heatmap_by_gender"), w = 7, h = 5)
}


# ==============================================================================
# PLOT 5.4 — Burnout and Work-Life Interference by Gender (Task issue2_30)
# ==============================================================================
cat("\n--- Plot 5.4: Burnout and Work-Life Interference by Gender ---\n")

for (ps in plot_sets) {
  d_burnout <- ps$data %>%
    filter(!is.na(burnout_freq_rec1)) %>%
    group_by(gender) %>%
    summarise(pct = mean(burnout_freq_rec1 >= 4) * 100,
              n = n(), .groups = "drop") %>%
    mutate(measure = "Burnout")

  d_wlb <- ps$data %>%
    filter(!is.na(wlb_interfere_rec1)) %>%
    group_by(gender) %>%
    summarise(pct = mean(wlb_interfere_rec1 >= 4) * 100,
              n = n(), .groups = "drop") %>%
    mutate(measure = "Work interfered\nwith personal life")

  d <- bind_rows(d_burnout, d_wlb) %>%
    mutate(measure = factor(measure, levels = c("Burnout",
                                                 "Work interfered\nwith personal life")))

  nn <- sum(d_burnout$n)
  cat("  [", ps$label, "] N:", nn, "\n")

  p <- ggplot(d, aes(x = measure, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), vjust = -0.4, size = 3.5) +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Burnout and Work-Life Interference by Gender",
      subtitle = "% reporting 'often' or 'always' during 2025",
      x = "", y = "% of respondents",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.15)))

  save_plot(p, paste0(ps$pfx, "_5_4_burnout_wlb_by_gender"))
}


# ==============================================================================
# PLOT 5.5 — Most Valued Job Attributes by Gender (Task issue2_31)
# ==============================================================================
cat("\n--- Plot 5.5: Most Valued Job Attributes by Gender ---\n")

attr_vars   <- c("val_salary_rec", "val_benefits_rec", "val_proximity_rec",
                 "val_stimulating_rec", "val_flexibility_rec", "val_remote_rec",
                 "val_growth_rec", "val_culture_rec", "val_environment_rec",
                 "val_social_impact_rec")
attr_labels <- c("Salary & incentives", "Benefits", "Proximity to work",
                 "Stimulating tasks", "Flexibility", "Remote/hybrid work",
                 "Growth opportunities", "Values & culture",
                 "Work environment", "Social impact")

for (ps in plot_sets) {
  d <- ps$data %>%
    select(gender, all_of(attr_vars)) %>%
    pivot_longer(-gender, names_to = "attribute", values_to = "selected") %>%
    filter(!is.na(selected)) %>%
    group_by(gender, attribute) %>%
    summarise(pct = mean(selected == 1, na.rm = TRUE) * 100,
              n = n(), .groups = "drop") %>%
    mutate(
      attr_label = attr_labels[match(attribute, attr_vars)],
      attr_label = fct_reorder(attr_label, pct, .fun = max)
    )

  nn <- ps$data %>% filter(!is.na(val_salary_rec)) %>% nrow()
  cat("  [", ps$label, "] N:", nn, "\n")

  p <- ggplot(d, aes(x = attr_label, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), hjust = -0.15, size = 2.8) +
    coord_flip() +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Most Valued Job Attributes by Gender",
      subtitle = "% selecting each attribute among top 3 priorities",
      x = "", y = "% selecting",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.20)))

  save_plot(p, paste0(ps$pfx, "_5_5_job_attributes_by_gender"), w = 9, h = 6)
}


# ==============================================================================
# PLOT 5.6 — Pay Equity Perceptions by Gender x Org Size (Task issue2_32)
# ==============================================================================
cat("\n--- Plot 5.6: Pay Equity Perceptions by Gender x Org Size ---\n")

for (ps in plot_sets) {
  d <- ps$data %>%
    filter(!is.na(pay_equity_rec2), !is.na(org_size_f)) %>%
    group_by(gender, org_size_f) %>%
    summarise(pct_agree = mean(pay_equity_rec2 == 3) * 100,
              n = n(), .groups = "drop")

  nn <- sum(d$n)
  cat("  [", ps$label, "] N:", nn, "\n")

  p <- ggplot(d, aes(x = org_size_f, y = pct_agree, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct_agree), "%")),
              position = position_dodge(0.8), vjust = -0.4, size = 3.2) +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Pay Equity Perceptions by Gender and Organization Size",
      subtitle = "% agreeing: 'men and women receive equal pay for equal responsibility'",
      x = "Organization size (employees)", y = "% Agree",
      caption  = paste0("Source: Work in Progress Survey 2026 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.15)))

  save_plot(p, paste0(ps$pfx, "_5_6_pay_equity_by_gender_x_orgsize"), w = 9, h = 5.5)
}


# ==============================================================================
# PLOT 5.7 — Promotion Negotiation Funnel by Gender (2025 J3)
# ==============================================================================
cat("\n--- Plot 5.7: Promotion Negotiation Funnel by Gender (2025) ---\n")

pal_stage4 <- c("Didn't ask"       = "#1B4F72",
                "Company offered"   = "#2E86C1",
                "Asked & received"  = "#85C1E9",
                "Asked & denied"    = "#D6EAF8")

for (ps in plot_sets_25) {
  d <- ps$data %>%
    filter(!is.na(promo_stage)) %>%
    group_by(gender, promo_stage) %>%
    summarise(n = n(), .groups = "drop") %>%
    group_by(gender) %>%
    mutate(pct = n / sum(n) * 100)

  nn <- sum(d$n)
  cat("  [", ps$label, "] N:", nn, "\n")

  # (a) Grouped bar chart
  p_a <- ggplot(d, aes(x = promo_stage, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), vjust = -0.4, size = 3.2) +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Promotion Negotiation Funnel by Gender",
      subtitle = "Experience requesting a promotion in the last 2 years",
      x = "", y = "Share of respondents (%)",
      caption  = paste0("Source: Work in Progress Survey 2025 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.15)))

  save_plot(p_a, paste0(ps$pfx, "_5_7_promotion_funnel_by_gender"), w = 10, h = 5.5)

  # (b) Stacked 100% bar
  p_b <- ggplot(d, aes(x = gender, y = pct, fill = promo_stage)) +
    geom_col(width = 0.6) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_stack(vjust = 0.5), size = 3.5,
              color = "white", fontface = "bold") +
    scale_fill_manual(values = pal_stage4, name = "") +
    labs(
      title    = "Promotion Negotiation Funnel by Gender",
      subtitle = "Distribution of promotion request outcomes",
      x = "", y = "Share of respondents (%)",
      caption  = paste0("Source: Work in Progress Survey 2025 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.02)))

  save_plot(p_b, paste0(ps$pfx, "_5_7_promotion_funnel_stacked"), w = 8, h = 5)
}


# ==============================================================================
# PLOT 5.8 — Reasons for Promotion Denial by Gender (2025 J3_1)
# ==============================================================================
cat("\n--- Plot 5.8: Promotion Denial Reasons by Gender (2025) ---\n")

promo_deny_vars   <- c("promo_deny_experience", "promo_deny_technical",
                        "promo_deny_leadership", "promo_deny_performance",
                        "promo_deny_other_cand", "promo_deny_no_reason")
promo_deny_labels <- c("Lack of experience", "Lack of technical skills",
                        "Lack of leadership", "Insufficient performance",
                        "Preference for\nanother candidate", "No clear reasons\ngiven")

for (ps in plot_sets_25) {
  base <- ps$data %>% filter(promo_stage == "Asked & denied")
  nn <- nrow(base)
  cat("  [", ps$label, "] N denied:", nn, "\n")

  d <- base %>%
    select(gender, all_of(promo_deny_vars)) %>%
    pivot_longer(-gender, names_to = "reason", values_to = "selected") %>%
    group_by(gender, reason) %>%
    summarise(pct = mean(selected == 1, na.rm = TRUE) * 100,
              n = n(), .groups = "drop") %>%
    mutate(
      reason_label = promo_deny_labels[match(reason, promo_deny_vars)],
      reason_label = fct_reorder(reason_label, pct, .fun = max)
    )

  sub_text <- "Among workers whose promotion request was denied"
  if (nn < 150) sub_text <- paste0(sub_text, " (N = ", nn, ", interpret with caution)")

  p <- ggplot(d, aes(x = reason_label, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), hjust = -0.15, size = 3) +
    coord_flip() +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Reasons for Promotion Denial, by Gender",
      subtitle = sub_text,
      x = "", y = "% citing reason",
      caption  = paste0("Source: Work in Progress Survey 2025 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.20)))

  save_plot(p, paste0(ps$pfx, "_5_8_promotion_denial_reasons_by_gender"), w = 9, h = 5.5)
}


# ==============================================================================
# PLOT 5.9 — Salary Negotiation Funnel by Gender (2025 J4)
# ==============================================================================
cat("\n--- Plot 5.9: Salary Negotiation Funnel by Gender (2025) ---\n")

for (ps in plot_sets_25) {
  d <- ps$data %>%
    filter(!is.na(raise_stage)) %>%
    group_by(gender, raise_stage) %>%
    summarise(n = n(), .groups = "drop") %>%
    group_by(gender) %>%
    mutate(pct = n / sum(n) * 100)

  nn <- sum(d$n)
  cat("  [", ps$label, "] N:", nn, "\n")

  # (a) Grouped bar chart
  p_a <- ggplot(d, aes(x = raise_stage, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), vjust = -0.4, size = 3.2) +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Salary Negotiation Funnel by Gender",
      subtitle = "Experience requesting a salary raise in the last 2 years",
      x = "", y = "Share of respondents (%)",
      caption  = paste0("Source: Work in Progress Survey 2025 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.15)))

  save_plot(p_a, paste0(ps$pfx, "_5_9_salary_funnel_by_gender"), w = 10, h = 5.5)

  # (b) Stacked 100% bar
  p_b <- ggplot(d, aes(x = gender, y = pct, fill = raise_stage)) +
    geom_col(width = 0.6) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_stack(vjust = 0.5), size = 3.5,
              color = "white", fontface = "bold") +
    scale_fill_manual(values = pal_stage4, name = "") +
    labs(
      title    = "Salary Negotiation Funnel by Gender",
      subtitle = "Distribution of salary raise request outcomes",
      x = "", y = "Share of respondents (%)",
      caption  = paste0("Source: Work in Progress Survey 2025 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.02)))

  save_plot(p_b, paste0(ps$pfx, "_5_9_salary_funnel_stacked"), w = 8, h = 5)
}


# ==============================================================================
# PLOT 5.10 — Reasons for Salary Denial by Gender (2025 J4_1)
# ==============================================================================
cat("\n--- Plot 5.10: Salary Denial Reasons by Gender (2025) ---\n")

raise_deny_vars   <- c("raise_deny_market", "raise_deny_recent",
                        "raise_deny_performance", "raise_deny_budget",
                        "raise_deny_no_reason")
raise_deny_labels <- c("Already market-aligned", "Recent salary\nadjustment",
                        "Insufficient\nperformance", "Lack of budget",
                        "No clear reasons\ngiven")

for (ps in plot_sets_25) {
  base <- ps$data %>% filter(raise_stage == "Asked & denied")
  nn <- nrow(base)
  cat("  [", ps$label, "] N denied:", nn, "\n")

  d <- base %>%
    select(gender, all_of(raise_deny_vars)) %>%
    pivot_longer(-gender, names_to = "reason", values_to = "selected") %>%
    group_by(gender, reason) %>%
    summarise(pct = mean(selected == 1, na.rm = TRUE) * 100,
              n = n(), .groups = "drop") %>%
    mutate(
      reason_label = raise_deny_labels[match(reason, raise_deny_vars)],
      reason_label = fct_reorder(reason_label, pct, .fun = max)
    )

  sub_text <- "Among workers whose salary raise request was denied"
  if (nn < 150) sub_text <- paste0(sub_text, " (N = ", nn, ", interpret with caution)")

  p <- ggplot(d, aes(x = reason_label, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), hjust = -0.15, size = 3) +
    coord_flip() +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Reasons for Salary Raise Denial, by Gender",
      subtitle = sub_text,
      x = "", y = "% citing reason",
      caption  = paste0("Source: Work in Progress Survey 2025 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.20)))

  save_plot(p, paste0(ps$pfx, "_5_10_salary_denial_reasons_by_gender"), w = 9, h = 5.5)
}


# ==============================================================================
# PLOT 5.11 — Overtime Hours by Gender (2025 B2)
# ==============================================================================
cat("\n--- Plot 5.11: Overtime Hours by Gender (2025) ---\n")

for (ps in plot_sets_25) {
  d <- ps$data %>%
    filter(!is.na(overtime_hrs)) %>%
    mutate(
      ot_bin = case_when(
        overtime_hrs == 0              ~ "0 (none)",
        overtime_hrs >= 1  & overtime_hrs <= 4  ~ "1-4",
        overtime_hrs >= 5  & overtime_hrs <= 9  ~ "5-9",
        overtime_hrs >= 10 & overtime_hrs <= 14 ~ "10-14",
        overtime_hrs >= 15                      ~ "15+"
      ),
      ot_bin = factor(ot_bin, levels = c("0 (none)", "1-4", "5-9", "10-14", "15+"))
    )

  nn <- nrow(d)
  cat("  [", ps$label, "] N:", nn, "\n")

  # (a) Overall: distribution of overtime bins by gender
  d_overall <- d %>%
    group_by(gender, ot_bin) %>%
    summarise(n = n(), .groups = "drop") %>%
    group_by(gender) %>%
    mutate(pct = n / sum(n) * 100)

  p_a <- ggplot(d_overall, aes(x = ot_bin, y = pct, fill = gender)) +
    geom_col(position = position_dodge(0.8), width = 0.7) +
    geom_text(aes(label = paste0(round(pct), "%")),
              position = position_dodge(0.8), vjust = -0.4, size = 3) +
    scale_fill_manual(values = pal_gender) +
    labs(
      title    = "Weekly Overtime Hours by Gender",
      subtitle = "Distribution of self-reported overtime hours per week",
      x = "Overtime hours per week", y = "Share of respondents (%)",
      caption  = paste0("Source: Work in Progress Survey 2025 (", ps$label, ", N = ",
                        format(nn, big.mark = ","), ")")
    ) +
    theme_rf +
    scale_y_continuous(expand = expansion(mult = c(0, 0.15)))

  save_plot(p_a, paste0(ps$pfx, "_5_11_overtime_by_gender"), w = 9, h = 5.5)

  # (b) By top industries (exclude "Other" from facet)
  d_ind <- d %>%
    filter(!is.na(industry_clean), industry_clean != "Other") %>%
    group_by(gender, industry_clean) %>%
    summarise(mean_ot = mean(overtime_hrs, na.rm = TRUE),
              n = n(), .groups = "drop")

  nn_ind <- sum(d_ind$n)
  if (nn_ind > 50) {
    p_b <- ggplot(d_ind, aes(x = industry_clean, y = mean_ot, fill = gender)) +
      geom_col(position = position_dodge(0.8), width = 0.7) +
      geom_text(aes(label = sprintf("%.1f", mean_ot)),
                position = position_dodge(0.8), vjust = -0.4, size = 2.8) +
      scale_fill_manual(values = pal_gender) +
      labs(
        title    = "Mean Weekly Overtime Hours by Gender and Industry",
        subtitle = "Top 6 industries by respondent count",
        x = "", y = "Mean overtime hours/week",
        caption  = paste0("Source: Work in Progress Survey 2025 (", ps$label, ", N = ",
                          format(nn_ind, big.mark = ","), ")")
      ) +
      theme_rf +
      theme(axis.text.x = element_text(angle = 30, hjust = 1)) +
      scale_y_continuous(expand = expansion(mult = c(0, 0.15)))

    save_plot(p_b, paste0(ps$pfx, "_5_11_overtime_by_gender_industry"), w = 10, h = 5.5)
  } else {
    cat("    Skipping industry facet — too few observations (", nn_ind, ")\n")
  }
}


# ==============================================================================
# Summary
# ==============================================================================
cat("\n=== Reduced-form survey plots complete ===\n")
cat("Figures saved to:", fig_dir, "\n")
