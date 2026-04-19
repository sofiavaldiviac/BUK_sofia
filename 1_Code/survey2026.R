# ==============================================================================
# WiP 2026 Survey -- Data Loading & Variable Renaming
# ==============================================================================
# Data source:  "Base de datos WiP 2026.xlsx"
# Codebook:     "Cuestionario WiP 2026_Stanford.pdf"
#
# Naming conventions:
#   _rec, _rec1, _rec2, _rec3 = recoded versions of the original variable
#   ind_  prefix               = independent workers questionnaire
#   val_  prefix               = job value items (C2)
#   train_ prefix              = training skill items (F2_1)
#   effect_ prefix             = training effect items (F2_2)
#   future_ prefix             = desired future training items (F3)
#   neg_  prefix               = negative productivity factors (G4)
#   deny_ prefix               = reasons raise was denied
#   turn_ prefix               = turnover reasons
#   emo_  prefix               = emotion items
#   wlb_  prefix               = work-life balance items
#   satis_ prefix              = satisfaction items
#   trust_ prefix              = organizational trust items
#   prod_ prefix               = productivity items
# ==============================================================================

# --- Libraries ----------------------------------------------------------------
library(readxl)
library(tidyverse)

# --- Load data ----------------------------------------------------------------
data_path <- file.path("/Users/sofiavaldivia/Documents/GitHub/Chile_BUK_CNS/3_Documents/Original/Base de datos WiP 2026.xlsx")
df <- read_excel(data_path, sheet = "Base de datos WiP")

# --- Rename all variables (by position) ---------------------------------------
names(df) <- c(
  # == Section 1: Characterization (A) =========================================
  "id",                          #  1  ID
  "gender",                      #  2  A2: Gender
  "gender_rec",                  #  3
  "birth_year",                  #  4  A3: Birth year
  "birth_year_rec1",             #  5
  "birth_year_rec2",             #  6
  "birth_year_rec3",             #  7
  "country",                     #  8  A4: Country of organization
  "country_rec",                 #  9
  "country_other",               # 10
  "income_cl",                   # 11  A5: Monthly net income -- Chile
  "income_cl_rec",               # 12
  "income_pe",                   # 13  A5: Income -- Peru
  "income_pe_rec",               # 14
  "income_co",                   # 15  A5: Income -- Colombia
  "income_co_rec",               # 16
  "income_mx",                   # 17  A5: Income -- Mexico
  "income_mx_rec",               # 18
  "income_other",                # 19  A5: Income -- Other country
  "income_other_rec",            # 20
  "tenure",                      # 21  A6: Time in current job
  "tenure_rec",                  # 22
  "employment_type",             # 23  A7: Employee vs. independent
  "role",                        # 24  A8: Role in the organization
  "role_rec",                    # 25
  "direct_reports",              # 26  A9: People in charge
  "direct_reports_rec",          # 27
  "org_size",                    # 28  A10: Organization size
  "org_size_rec",                # 29
  "hr_software",                 # 30  A11: Use HR software?
  "hr_software_rec",             # 31
  "uses_buk",                    # 32  A11_1: Is the software Buk?
  "uses_buk_rec",                # 33

  # == Section 2: Work Schedule (B) ============================================
  "work_schedule",               # 34  B1: Work schedule type
  "work_schedule_other",         # 35
  "remote_work",                 # 36  B2: Remote work possibility
  "remote_work_rec1",            # 37
  "remote_work_rec2",            # 38
  "flex_hours",                  # 39  B3: Schedule flexibility
  "flex_hours_rec",              # 40

  # == Section 3: Talent Attraction (C) ========================================
  "enps",                        # 41  C1: eNPS (0-10)

  # C2: Most valued job aspects (multiple selection)
  "val_salary",                  # 42  Salary & incentives
  "val_salary_rec",              # 43
  "val_benefits",                # 44  Benefits
  "val_benefits_rec",            # 45
  "val_proximity",               # 46  Proximity to work
  "val_proximity_rec",           # 47
  "val_stimulating",             # 48  Stimulating tasks
  "val_stimulating_rec",         # 49
  "val_flexibility",             # 50  Work flexibility
  "val_flexibility_rec",         # 51
  "val_remote",                  # 52  Remote/hybrid work
  "val_remote_rec",              # 53
  "val_growth",                  # 54  Development & growth
  "val_growth_rec",              # 55
  "val_culture",                 # 56  Values & culture
  "val_culture_rec",             # 57
  "val_environment",             # 58  Good work environment
  "val_environment_rec",         # 59
  "val_social_impact",           # 60  Social impact
  "val_social_impact_rec",       # 61

  # == Section 4: Benefits (D) =================================================
  "org_benefits",                # 62  D1: Organization offers benefits?
  "org_benefits_rec",            # 63
  "benefits_fit",                # 64  D2: Benefits fit needs?
  "benefits_fit_rec1",           # 65
  "benefits_fit_rec2",           # 66

  # == Section 6: Training (F) =================================================
  "own_development",             # 67  F1: Responsible for own development
  "own_development_rec1",        # 68
  "own_development_rec2",        # 69
  "org_training",                # 70  F2: Completed training?
  "org_training_rec",            # 71

  # F2_1: Training skills (multiple selection)
  "train_leadership",            # 72  Leadership & management
  "train_leadership_rec",        # 73
  "train_communication",         # 74  Effective communication
  "train_communication_rec",     # 75
  "train_teamwork",              # 76  Teamwork
  "train_teamwork_rec",          # 77
  "train_time_mgmt",             # 78  Time management
  "train_time_mgmt_rec",         # 79
  "train_technical",             # 80  Technical skills
  "train_technical_rec",         # 81
  "train_digital",               # 82  Digital transformation
  "train_digital_rec",           # 83
  "train_ai",                    # 84  Artificial intelligence
  "train_ai_rec",                # 85
  "train_wellbeing",             # 86  Wellbeing & stress
  "train_wellbeing_rec",         # 87
  "train_dei",                   # 88  Diversity & inclusion
  "train_dei_rec",               # 89
  "train_problem_solving",       # 90  Problem solving
  "train_problem_solving_rec",   # 91
  "train_customer_svc",          # 92  Customer service
  "train_customer_svc_rec",      # 93
  "train_language",              # 94  Language
  "train_language_rec",          # 95
  "train_other_skill",           # 96  Other skills
  "train_other_skill_rec",       # 97

  # F2_2: Training effects (multiple selection)
  "effect_skills_updated",       # 98  Updated skills
  "effect_skills_updated_rec",   # 99
  "effect_productivity",         #100  Improved productivity
  "effect_productivity_rec",     #101
  "effect_growth",               #102  Improved opportunities
  "effect_growth_rec",           #103
  "effect_motivation",           #104  Increased motivation
  "effect_motivation_rec",       #105
  "effect_confidence",           #106  Strengthened confidence
  "effect_confidence_rec",       #107
  "effect_quality",              #108  Improved quality
  "effect_quality_rec",          #109
  "effect_none",                 #110  No positive effect
  "effect_none_rec",             #111

  # F3: Future training areas (multiple selection)
  "future_technical",            #112  Technical skills
  "future_technical_rec",        #113
  "future_soft_skills",          #114  Soft skills
  "future_soft_skills_rec",      #115
  "future_leadership",           #116  Leadership & management
  "future_leadership_rec",       #117
  "future_productivity",         #118  Productivity & time
  "future_productivity_rec",     #119
  "future_processes",            #120  Internal processes
  "future_processes_rec",        #121
  "future_products",             #122  Products or services
  "future_products_rec",         #123
  "future_digital",              #124  Digital transformation (AI)
  "future_digital_rec",          #125
  "future_other_area",           #126  Other
  "future_other_area_rec",       #127
  "future_no_interest",          #128  Not interested
  "future_no_interest_rec",      #129

  # == Section 7: Productivity (G) =============================================
  "prod_tasks_on_time",          #130  G1: Complete tasks on time
  "prod_tasks_on_time_rec1",     #131
  "prod_tasks_on_time_rec2",     #132
  "prod_quality",                #133  G2: Satisfaction with quality
  "prod_quality_rec1",           #134
  "prod_quality_rec2",           #135
  "prod_time_efficient",         #136  G3: Efficient time use
  "prod_time_efficient_rec1",    #137
  "prod_time_efficient_rec2",    #138

  # G4: Negative productivity factors (multiple selection)
  "neg_interruptions",           #139  Interruptions & meetings
  "neg_interruptions_rec",       #140
  "neg_planning",                #141  Lack of planning
  "neg_planning_rec",            #142
  "neg_motivation",              #143  Low motivation
  "neg_motivation_rec",          #144
  "neg_incentives",              #145  Insufficient incentives
  "neg_incentives_rec",          #146
  "neg_tools",                   #147  Lack of tools
  "neg_tools_rec",               #148
  "neg_communication",           #149  Communication problems
  "neg_communication_rec",       #150
  "neg_overload",                #151  Overload & stress
  "neg_overload_rec",            #152

  # == Section 8: Performance / Promotion ======================================
  "promotion_opp",               #153  F7: Promotion opportunities
  "promotion_opp_rec",           #154
  "promotion_eval",              #155  F8: Promotions consider evaluation
  "promotion_eval_rec1",         #156
  "promotion_eval_rec2",         #157
  "promotion_eval_rec3",         #158

  # == Section 9: Leadership ===================================================
  "satis_leadership",            #159  G1: Satisfied with direct boss
  "satis_leadership_rec1",       #160
  "satis_leadership_rec2",       #161

  # == Section 10: Organizational Trust (H) ====================================
  "trust_boss",                  #162  H1: Direct boss
  "trust_boss_rec1",             #163
  "trust_boss_rec2",             #164
  "trust_org",                   #165  H2: Organization overall
  "trust_org_rec1",              #166
  "trust_org_rec2",              #167
  "trust_mgmt",                  #168  H3: Management
  "trust_mgmt_rec1",             #169
  "trust_mgmt_rec2",             #170
  "trust_hr",                    #171  H4: Human Resources
  "trust_hr_rec1",               #172
  "trust_hr_rec2",               #173
  "trust_peers",                 #174  H5: Peers / coworkers
  "trust_peers_rec1",            #175
  "trust_peers_rec2",            #176

  # == Section 11: Job Satisfaction (I) ========================================
  "satis_recognition",           #177  I1: Recognition
  "satis_recognition_rec1",      #178
  "satis_recognition_rec2",      #179
  "satis_promotion",             #180  I2: Promotion possibilities
  "satis_promotion_rec1",        #181
  "satis_promotion_rec2",        #182
  "satis_salary",                #183  I3: Salary
  "satis_salary_rec1",           #184
  "satis_salary_rec2",           #185
  "satis_flexibility",           #186  I4: Work flexibility
  "satis_flexibility_rec1",      #187
  "satis_flexibility_rec2",      #188
  "satis_dei",                   #189  I5: Diversity & inclusion
  "satis_dei_rec1",              #190
  "satis_dei_rec2",              #191
  "satis_workload",              #192  I6: Workload
  "satis_workload_rec1",         #193
  "satis_workload_rec2",         #194
  "satis_general",               #195  I7: Overall job satisfaction
  "satis_general_rec1",          #196
  "satis_general_rec2",          #197

  # == Section 12: Salary (J) ==================================================
  "salary_adjustment",           #198  J1: 2025 salary adjustment
  "salary_competitive",          #199  J2: Salary vs. market
  "salary_competitive_rec",      #200
  "pay_equity",                  #201  J3: Gender pay equity
  "pay_equity_rec1",             #202
  "pay_equity_rec2",             #203
  "pay_equity_measures",         #204  J4: Measures to reduce gap
  "pay_equity_measures_rec1",    #205
  "pay_equity_measures_rec2",    #206
  "asked_raise",                 #207  J5: Asked for a raise?
  "raise_situation",             #208  J6: Raise situation
  "raise_result",                #209  J7: Raise request result
  "raise_result_rec",            #210
  "raise_reason_given",          #211  J8: Were you given a reason?

  # Reasons raise was denied (multiple selection)
  "deny_market_aligned",         #212  Aligned with market
  "deny_market_aligned_rec",     #213
  "deny_band_limit",             #214  Salary band limit
  "deny_band_limit_rec",         #215
  "deny_recent_adjust",          #216  Recent adjustment
  "deny_recent_adjust_rec",      #217
  "deny_performance",            #218  Insufficient performance
  "deny_performance_rec",        #219
  "deny_budget",                 #220  Lack of budget
  "deny_budget_rec",             #221
  "deny_other_reason",           #222  Other reasons
  "deny_other_reason_rec",       #223

  # == Turnover Intention ======================================================
  "turnover_intent",             #224  Desire to stay/change job
  "turnover_intent_rec1",        #225
  "turnover_intent_rec2",        #226

  # Turnover reasons (multiple selection)
  "turn_no_growth",              #227  Lack of opportunities
  "turn_no_growth_rec",          #228
  "turn_bad_environment",        #229  Bad environment
  "turn_bad_environment_rec",    #230
  "turn_compensation",           #231  Inadequate compensation
  "turn_compensation_rec",       #232
  "turn_work_life",              #233  Work-life imbalance
  "turn_work_life_rec",          #234
  "turn_leadership",             #235  Inadequate leadership
  "turn_leadership_rec",         #236
  "turn_discrimination",         #237  Discrimination / inclusion
  "turn_discrimination_rec",     #238
  "turn_burnout",                #239  Burnout / exhaustion
  "turn_burnout_rec",            #240
  "turn_no_purpose",             #241  Lack of purpose
  "turn_no_purpose_rec",         #242

  # == Vacation / Rest =========================================================
  "max_vacation_days",           #243  Max consecutive vacation days
  "max_vacation_days_rec1",      #244
  "max_vacation_days_rec2",      #245

  # == Emotions at Work ========================================================
  "emo_happy",                   #246  Happy
  "emo_happy_rec1",              #247
  "emo_happy_rec2",              #248
  "emo_happy_rec3",              #249
  "emo_stressed",                #250  Work-stressed
  "emo_stressed_rec1",           #251
  "emo_stressed_rec2",           #252
  "emo_stressed_rec3",           #253
  "emo_committed",               #254  Committed
  "emo_committed_rec1",          #255
  "emo_committed_rec2",          #256
  "emo_committed_rec3",          #257
  "emo_depressed",               #258  Depressed
  "emo_depressed_rec1",          #259
  "emo_depressed_rec2",          #260
  "emo_depressed_rec3",          #261
  "emo_bored",                   #262  Bored
  "emo_bored_rec1",              #263
  "emo_bored_rec2",              #264
  "emo_bored_rec3",              #265

  # == Burnout =================================================================
  "burnout_freq",                #266  Burnout frequency in 2025
  "burnout_freq_rec1",           #267
  "burnout_freq_rec2",           #268
  "burnout_freq_rec3",           #269

  # == Work-Life Balance =======================================================
  "wlb_overtime",                #270  Worked overtime
  "wlb_overtime_rec1",           #271
  "wlb_overtime_rec2",           #272
  "wlb_overtime_rec3",           #273
  "wlb_weekends",                #274  Worked weekends
  "wlb_weekends_rec1",           #275
  "wlb_weekends_rec2",           #276
  "wlb_weekends_rec3",           #277
  "wlb_vacation_work",           #278  Worked during vacation
  "wlb_vacation_work_rec1",      #279
  "wlb_vacation_work_rec2",      #280
  "wlb_vacation_work_rec3",      #281
  "wlb_available_off_hrs",       #282  Available outside work hours
  "wlb_available_off_hrs_rec1",  #283
  "wlb_available_off_hrs_rec2",  #284
  "wlb_available_off_hrs_rec3",  #285
  "wlb_think_after_work",        #286  Thought about work after hours
  "wlb_think_after_work_rec1",   #287
  "wlb_think_after_work_rec2",   #288
  "wlb_think_after_work_rec3",   #289
  "wlb_think_before_sleep",      #290  Thought about work before sleep
  "wlb_think_before_sleep_rec1", #291
  "wlb_think_before_sleep_rec2", #292
  "wlb_think_before_sleep_rec3", #293
  "wlb_interfere_personal",      #294  Work interfered with personal life
  "wlb_interfere_personal_rec1", #295
  "wlb_interfere_personal_rec2", #296
  "wlb_interfere_personal_rec3", #297

  # ============================================================================
  # INDEPENDENT WORKERS
  # ============================================================================

  # -- Ind: Job Values (C2 equivalent) -----------------------------------------
  "ind_val_salary",              #298
  "ind_val_salary_rec",          #299
  "ind_val_benefits",            #300
  "ind_val_benefits_rec",        #301
  "ind_val_proximity",           #302
  "ind_val_proximity_rec",       #303
  "ind_val_stimulating",         #304
  "ind_val_stimulating_rec",     #305
  "ind_val_flexibility",         #306
  "ind_val_flexibility_rec",     #307
  "ind_val_remote",              #308
  "ind_val_remote_rec",          #309
  "ind_val_growth",              #310
  "ind_val_growth_rec",          #311
  "ind_val_culture",             #312
  "ind_val_culture_rec",         #313
  "ind_val_environment",         #314
  "ind_val_environment_rec",     #315
  "ind_val_social_impact",       #316
  "ind_val_social_impact_rec",   #317

  # -- Ind: Training (F equivalent) --------------------------------------------
  "ind_own_development",         #318  Responsible for own development
  "ind_own_development_rec1",    #319
  "ind_own_development_rec2",    #320
  "ind_training",                #321  Completed training?
  "ind_training_rec",            #322

  # Ind F2_1: Training skills (multiple selection)
  "ind_train_leadership",        #323
  "ind_train_leadership_rec",    #324
  "ind_train_communication",     #325
  "ind_train_communication_rec", #326
  "ind_train_teamwork",          #327
  "ind_train_teamwork_rec",      #328
  "ind_train_time_tech",         #329  Time mgmt & technical skills
  "ind_train_time_tech_rec",     #330
  "ind_train_digital",           #331
  "ind_train_digital_rec",       #332
  "ind_train_ai",                #333
  "ind_train_ai_rec",            #334
  "ind_train_wellbeing",         #335
  "ind_train_wellbeing_rec",     #336
  "ind_train_dei",               #337
  "ind_train_dei_rec",           #338
  "ind_train_problem_solving",   #339
  "ind_train_problem_solving_rec", #340
  "ind_train_customer_svc",      #341
  "ind_train_customer_svc_rec",  #342
  "ind_train_language",          #343
  "ind_train_language_rec",      #344
  "ind_train_other_skill",       #345
  "ind_train_other_skill_rec",   #346

  # Ind F2_2: Training effect
  "ind_training_effect",         #347

  # Ind F3: Future training (multiple selection)
  "ind_future_technical",        #348
  "ind_future_technical_rec",    #349
  "ind_future_soft_skills",      #350
  "ind_future_soft_skills_rec",  #351
  "ind_future_leadership",       #352
  "ind_future_leadership_rec",   #353
  "ind_future_productivity",     #354
  "ind_future_productivity_rec", #355
  "ind_future_processes",        #356
  "ind_future_processes_rec",    #357
  "ind_future_products",         #358
  "ind_future_products_rec",     #359
  "ind_future_digital",          #360
  "ind_future_digital_rec",      #361
  "ind_future_other_area",       #362
  "ind_future_other_area_rec",   #363
  "ind_future_no_interest",      #364
  "ind_future_no_interest_rec",  #365

  # -- Ind: Productivity (G equivalent) ----------------------------------------
  "ind_prod_tasks",              #366
  "ind_prod_tasks_rec1",         #367
  "ind_prod_tasks_rec2",         #368
  "ind_prod_quality",            #369
  "ind_prod_quality_rec1",       #370
  "ind_prod_quality_rec2",       #371
  "ind_prod_time",               #372
  "ind_prod_time_rec1",          #373
  "ind_prod_time_rec2",          #374

  # Ind G4: Negative productivity factors (multiple selection)
  "ind_neg_interruptions",       #375
  "ind_neg_interruptions_rec",   #376
  "ind_neg_planning",            #377
  "ind_neg_planning_rec",        #378
  "ind_neg_motivation",          #379
  "ind_neg_motivation_rec",      #380
  "ind_neg_tools",               #381
  "ind_neg_tools_rec",           #382
  "ind_neg_communication",       #383
  "ind_neg_communication_rec",   #384
  "ind_neg_overload",            #385
  "ind_neg_overload_rec",        #386

  # -- Ind: Vacation / Rest ----------------------------------------------------
  "ind_max_vacation",            #387
  "ind_max_vacation_rec1",       #388
  "ind_max_vacation_rec2",       #389

  # -- Ind: Emotions -----------------------------------------------------------
  "ind_emo_happy",               #390
  "ind_emo_happy_rec1",          #391
  "ind_emo_happy_rec2",          #392
  "ind_emo_happy_rec3",          #393
  "ind_emo_stressed",            #394
  "ind_emo_stressed_rec1",       #395
  "ind_emo_stressed_rec2",       #396
  "ind_emo_stressed_rec3",       #397
  "ind_emo_committed",           #398
  "ind_emo_committed_rec1",      #399
  "ind_emo_committed_rec2",      #400
  "ind_emo_committed_rec3",      #401
  "ind_emo_depressed",           #402
  "ind_emo_depressed_rec1",      #403
  "ind_emo_depressed_rec2",      #404
  "ind_emo_depressed_rec3",      #405
  "ind_emo_bored",               #406
  "ind_emo_bored_rec1",          #407
  "ind_emo_bored_rec2",          #408
  "ind_emo_bored_rec3",          #409

  # -- Ind: Burnout ------------------------------------------------------------
  "ind_burnout_freq",            #410
  "ind_burnout_freq_rec1",       #411
  "ind_burnout_freq_rec2",       #412
  "ind_burnout_freq_rec3",       #413

  # -- Ind: Work-Life Balance --------------------------------------------------
  "ind_wlb_overtime",            #414
  "ind_wlb_overtime_rec1",       #415
  "ind_wlb_overtime_rec2",       #416
  "ind_wlb_overtime_rec3",       #417
  "ind_wlb_weekends",            #418
  "ind_wlb_weekends_rec1",       #419
  "ind_wlb_weekends_rec2",       #420
  "ind_wlb_weekends_rec3",       #421
  "ind_wlb_vacation_work",       #422
  "ind_wlb_vacation_work_rec1",  #423
  "ind_wlb_vacation_work_rec2",  #424
  "ind_wlb_vacation_work_rec3",  #425
  "ind_wlb_available_off_hrs",       #426
  "ind_wlb_available_off_hrs_rec1",  #427
  "ind_wlb_available_off_hrs_rec2",  #428
  "ind_wlb_available_off_hrs_rec3",  #429
  "ind_wlb_think_after_work",        #430
  "ind_wlb_think_after_work_rec1",   #431
  "ind_wlb_think_after_work_rec2",   #432
  "ind_wlb_think_after_work_rec3",   #433
  "ind_wlb_think_before_sleep",      #434
  "ind_wlb_think_before_sleep_rec1", #435
  "ind_wlb_think_before_sleep_rec2", #436
  "ind_wlb_think_before_sleep_rec3", #437
  "ind_wlb_interfere_personal",      #438
  "ind_wlb_interfere_personal_rec1", #439
  "ind_wlb_interfere_personal_rec2", #440
  "ind_wlb_interfere_personal_rec3", #441

  # == Demographics ============================================================
  "disability",                  #442  Have a disability?
  "disability_rec",              #443
  "ethnicity",                   #444  Ethnic self-identification
  "ethnicity_rec"                #445
)

# --- Convert character columns that should be numeric -------------------------
# readxl reads some numeric columns as character ("0.0", "1.0", etc.)
df <- df %>%
  mutate(across(
    where(is.character),
    ~ {
      num <- suppressWarnings(as.numeric(.x))
      if (all(is.na(.x) | !is.na(num))) num else .x
    }
  ))

# --- Filter: keep only Chilean workers ----------------------------------------
df <- df %>% filter(country == "Chile")

# --- Quick overview -----------------------------------------------------------
cat("Data loaded:", nrow(df), "Chilean observations,", ncol(df), "variables\n\n")

# ==============================================================================
# DERIVED VARIABLES
# ==============================================================================

# Income tier (Low / Medium / High)
df <- df %>%
  mutate(
    income_tier = case_when(
      income_cl_rec %in% c(1, 2)       ~ "Low",
      income_cl_rec %in% c(3, 4, 5)    ~ "Medium",
      income_cl_rec %in% c(6, 7, 8)    ~ "High",
      TRUE                              ~ NA_character_
    ),
    income_tier = factor(income_tier, levels = c("Low", "Medium", "High"))
  )

# Generation / age group
df <- df %>%
  mutate(
    generation = case_when(
      birth_year_rec2 %in% c("Entre 18 y 24 años")             ~ "18-24",
      birth_year_rec2 %in% c("Entre 25 y 34 años")             ~ "25-34",
      birth_year_rec2 %in% c("Entre 35 y 44 años")             ~ "35-44",
      birth_year_rec2 %in% c("Entre 45 y 54 años")             ~ "45-54",
      birth_year_rec2 %in% c("Entre 55 y 64 años", "65 años o más") ~ "55+",
      TRUE ~ NA_character_
    ),
    generation = factor(generation, levels = c("18-24", "25-34", "35-44", "45-54", "55+"))
  )

# Leader dummy
df <- df %>%
  mutate(is_leader = direct_reports_rec)

# Org size ordered factor
df <- df %>%
  mutate(
    org_size_f = factor(org_size,
                        levels = c("10 o menos", "11-49", "50-199", "200 o más"))
  )

# Role labels
role_labels <- c(
  "1" = "Owner",
  "2" = "Senior Mgmt",
  "3" = "Supervisors",
  "4" = "Professionals",
  "5" = "Technicians",
  "6" = "Admin Support",
  "7" = "Operations"
)
df <- df %>%
  mutate(role_label = factor(role_labels[as.character(role_rec)],
                             levels = role_labels))

# Work schedule factor
df <- df %>%
  mutate(
    schedule_f = case_when(
      grepl("completa", work_schedule) ~ "Full-time",
      grepl("parcial", work_schedule)  ~ "Part-time",
      grepl("turnos", work_schedule)   ~ "Shift",
      TRUE ~ NA_character_
    ),
    schedule_f = factor(schedule_f, levels = c("Full-time", "Part-time", "Shift"))
  )

# Remote work factor
df <- df %>%
  mutate(
    remote_f = case_when(
      remote_work == "No"                                    ~ "None",
      grepl("1 a 2", remote_work)                            ~ "1-2 days",
      grepl("3 a 4", remote_work)                            ~ "3-4 days",
      grepl("siempre", remote_work)                          ~ "100% remote",
      TRUE ~ NA_character_
    ),
    remote_f = factor(remote_f, levels = c("None", "1-2 days", "3-4 days", "100% remote"))
  )

# Flexibility factor
df <- df %>%
  mutate(
    flex_f = case_when(
      grepl("Ninguna", flex_hours)  ~ "None",
      grepl("Limitada", flex_hours) ~ "Limited",
      grepl("Alta", flex_hours)     ~ "High",
      TRUE ~ NA_character_
    ),
    flex_f = factor(flex_f, levels = c("None", "Limited", "High"))
  )

# Filter to binary gender for plotting (keep Otro in df, filter in plot data)
df_bin <- df %>% filter(gender %in% c("Femenino", "Masculino"))

# ==============================================================================
# PLOT THEME & HELPERS
# ==============================================================================

fig_dir <- "/Users/sofiavaldivia/Documents/GitHub/Chile_BUK_CNS/BUK_sofia/1_Code/figures"
dir.create(fig_dir, showWarnings = FALSE, recursive = TRUE)

# BUK-style color palette
pal_gender <- c("Femenino" = "#E84393", "Masculino" = "#0984E3")

# Ensure gender is a factor with consistent levels
df$gender <- factor(df$gender, levels = c("Femenino", "Masculino", "Otro"))

theme_survey <- theme_minimal(base_size = 13) +
  theme(
    plot.title    = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "grey40", size = 11),
    legend.position = "top",
    legend.title  = element_blank(),
    panel.grid.major.x = element_blank(),
    strip.text = element_text(face = "bold")
  )

save_plot <- function(p, name, w = 8, h = 5) {
  ggsave(file.path(fig_dir, paste0(name, ".png")), p,
         width = w, height = h, dpi = 300, bg = "white")
}

# Helper: compute % where var == value, grouped by gender (+ optional facet var)
pct_by_gender <- function(data, var, value, group_var = NULL) {
  if (is.null(group_var)) {
    data %>%
      filter(!is.na({{ var }}), !is.na(gender)) %>%
      group_by(gender) %>%
      summarise(pct = mean({{ var }} == value, na.rm = TRUE) * 100,
                n = n(), .groups = "drop")
  } else {
    data %>%
      filter(!is.na({{ var }}), !is.na(gender), !is.na(.data[[group_var]])) %>%
      group_by(gender, .data[[group_var]]) %>%
      summarise(pct = mean({{ var }} == value, na.rm = TRUE) * 100,
                n = n(), .groups = "drop")
  }
}

# Helper: basic grouped bar
plot_grouped_bar <- function(data, x_var, y_var, fill_var = "gender",
                             title = "", subtitle = "", xlab = "", ylab = "% Agree",
                             dodge_width = 0.8) {
  ggplot(data, aes(x = .data[[x_var]], y = .data[[y_var]],
                   fill = .data[[fill_var]])) +
    geom_col(position = position_dodge(dodge_width), width = 0.7) +
    geom_text(aes(label = paste0(round(.data[[y_var]]), "%")),
              position = position_dodge(dodge_width), vjust = -0.4, size = 3.2) +
    scale_fill_manual(values = pal_gender) +
    labs(title = title, subtitle = subtitle, x = xlab, y = ylab) +
    theme_survey +
    scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
}

# ==============================================================================
# TASK 01: WAGE GAP PERCEPTIONS (Section 1.1)
# ==============================================================================
cat("\n--- Task 01: Wage Gap Perceptions ---\n")

# --- 1.1a: Perceived gender wage equality by gender --------------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_rec2)) %>%
  group_by(gender) %>%
  summarise(pct_agree = mean(pay_equity_rec2 == 3) * 100,
            pct_disagree = mean(pay_equity_rec2 == 1) * 100,
            n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct_agree, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct_agree), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Perceived Gender Pay Equality",
       subtitle = "% agreeing: 'men and women receive same salary for equal positions'",
       x = "", y = "% Agree") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_1a_pay_equity_by_gender")

# --- 1.1a interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_rec2), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(pay_equity_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Perceived Pay Equality by Gender x Income",
                      subtitle = "% agreeing 'equal pay for equal positions'",
                      xlab = "Income Tier", ylab = "% Agree")
save_plot(p, "1_1a_pay_equity_gender_x_income")

# --- 1.1a interaction: by role -----------------------------------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_rec2), !is.na(role_label)) %>%
  group_by(gender, role_label) %>%
  summarise(pct = mean(pay_equity_rec2 == 3) * 100, n = n(), .groups = "drop") %>%
  filter(!is.na(role_label))

p <- ggplot(d, aes(x = role_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 3) +
  scale_fill_manual(values = pal_gender) +
  coord_flip() +
  labs(title = "Perceived Pay Equality by Gender x Role",
       x = "", y = "% Agree") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)))
save_plot(p, "1_1a_pay_equity_gender_x_role", w = 9, h = 5.5)

# --- 1.1a interaction: by leadership ----------------------------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_rec2), !is.na(is_leader)) %>%
  group_by(gender, is_leader) %>%
  summarise(pct = mean(pay_equity_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "is_leader", "pct",
                      title = "Perceived Pay Equality by Gender x Leadership",
                      xlab = "", ylab = "% Agree")
save_plot(p, "1_1a_pay_equity_gender_x_leader")

# --- 1.1a interaction: by org size ------------------------------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_rec2), !is.na(org_size_f)) %>%
  group_by(gender, org_size_f) %>%
  summarise(pct = mean(pay_equity_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "org_size_f", "pct",
                      title = "Perceived Pay Equality by Gender x Org Size",
                      xlab = "Organization Size", ylab = "% Agree")
save_plot(p, "1_1a_pay_equity_gender_x_orgsize")

# --- 1.1a interaction: by generation ----------------------------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(pay_equity_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "generation", "pct",
                      title = "Perceived Pay Equality by Gender x Age",
                      xlab = "Age Group", ylab = "% Agree")
save_plot(p, "1_1a_pay_equity_gender_x_age")

# --- 1.1b: Wage equality perception by income tier (same as interaction) -----
# Already produced as 1_1a_pay_equity_gender_x_income

# --- 1.1c: Wage equality perception by role (same as interaction) ------------
# Already produced as 1_1a_pay_equity_gender_x_role

# --- 1.1d: Perception of organizational action on wage gap -------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_measures_rec2)) %>%
  group_by(gender) %>%
  summarise(pct = mean(pay_equity_measures_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Perceived Organizational Action on Wage Gap",
       subtitle = "% agreeing: 'my org implements effective measures to reduce gender pay gap'",
       x = "", y = "% Agree") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_1d_pay_measures_by_gender")

# --- 1.1d interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_measures_rec2), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(pay_equity_measures_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Org Action on Wage Gap by Gender x Income",
                      xlab = "Income Tier", ylab = "% Agree")
save_plot(p, "1_1d_pay_measures_gender_x_income")

# --- 1.1d interaction: by org size ------------------------------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_measures_rec2), !is.na(org_size_f)) %>%
  group_by(gender, org_size_f) %>%
  summarise(pct = mean(pay_equity_measures_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "org_size_f", "pct",
                      title = "Org Action on Wage Gap by Gender x Org Size",
                      xlab = "Organization Size", ylab = "% Agree")
save_plot(p, "1_1d_pay_measures_gender_x_orgsize")

# --- 1.1d interaction: by leadership ----------------------------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_measures_rec2), !is.na(is_leader)) %>%
  group_by(gender, is_leader) %>%
  summarise(pct = mean(pay_equity_measures_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "is_leader", "pct",
                      title = "Org Action on Wage Gap by Gender x Leadership",
                      xlab = "", ylab = "% Agree")
save_plot(p, "1_1d_pay_measures_gender_x_leader")

# --- 1.1e: Wage perception by salary adjustment presence ---------------------
d <- df_bin %>%
  filter(!is.na(pay_equity_rec2), !is.na(salary_adjustment)) %>%
  mutate(adj_label = ifelse(salary_adjustment == 1, "Salary Adjusted", "Not Adjusted")) %>%
  group_by(gender, adj_label) %>%
  summarise(pct = mean(pay_equity_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "adj_label", "pct",
                      title = "Pay Equality Perception by Salary Adjustment Policy",
                      subtitle = "Does formal salary adjustment improve equity perceptions?",
                      xlab = "", ylab = "% Agree Equal Pay")
save_plot(p, "1_1e_pay_equity_by_adjustment")

# --- 1.1f: Compensation evaluation vs sector peers --------------------------
d <- df_bin %>%
  filter(!is.na(salary_competitive_rec)) %>%
  mutate(comp_label = case_when(
    salary_competitive_rec %in% c(1, 2) ~ "Below avg",
    salary_competitive_rec == 3         ~ "Average",
    salary_competitive_rec %in% c(4, 5) ~ "Above avg"
  )) %>%
  filter(!is.na(comp_label)) %>%
  mutate(comp_label = factor(comp_label, levels = c("Below avg", "Average", "Above avg"))) %>%
  group_by(gender, comp_label) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(pct = n / sum(n) * 100) %>%
  ungroup()

p <- ggplot(d, aes(x = comp_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), vjust = -0.4, size = 3.2) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Compensation vs Sector Peers",
       subtitle = "Self-assessed salary relative to same sector & size",
       x = "", y = "%") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_1f_salary_vs_peers")

cat("  Task 01 complete: saved to figures/\n")

# ==============================================================================
# TASK 02: SALARY NEGOTIATIONS & RAISE REQUESTS (Section 1.2)
# ==============================================================================
cat("\n--- Task 02: Salary Negotiations ---\n")

# --- 1.2a: Share who requested a raise (last 2 years) -----------------------
d <- df_bin %>%
  filter(!is.na(asked_raise)) %>%
  group_by(gender) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Requested a Raise in Last 2 Years",
       subtitle = "% who asked for a salary increase",
       x = "", y = "%") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_2a_asked_raise_by_gender")

# --- 1.2a interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(asked_raise), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Raise Request Rate by Gender x Income",
                      xlab = "Income Tier", ylab = "% Asked")
save_plot(p, "1_2a_asked_raise_gender_x_income")

# --- 1.2a interaction: by leadership ----------------------------------------
d <- df_bin %>%
  filter(!is.na(asked_raise), !is.na(is_leader)) %>%
  group_by(gender, is_leader) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "is_leader", "pct",
                      title = "Raise Request Rate by Gender x Leadership",
                      xlab = "", ylab = "% Asked")
save_plot(p, "1_2a_asked_raise_gender_x_leader")

# --- 1.2a interaction: by age -----------------------------------------------
d <- df_bin %>%
  filter(!is.na(asked_raise), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Raise Request Rate by Gender x Age",
       subtitle = "Lifecycle profile: do women reduce negotiation during childbearing years?",
       x = "Age Group", y = "% Asked for Raise") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "1_2a_asked_raise_gender_x_age")

# --- 1.2a interaction: by org size ------------------------------------------
d <- df_bin %>%
  filter(!is.na(asked_raise), !is.na(org_size_f)) %>%
  group_by(gender, org_size_f) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "org_size_f", "pct",
                      title = "Raise Request Rate by Gender x Org Size",
                      xlab = "Organization Size", ylab = "% Asked")
save_plot(p, "1_2a_asked_raise_gender_x_orgsize")

# --- 1.2a interaction: by work schedule -------------------------------------
d <- df_bin %>%
  filter(!is.na(asked_raise), !is.na(schedule_f)) %>%
  group_by(gender, schedule_f) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "schedule_f", "pct",
                      title = "Raise Request Rate by Gender x Work Schedule",
                      xlab = "", ylab = "% Asked")
save_plot(p, "1_2a_asked_raise_gender_x_schedule")

# --- 1.2b: Negotiation before accepting job offer ---------------------------
d <- df_bin %>%
  filter(!is.na(raise_situation)) %>%
  mutate(negotiated = grepl("ofreció", raise_situation)) %>%
  group_by(gender) %>%
  summarise(
    pct_offered = mean(negotiated) * 100,
    pct_not_asked = 100 - mean(negotiated) * 100,
    n = n(), .groups = "drop"
  )

d_long <- d %>%
  pivot_longer(cols = c(pct_offered, pct_not_asked),
               names_to = "situation", values_to = "pct") %>%
  mutate(situation = ifelse(situation == "pct_offered",
                            "Org offered without asking",
                            "Did not ask"))

p <- ggplot(d_long, aes(x = gender, y = pct, fill = situation)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_stack(vjust = 0.5), size = 3.5) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Raise Situation: Offered vs Not Asked",
       subtitle = "Among those who provided situation info",
       x = "", y = "%") +
  theme_survey
save_plot(p, "1_2b_raise_situation_by_gender")

# --- 1.2c: Success rate among those who asked --------------------------------
d <- df_bin %>%
  filter(!is.na(raise_result_rec)) %>%
  group_by(gender) %>%
  summarise(pct_success = mean(raise_result_rec == 1) * 100,
            n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct_success, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct_success), "% (n=", n, ")")),
            vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Raise Request Success Rate",
       subtitle = "% successful, among those who asked",
       x = "", y = "% Successful") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_2c_raise_success_by_gender")

# --- 1.2c interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(raise_result_rec), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(raise_result_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Raise Success Rate by Gender x Income",
                      subtitle = "Among those who asked",
                      xlab = "Income Tier", ylab = "% Successful")
save_plot(p, "1_2c_raise_success_gender_x_income")

# --- 1.2c interaction: by leadership ----------------------------------------
d <- df_bin %>%
  filter(!is.na(raise_result_rec), !is.na(is_leader)) %>%
  group_by(gender, is_leader) %>%
  summarise(pct = mean(raise_result_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "is_leader", "pct",
                      title = "Raise Success Rate by Gender x Leadership",
                      subtitle = "Among those who asked",
                      xlab = "", ylab = "% Successful")
save_plot(p, "1_2c_raise_success_gender_x_leader")

# --- 1.2c interaction: by age -----------------------------------------------
d <- df_bin %>%
  filter(!is.na(raise_result_rec), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(raise_result_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Raise Success Rate by Gender x Age",
       subtitle = "Among those who asked — lifecycle profile",
       x = "Age Group", y = "% Successful") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "1_2c_raise_success_gender_x_age")

# --- 1.2d: Reasons for raise denial -----------------------------------------
deny_vars <- c("deny_market_aligned_rec", "deny_band_limit_rec",
               "deny_recent_adjust_rec", "deny_performance_rec",
               "deny_budget_rec", "deny_other_reason_rec")
deny_labels <- c("Market aligned", "Salary band limit", "Recent adjustment",
                 "Insufficient performance", "Lack of budget", "Other reasons")

d <- df_bin %>%
  filter(raise_result_rec == 0) %>%
  select(gender, all_of(deny_vars)) %>%
  pivot_longer(-gender, names_to = "reason", values_to = "selected") %>%
  filter(!is.na(selected)) %>%
  group_by(gender, reason) %>%
  summarise(pct = mean(selected == 1) * 100, n = n(), .groups = "drop") %>%
  mutate(reason_label = deny_labels[match(reason, deny_vars)],
         reason_label = factor(reason_label, levels = rev(deny_labels)))

p <- ggplot(d, aes(x = reason_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 3) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Reasons for Raise Denial by Gender",
       subtitle = "Among those whose raise was denied",
       x = "", y = "% Citing Reason") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.25)))
save_plot(p, "1_2d_denial_reasons_by_gender", w = 9, h = 5)

# --- 1.2e: Full raise request funnel ----------------------------------------
funnel <- df_bin %>%
  filter(!is.na(asked_raise)) %>%
  group_by(gender) %>%
  summarise(
    total = n(),
    asked = sum(asked_raise == 1, na.rm = TRUE),
    succeeded = sum(raise_result_rec == 1, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  mutate(
    pct_asked = asked / total * 100,
    pct_success_of_total = succeeded / total * 100,
    pct_success_of_asked = succeeded / asked * 100
  )

d_funnel <- funnel %>%
  select(gender, pct_asked, pct_success_of_total) %>%
  pivot_longer(-gender, names_to = "stage", values_to = "pct") %>%
  mutate(stage = factor(ifelse(stage == "pct_asked", "Asked for raise",
                               "Raise granted"),
                        levels = c("Asked for raise", "Raise granted")))

p <- ggplot(d_funnel, aes(x = stage, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct, 1), "%")),
            position = position_dodge(0.8), vjust = -0.4, size = 3.5) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Raise Request Funnel by Gender",
       subtitle = "% of all workers → asked → succeeded",
       x = "", y = "% of Total Workers") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_2e_raise_funnel")

cat("  Task 02 complete: saved to figures/\n")

# ==============================================================================
# TASK 03: PROMOTIONS & MERITOCRACY (Section 1.3)
# ==============================================================================
cat("\n--- Task 03: Promotions & Meritocracy ---\n")

# --- 1.3a: Promotion opportunities description ------------------------------
d <- df_bin %>%
  filter(!is.na(promotion_opp)) %>%
  mutate(promo_cat = case_when(
    grepl("política clara y percibo", promotion_opp) ~ "Clear policy &\nreal opportunities",
    grepl("no hay una política clara", promotion_opp) ~ "Promotions exist,\nno clear policy",
    grepl("No existen", promotion_opp)                ~ "No promotions\nexist",
    grepl("No lo sé", promotion_opp)                  ~ "Don't know"
  )) %>%
  filter(!is.na(promo_cat)) %>%
  group_by(gender, promo_cat) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(pct = n / sum(n) * 100)

p <- ggplot(d, aes(x = promo_cat, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), vjust = -0.4, size = 3) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Promotion Opportunities in Organization",
       x = "", y = "%") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_3a_promotion_opp_by_gender", w = 9)

# --- 1.3b: Performance-based promotions frequency ---------------------------
# promotion_eval_rec2 appears to be collapsed; let's use rec1 (1-5 scale)
# % saying siempre/muchas veces = values 4 or 5 (if Likert) or check rec2
d <- df_bin %>%
  filter(!is.na(promotion_eval_rec2)) %>%
  group_by(gender) %>%
  summarise(pct_frequent = mean(promotion_eval_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct_frequent, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct_frequent), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Performance-Based Promotions",
       subtitle = "% saying promotions frequently consider performance evaluations",
       x = "", y = "% Frequently/Always") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_3b_meritocracy_by_gender")

# --- 1.3b interaction: by leadership ----------------------------------------
d <- df_bin %>%
  filter(!is.na(promotion_eval_rec2), !is.na(is_leader)) %>%
  group_by(gender, is_leader) %>%
  summarise(pct = mean(promotion_eval_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "is_leader", "pct",
                      title = "Meritocracy Belief by Gender x Leadership",
                      subtitle = "BUK report: gap widens for leaders",
                      xlab = "", ylab = "% Frequently/Always")
save_plot(p, "1_3b_meritocracy_gender_x_leader")

# --- 1.3b interaction: by income --------------------------------------------
d <- df_bin %>%
  filter(!is.na(promotion_eval_rec2), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(promotion_eval_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Meritocracy Belief by Gender x Income",
                      xlab = "Income Tier", ylab = "% Frequently/Always")
save_plot(p, "1_3b_meritocracy_gender_x_income")

# --- 1.3c: Satisfaction with promotion possibilities -------------------------
d <- df_bin %>%
  filter(!is.na(satis_promotion_rec2)) %>%
  group_by(gender) %>%
  summarise(pct = mean(satis_promotion_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Satisfaction with Promotion Possibilities",
       subtitle = "% satisfied or very satisfied",
       x = "", y = "% Satisfied") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_3c_satis_promotion_by_gender")

# --- 1.3c interaction: by age -----------------------------------------------
d <- df_bin %>%
  filter(!is.na(satis_promotion_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(satis_promotion_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Promotion Satisfaction by Gender x Age",
       subtitle = "Do younger women start optimistic and become pessimistic?",
       x = "Age Group", y = "% Satisfied") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "1_3c_satis_promotion_gender_x_age")

# --- 1.3c interaction: by leadership ----------------------------------------
d <- df_bin %>%
  filter(!is.na(satis_promotion_rec2), !is.na(is_leader)) %>%
  group_by(gender, is_leader) %>%
  summarise(pct = mean(satis_promotion_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "is_leader", "pct",
                      title = "Promotion Satisfaction by Gender x Leadership",
                      xlab = "", ylab = "% Satisfied")
save_plot(p, "1_3c_satis_promotion_gender_x_leader")

# --- 1.3d: Satisfaction with recognition ------------------------------------
d <- df_bin %>%
  filter(!is.na(satis_recognition_rec2)) %>%
  group_by(gender) %>%
  summarise(pct = mean(satis_recognition_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Satisfaction with Recognition",
       subtitle = "% satisfied with recognition received for good work",
       x = "", y = "% Satisfied") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_3d_satis_recognition_by_gender")

# --- 1.3d interaction: by role -----------------------------------------------
d <- df_bin %>%
  filter(!is.na(satis_recognition_rec2), !is.na(role_label)) %>%
  group_by(gender, role_label) %>%
  summarise(pct = mean(satis_recognition_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = role_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 3) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Recognition Satisfaction by Gender x Role",
       x = "", y = "% Satisfied") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)))
save_plot(p, "1_3d_satis_recognition_gender_x_role", w = 9, h = 5.5)

cat("  Task 03 complete: saved to figures/\n")

# ==============================================================================
# TASK 04: TRAINING & CAPACITY BUILDING (Section 1.4)
# ==============================================================================
cat("\n--- Task 04: Training ---\n")

# --- 1.4a: Training access (organization-financed) --------------------------
d <- df_bin %>%
  filter(!is.na(org_training_rec)) %>%
  group_by(gender) %>%
  summarise(pct = mean(org_training_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Access to Org-Financed Training",
       subtitle = "% who completed/are completing training funded by organization",
       x = "", y = "% Trained") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_4a_training_access_by_gender")

# --- 1.4a interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(org_training_rec), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(org_training_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Training Access by Gender x Income",
                      subtitle = "BUK report: gap concentrates at middle income",
                      xlab = "Income Tier", ylab = "% Trained")
save_plot(p, "1_4a_training_gender_x_income")

# --- 1.4a interaction: by leadership ----------------------------------------
d <- df_bin %>%
  filter(!is.na(org_training_rec), !is.na(is_leader)) %>%
  group_by(gender, is_leader) %>%
  summarise(pct = mean(org_training_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "is_leader", "pct",
                      title = "Training Access by Gender x Leadership",
                      xlab = "", ylab = "% Trained")
save_plot(p, "1_4a_training_gender_x_leader")

# --- 1.4a interaction: by work schedule -------------------------------------
d <- df_bin %>%
  filter(!is.na(org_training_rec), !is.na(schedule_f)) %>%
  group_by(gender, schedule_f) %>%
  summarise(pct = mean(org_training_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "schedule_f", "pct",
                      title = "Training Access by Gender x Work Schedule",
                      xlab = "", ylab = "% Trained")
save_plot(p, "1_4a_training_gender_x_schedule")

# --- 1.4b: Training topics by gender ----------------------------------------
train_vars <- c("train_leadership_rec", "train_communication_rec",
                "train_teamwork_rec", "train_time_mgmt_rec",
                "train_technical_rec", "train_digital_rec",
                "train_ai_rec", "train_wellbeing_rec",
                "train_dei_rec", "train_problem_solving_rec",
                "train_customer_svc_rec", "train_language_rec")
train_labels <- c("Leadership", "Communication", "Teamwork", "Time Mgmt",
                  "Technical", "Digital", "AI", "Wellbeing",
                  "DEI", "Problem Solving", "Customer Service", "Language")

d <- df_bin %>%
  filter(org_training_rec == 1) %>%
  select(gender, all_of(train_vars)) %>%
  pivot_longer(-gender, names_to = "skill", values_to = "selected") %>%
  filter(!is.na(selected)) %>%
  group_by(gender, skill) %>%
  summarise(pct = mean(selected == 1) * 100, .groups = "drop") %>%
  mutate(skill_label = train_labels[match(skill, train_vars)],
         skill_label = factor(skill_label, levels = rev(train_labels)))

p <- ggplot(d, aes(x = skill_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 2.8) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Training Topics by Gender",
       subtitle = "Among those who received org-funded training",
       x = "", y = "% Trained in Topic") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)))
save_plot(p, "1_4b_training_topics_by_gender", w = 9, h = 6)

# --- 1.4c: Perceived training effectiveness ---------------------------------
effect_vars <- c("effect_skills_updated_rec", "effect_productivity_rec",
                 "effect_growth_rec", "effect_motivation_rec",
                 "effect_confidence_rec", "effect_quality_rec",
                 "effect_none_rec")
effect_labels <- c("Updated skills", "Improved productivity",
                   "Growth opportunities", "Increased motivation",
                   "Strengthened confidence", "Improved quality",
                   "No positive effect")

d <- df_bin %>%
  filter(org_training_rec == 1) %>%
  select(gender, all_of(effect_vars)) %>%
  pivot_longer(-gender, names_to = "effect", values_to = "selected") %>%
  filter(!is.na(selected)) %>%
  group_by(gender, effect) %>%
  summarise(pct = mean(selected == 1) * 100, .groups = "drop") %>%
  mutate(effect_label = effect_labels[match(effect, effect_vars)],
         effect_label = factor(effect_label, levels = rev(effect_labels)))

p <- ggplot(d, aes(x = effect_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 2.8) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Perceived Training Effectiveness by Gender",
       subtitle = "Among those who received org-funded training",
       x = "", y = "% Reporting Effect") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)))
save_plot(p, "1_4c_training_effectiveness_by_gender", w = 9, h = 5.5)

# --- 1.4c interaction: by leadership ----------------------------------------
# Productivity impact: gender x leadership
d_prod <- df_bin %>%
  filter(org_training_rec == 1, !is.na(is_leader),
         !is.na(effect_productivity_rec)) %>%
  group_by(gender, is_leader) %>%
  summarise(pct = mean(effect_productivity_rec == 1) * 100,
            .groups = "drop")

d_qual <- df_bin %>%
  filter(org_training_rec == 1, !is.na(is_leader),
         !is.na(effect_quality_rec)) %>%
  group_by(gender, is_leader) %>%
  summarise(pct = mean(effect_quality_rec == 1) * 100,
            .groups = "drop")

# Just plot productivity by leadership x gender (no facet)
p <- ggplot(d_prod, aes(x = is_leader, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), vjust = -0.4, size = 3) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Training Impact on Productivity by Gender x Leadership",
       subtitle = "BUK report: gap larger for non-leaders",
       x = "", y = "% Reporting Improved Productivity") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_4c_training_effect_gender_x_leader", w = 8, h = 5)

# --- 1.4d: Desired future training areas ------------------------------------
future_vars <- c("future_technical_rec", "future_soft_skills_rec",
                 "future_leadership_rec", "future_productivity_rec",
                 "future_processes_rec", "future_products_rec",
                 "future_digital_rec", "future_no_interest_rec")
future_labels <- c("Technical", "Soft Skills", "Leadership",
                   "Productivity", "Internal Processes", "Products/Services",
                   "Digital/AI", "No Interest")

d <- df_bin %>%
  filter(!is.na(gender)) %>%
  select(gender, all_of(future_vars)) %>%
  pivot_longer(-gender, names_to = "area", values_to = "selected") %>%
  filter(!is.na(selected)) %>%
  group_by(gender, area) %>%
  summarise(pct = mean(selected == 1) * 100, .groups = "drop") %>%
  mutate(area_label = future_labels[match(area, future_vars)],
         area_label = factor(area_label, levels = rev(future_labels)))

p <- ggplot(d, aes(x = area_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 2.8) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Desired Future Training Areas by Gender",
       x = "", y = "% Interested") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)))
save_plot(p, "1_4d_future_training_by_gender", w = 9, h = 5.5)

# --- 1.4e: Training gap (received vs desired) -------------------------------
# Compare key topics: % trained in each vs % wanting training, by gender
# Use direct computation to avoid faceting issues
topics <- c("Technical", "Leadership", "Digital/AI")
d_gap <- data.frame()

for (g in c("Femenino", "Masculino")) {
  trained <- df_bin %>% filter(gender == g, org_training_rec == 1)
  all_emp <- df_bin %>% filter(gender == g, !is.na(org_training_rec))

  recv <- c(
    mean(trained$train_technical_rec == 1, na.rm = TRUE) * 100,
    mean(trained$train_leadership_rec == 1, na.rm = TRUE) * 100,
    mean(trained$train_digital_rec == 1, na.rm = TRUE) * 100
  )
  want <- c(
    mean(all_emp$future_technical_rec == 1, na.rm = TRUE) * 100,
    mean(all_emp$future_leadership_rec == 1, na.rm = TRUE) * 100,
    mean(all_emp$future_digital_rec == 1, na.rm = TRUE) * 100
  )
  d_gap <- rbind(d_gap,
    data.frame(gender = g, topic = topics, pct = recv, type = "Received"),
    data.frame(gender = g, topic = topics, pct = want, type = "Desired")
  )
}

d_gap$type <- factor(d_gap$type, levels = c("Received", "Desired"))
d_gap$group_label <- paste0(d_gap$gender, "\n", d_gap$topic)

p <- ggplot(d_gap, aes(x = topic, y = pct, fill = type, alpha = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), vjust = -0.4, size = 3,
            show.legend = FALSE) +
  scale_fill_brewer(palette = "Set2") +
  scale_alpha_manual(values = c("Femenino" = 1, "Masculino" = 0.5)) +
  labs(title = "Training Gap: Received vs Desired by Gender",
       subtitle = "Solid = Women, Faded = Men",
       x = "", y = "%") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_4e_training_gap_received_vs_desired", w = 10, h = 5)

cat("  Task 04 complete: saved to figures/\n")

# ==============================================================================
# TASK 05: PRODUCTIVITY BARRIERS (Section 1.5)
# ==============================================================================
cat("\n--- Task 05: Productivity Barriers ---\n")

# --- 1.5a: Factors negatively affecting productivity by gender ---------------
neg_vars <- c("neg_interruptions_rec", "neg_planning_rec", "neg_motivation_rec",
              "neg_incentives_rec", "neg_tools_rec", "neg_communication_rec",
              "neg_overload_rec")
neg_labels <- c("Interruptions\n& meetings", "Lack of\nplanning",
                "Low\nmotivation", "Insufficient\nincentives",
                "Lack of\ntools", "Communication\nproblems",
                "Overload\n& stress")

d <- df_bin %>%
  select(gender, all_of(neg_vars)) %>%
  pivot_longer(-gender, names_to = "factor", values_to = "selected") %>%
  filter(!is.na(selected)) %>%
  group_by(gender, factor) %>%
  summarise(pct = mean(selected == 1) * 100, .groups = "drop") %>%
  mutate(factor_label = neg_labels[match(factor, neg_vars)],
         factor_label = factor(factor_label, levels = rev(neg_labels)))

p <- ggplot(d, aes(x = factor_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 3) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Factors Negatively Affecting Productivity by Gender",
       x = "", y = "% Citing Factor") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)))
save_plot(p, "1_5a_productivity_barriers_by_gender", w = 9, h = 5.5)

# --- 1.5a interaction: by work schedule -------------------------------------
d <- df_bin %>%
  filter(!is.na(schedule_f)) %>%
  select(gender, schedule_f, all_of(neg_vars)) %>%
  pivot_longer(cols = all_of(neg_vars), names_to = "factor", values_to = "selected") %>%
  filter(!is.na(selected)) %>%
  mutate(factor_short = case_when(
    grepl("interruptions", factor) ~ "Interruptions",
    grepl("planning", factor) ~ "Planning",
    grepl("motivation", factor) ~ "Motivation",
    grepl("incentives", factor) ~ "Incentives",
    grepl("tools", factor) ~ "Tools",
    grepl("communication", factor) ~ "Communication",
    grepl("overload", factor) ~ "Overload"
  )) %>%
  group_by(gender, schedule_f, factor_short) %>%
  summarise(pct = mean(selected == 1) * 100, .groups = "drop")

# Focus on overload & stress (key gendered barrier)
d_overload <- d %>% filter(factor_short == "Overload")
p <- plot_grouped_bar(d_overload, "schedule_f", "pct",
                      title = "Overload & Stress as Productivity Barrier",
                      subtitle = "By Gender x Work Schedule — are part-time women still stressed?",
                      xlab = "", ylab = "% Citing Overload/Stress")
save_plot(p, "1_5a_overload_gender_x_schedule")

# --- 1.5a interaction: by remote work ---------------------------------------
d <- df_bin %>%
  filter(!is.na(remote_f)) %>%
  select(gender, remote_f, neg_interruptions_rec, neg_overload_rec) %>%
  pivot_longer(cols = c(neg_interruptions_rec, neg_overload_rec),
               names_to = "factor", values_to = "selected") %>%
  filter(!is.na(selected)) %>%
  mutate(factor_label = ifelse(grepl("interruptions", factor),
                               "Interruptions", "Overload & Stress")) %>%
  group_by(gender, remote_f, factor_label) %>%
  summarise(pct = mean(selected == 1) * 100, .groups = "drop")

p <- ggplot(d, aes(x = remote_f, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), vjust = -0.4, size = 2.8) +
  facet_wrap(vars(factor_label)) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Productivity Barriers by Gender x Remote Work",
       subtitle = "Does remote work reduce interruptions but increase stress?",
       x = "", y = "% Citing Factor") +
  theme_survey +
  theme(axis.text.x = element_text(angle = 20, hjust = 1)) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "1_5a_barriers_gender_x_remote", w = 10, h = 5)

# --- 1.5a interaction: by age -----------------------------------------------
d <- df_bin %>%
  filter(!is.na(generation)) %>%
  select(gender, generation, neg_overload_rec) %>%
  filter(!is.na(neg_overload_rec)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(neg_overload_rec == 1) * 100, .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Overload/Stress as Barrier by Gender x Age",
       subtitle = "Are women in their 30s-40s more affected?",
       x = "Age Group", y = "% Citing Overload/Stress") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "1_5a_overload_gender_x_age")

cat("  Task 05 complete: saved to figures/\n")

# ==============================================================================
# TASK 06: CHILDCARE MANDATES & COST OF FEMALE LABOR (Section 2.1)
# ==============================================================================
cat("\n--- Task 06: Childcare Mandates ---\n")

# --- 2.1a: Benefits adequacy by gender x org size ---------------------------
d <- df_bin %>%
  filter(!is.na(benefits_fit_rec2), !is.na(org_size_f)) %>%
  group_by(gender, org_size_f) %>%
  summarise(pct = mean(benefits_fit_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "org_size_f", "pct",
                      title = "Benefits Adequacy by Gender x Org Size",
                      subtitle = "% agreeing benefits fit their needs — Sala Cuna threshold at ~20 workers",
                      xlab = "Organization Size", ylab = "% Agree")
save_plot(p, "2_1a_benefits_fit_gender_x_orgsize")

# --- 2.1a interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(benefits_fit_rec2), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(benefits_fit_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Benefits Adequacy by Gender x Income",
                      xlab = "Income Tier", ylab = "% Agree")
save_plot(p, "2_1a_benefits_fit_gender_x_income")

# --- 2.1a interaction: by age ------------------------------------------------
d <- df_bin %>%
  filter(!is.na(benefits_fit_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(benefits_fit_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Benefits Adequacy by Gender x Age",
       x = "Age Group", y = "% Agree") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_1a_benefits_fit_gender_x_age")

# --- 2.1b: Childcare/benefits importance as job attribute --------------------
d <- df_bin %>%
  filter(!is.na(val_benefits_rec)) %>%
  group_by(gender) %>%
  summarise(pct = mean(val_benefits_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Benefits Importance as Job Attribute",
       subtitle = "% ranking 'benefits (health insurance, childcare, meals)' as important",
       x = "", y = "% Important") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "2_1b_benefits_importance_by_gender")

# --- 2.1b interaction: by age (women 25-40 value childcare more?) -----------
d <- df_bin %>%
  filter(!is.na(val_benefits_rec), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(val_benefits_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Benefits Importance by Gender x Age",
       subtitle = "Do women 25-40 value childcare benefits more?",
       x = "Age Group", y = "% Important") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_1b_benefits_importance_gender_x_age")

# --- 2.1b interaction: by org size -------------------------------------------
d <- df_bin %>%
  filter(!is.na(val_benefits_rec), !is.na(org_size_f)) %>%
  group_by(gender, org_size_f) %>%
  summarise(pct = mean(val_benefits_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "org_size_f", "pct",
                      title = "Benefits Importance by Gender x Org Size",
                      xlab = "Organization Size", ylab = "% Important")
save_plot(p, "2_1b_benefits_importance_gender_x_orgsize")

# --- 2.1c: Organization offers benefits by org size and gender ---------------
d <- df_bin %>%
  filter(!is.na(org_benefits_rec), !is.na(org_size_f)) %>%
  group_by(gender, org_size_f) %>%
  summarise(pct = mean(org_benefits_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "org_size_f", "pct",
                      title = "Organization Offers Benefits by Gender x Org Size",
                      subtitle = "Do small firms (<20) offer fewer benefits?",
                      xlab = "Organization Size", ylab = "% Yes")
save_plot(p, "2_1c_org_benefits_gender_x_orgsize")

# --- 2.1d: Salary satisfaction by org size and gender ------------------------
d <- df_bin %>%
  filter(!is.na(satis_salary_rec2), !is.na(org_size_f)) %>%
  group_by(gender, org_size_f) %>%
  summarise(pct = mean(satis_salary_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "org_size_f", "pct",
                      title = "Salary Satisfaction by Gender x Org Size",
                      subtitle = "Consistent with wage pass-through of childcare mandates?",
                      xlab = "Organization Size", ylab = "% Satisfied")
save_plot(p, "2_1d_satis_salary_gender_x_orgsize")

# --- 2.1d interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(satis_salary_rec2), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(satis_salary_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Salary Satisfaction by Gender x Income",
                      xlab = "Income Tier", ylab = "% Satisfied")
save_plot(p, "2_1d_satis_salary_gender_x_income")

cat("  Task 06 complete: saved to figures/\n")

# ==============================================================================
# TASK 07: FLEXIBILITY MANDATES & WORKER SORTING (Section 2.2)
# ==============================================================================
cat("\n--- Task 07: Flexibility Mandates ---\n")

# --- 2.2a: Remote work access by gender (stacked bar) -----------------------
d <- df_bin %>%
  filter(!is.na(remote_f)) %>%
  group_by(gender, remote_f) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(pct = n / sum(n) * 100)

p <- ggplot(d, aes(x = gender, y = pct, fill = remote_f)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_stack(vjust = 0.5), size = 3.5) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Remote Work Access by Gender",
       subtitle = "Distribution of remote work arrangements",
       x = "", y = "%", fill = "Remote Work") +
  theme_survey
save_plot(p, "2_2a_remote_access_by_gender")

# --- 2.2a interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(remote_f), !is.na(income_tier)) %>%
  group_by(gender, income_tier, remote_f) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender, income_tier) %>%
  mutate(pct = n / sum(n) * 100)

p <- ggplot(d, aes(x = income_tier, y = pct, fill = remote_f)) +
  geom_col(width = 0.7) +
  facet_wrap(~gender) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Remote Work Access by Gender x Income",
       x = "Income Tier", y = "%", fill = "Remote Work") +
  theme_survey
save_plot(p, "2_2a_remote_access_gender_x_income", w = 10)

# --- 2.2a interaction: by age (% with any remote access) --------------------
d <- df_bin %>%
  filter(!is.na(remote_f), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(remote_f != "None") * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Any Remote Work Access by Gender x Age",
       x = "Age Group", y = "% With Any Remote Access") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_2a_remote_access_gender_x_age")

# --- 2.2b: Hourly flexibility by gender -------------------------------------
d <- df_bin %>%
  filter(!is.na(flex_f)) %>%
  group_by(gender, flex_f) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(pct = n / sum(n) * 100)

p <- ggplot(d, aes(x = flex_f, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), vjust = -0.4, size = 3.2) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Hourly Flexibility by Gender",
       subtitle = "Distribution of schedule flexibility levels",
       x = "Flexibility Level", y = "%") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "2_2b_flex_hours_by_gender")

# --- 2.2c: Flexibility satisfaction by gender --------------------------------
d <- df_bin %>%
  filter(!is.na(satis_flexibility_rec2)) %>%
  group_by(gender) %>%
  summarise(pct = mean(satis_flexibility_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Flexibility Satisfaction by Gender",
       subtitle = "% satisfied with flexibility (telework & schedule)",
       x = "", y = "% Satisfied") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "2_2c_satis_flexibility_by_gender")

# --- 2.2c interaction: by remote work ----------------------------------------
d <- df_bin %>%
  filter(!is.na(satis_flexibility_rec2), !is.na(remote_f)) %>%
  group_by(gender, remote_f) %>%
  summarise(pct = mean(satis_flexibility_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "remote_f", "pct",
                      title = "Flexibility Satisfaction by Gender x Remote Work",
                      subtitle = "Satisfaction conditional on actual access",
                      xlab = "Remote Work Level", ylab = "% Satisfied")
save_plot(p, "2_2c_satis_flex_gender_x_remote")

# --- 2.2c interaction: by age ------------------------------------------------
d <- df_bin %>%
  filter(!is.na(satis_flexibility_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(satis_flexibility_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Flexibility Satisfaction by Gender x Age",
       x = "Age Group", y = "% Satisfied") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_2c_satis_flex_gender_x_age")

# --- 2.2d: Work schedule type by gender (stacked bar) -----------------------
d <- df_bin %>%
  filter(!is.na(schedule_f)) %>%
  group_by(gender, schedule_f) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(pct = n / sum(n) * 100)

p <- ggplot(d, aes(x = gender, y = pct, fill = schedule_f)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_stack(vjust = 0.5), size = 3.5) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Work Schedule Type by Gender",
       subtitle = "Are women disproportionately in part-time or shift work?",
       x = "", y = "%", fill = "Schedule") +
  theme_survey
save_plot(p, "2_2d_schedule_type_by_gender")

# --- 2.2e: Flexibility valuation as job attribute ----------------------------
d <- df_bin %>%
  filter(!is.na(val_flexibility_rec)) %>%
  group_by(gender) %>%
  summarise(pct = mean(val_flexibility_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Flexibility Valuation as Job Attribute",
       subtitle = "% ranking work flexibility as important when choosing a job",
       x = "", y = "% Important") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "2_2e_val_flexibility_by_gender")

# --- 2.2e interaction: by age ------------------------------------------------
d <- df_bin %>%
  filter(!is.na(val_flexibility_rec), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(val_flexibility_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Flexibility Valuation by Gender x Age",
       x = "Age Group", y = "% Important") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_2e_val_flexibility_gender_x_age")

# --- 2.2e interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(val_flexibility_rec), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(val_flexibility_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Flexibility Valuation by Gender x Income",
                      subtitle = "Do low-income women value flexibility less?",
                      xlab = "Income Tier", ylab = "% Important")
save_plot(p, "2_2e_val_flexibility_gender_x_income")

# --- 2.2f: Remote/hybrid work valuation as job attribute ---------------------
d <- df_bin %>%
  filter(!is.na(val_remote_rec)) %>%
  group_by(gender) %>%
  summarise(pct = mean(val_remote_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Remote/Hybrid Work Valuation as Job Attribute",
       subtitle = "% ranking remote/hybrid work as important",
       x = "", y = "% Important") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "2_2f_val_remote_by_gender")

# --- 2.2g: Flexibility access vs satisfaction scatter ------------------------
d <- df_bin %>%
  filter(!is.na(remote_f), !is.na(satis_flexibility_rec2)) %>%
  group_by(gender, remote_f) %>%
  summarise(
    mean_satis = mean(satis_flexibility_rec2, na.rm = TRUE),
    n = n(),
    .groups = "drop"
  )

p <- ggplot(d, aes(x = remote_f, y = mean_satis, color = gender, size = n)) +
  geom_point(alpha = 0.8) +
  scale_color_manual(values = pal_gender) +
  scale_size_continuous(range = c(3, 10)) +
  labs(title = "Flexibility Access vs Satisfaction",
       subtitle = "Bubble size = n; is there a disconnect between access and satisfaction?",
       x = "Remote Work Level", y = "Mean Flexibility Satisfaction") +
  theme_survey
save_plot(p, "2_2g_flex_access_vs_satisfaction")

cat("  Task 07 complete: saved to figures/\n")

# ==============================================================================
# TASK 08: WAGE RENEGOTIATION & BARGAINING DYNAMICS (Section 2.3)
# ==============================================================================
cat("\n--- Task 08: Wage Renegotiation ---\n")

# --- 2.3a: Raise request rate by gender x age (lifecycle) -------------------
d <- df_bin %>%
  filter(!is.na(asked_raise), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "% (n=", n, ")")), vjust = -1, size = 3) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Raise Request Rate by Gender x Age",
       subtitle = "Do women reduce raise requests during peak childbearing years?",
       x = "Age Group", y = "% Requested Raise") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_3a_raise_request_gender_x_age")

# --- 2.3a interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(asked_raise), !is.na(generation), !is.na(income_tier)) %>%
  group_by(gender, generation, income_tier) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 2) +
  facet_wrap(~income_tier) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Raise Request Lifecycle by Income Tier",
       x = "Age Group", y = "% Requested Raise") +
  theme_survey +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
save_plot(p, "2_3a_raise_request_lifecycle_x_income", w = 10)

# --- 2.3b: Raise request rate by gender x income ----------------------------
d <- df_bin %>%
  filter(!is.na(asked_raise), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Raise Request Rate by Gender x Income",
                      subtitle = "Does the ask gap differ across the income distribution?",
                      xlab = "Income Tier", ylab = "% Requested Raise")
save_plot(p, "2_3b_raise_request_gender_x_income")

# --- 2.3c: Raise success rate by gender x age (filtered to askers) ----------
d <- df_bin %>%
  filter(!is.na(raise_result_rec), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(raise_result_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "% (n=", n, ")")), vjust = -1, size = 3) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Raise Success Rate by Gender x Age",
       subtitle = "Among those who asked — lifecycle profile",
       x = "Age Group", y = "% Successful") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_3c_raise_success_gender_x_age")

# --- 2.3d: Raise success by gender x org size (monopsony proxy) -------------
d <- df_bin %>%
  filter(!is.na(raise_result_rec), !is.na(org_size_f)) %>%
  group_by(gender, org_size_f) %>%
  summarise(pct = mean(raise_result_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "org_size_f", "pct",
                      title = "Raise Success Rate by Gender x Org Size",
                      subtitle = "Among those who asked — monopsony proxy",
                      xlab = "Organization Size", ylab = "% Successful")
save_plot(p, "2_3d_raise_success_gender_x_orgsize")

# --- 2.3e: Raise denial reasons by gender x income (heatmap) ----------------
deny_vars_23 <- c("deny_market_aligned_rec", "deny_band_limit_rec",
                  "deny_recent_adjust_rec", "deny_performance_rec",
                  "deny_budget_rec", "deny_other_reason_rec")
deny_labels_23 <- c("Market aligned", "Band limit", "Recent adjust",
                    "Performance", "Budget", "Other")

d <- df_bin %>%
  filter(raise_result_rec == 0, !is.na(income_tier)) %>%
  select(gender, income_tier, all_of(deny_vars_23)) %>%
  pivot_longer(cols = all_of(deny_vars_23), names_to = "reason", values_to = "selected") %>%
  filter(!is.na(selected)) %>%
  group_by(gender, income_tier, reason) %>%
  summarise(pct = mean(selected == 1) * 100, .groups = "drop") %>%
  mutate(reason_label = deny_labels_23[match(reason, deny_vars_23)])

p <- ggplot(d, aes(x = income_tier, y = reason_label, fill = pct)) +
  geom_tile(color = "white") +
  geom_text(aes(label = paste0(round(pct), "%")), size = 3) +
  facet_wrap(~gender) +
  scale_fill_gradient(low = "white", high = "#E84393") +
  labs(title = "Raise Denial Reasons by Gender x Income",
       subtitle = "Among those whose raise was denied",
       x = "Income Tier", y = "", fill = "% Citing") +
  theme_survey +
  theme(panel.grid = element_blank())
save_plot(p, "2_3e_denial_reasons_heatmap", w = 10, h = 5)

# --- 2.3f: Pre-hire negotiation by gender x age -----------------------------
d <- df_bin %>%
  filter(!is.na(raise_situation), !is.na(generation)) %>%
  mutate(negotiated = as.numeric(grepl("negoci", raise_situation, ignore.case = TRUE))) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(negotiated) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "generation", "pct",
                      title = "Pre-Hire Negotiation by Gender x Age",
                      subtitle = "% who negotiated salary — generational shift?",
                      xlab = "Generation", ylab = "% Negotiated")
save_plot(p, "2_3f_prehire_negotiation_gender_x_age")

# --- 2.3g: Raise request x meritocracy belief interaction --------------------
d <- df_bin %>%
  filter(!is.na(asked_raise), !is.na(promotion_eval_rec2)) %>%
  mutate(merit_belief = ifelse(promotion_eval_rec2 >= 3,
                               "High merit belief", "Low merit belief")) %>%
  group_by(gender, merit_belief) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "merit_belief", "pct",
                      title = "Raise Request Rate by Gender x Meritocracy Belief",
                      subtitle = "Is the ask gap concentrated among those who distrust the system?",
                      xlab = "", ylab = "% Requested Raise")
save_plot(p, "2_3g_raise_request_x_meritocracy")

cat("  Task 08 complete: saved to figures/\n")

# ==============================================================================
# TASK 09: MONOPSONY, SORTING & FIRM HETEROGENEITY (Section 2.4)
# ==============================================================================
cat("\n--- Task 09: Monopsony & Sorting ---\n")

# --- 2.4a: Gender gaps across satisfaction dimensions by org size (heatmap) --
satis_vars_24 <- c("satis_recognition_rec2", "satis_promotion_rec2",
                   "satis_salary_rec2", "satis_flexibility_rec2",
                   "satis_dei_rec2", "satis_workload_rec2", "satis_general_rec2")
satis_labels_24 <- c("Recognition", "Promotion", "Salary", "Flexibility",
                     "DEI", "Workload", "Overall")

d <- df_bin %>%
  filter(!is.na(org_size_f)) %>%
  select(gender, org_size_f, all_of(satis_vars_24)) %>%
  pivot_longer(cols = all_of(satis_vars_24),
               names_to = "dimension", values_to = "value") %>%
  filter(!is.na(value)) %>%
  group_by(gender, org_size_f, dimension) %>%
  summarise(pct = mean(value == 3) * 100, .groups = "drop") %>%
  pivot_wider(names_from = gender, values_from = pct) %>%
  mutate(gap = Femenino - Masculino,
         dim_label = satis_labels_24[match(dimension, satis_vars_24)])

p <- ggplot(d, aes(x = org_size_f, y = dim_label, fill = gap)) +
  geom_tile(color = "white", linewidth = 1) +
  geom_text(aes(label = paste0(round(gap, 1), "pp")), size = 3) +
  scale_fill_gradient2(low = "#0984E3", mid = "white", high = "#E84393",
                       midpoint = 0, name = "F-M gap (pp)") +
  labs(title = "Gender Gap in Satisfaction by Org Size",
       subtitle = "Positive = women more satisfied; Negative = men more satisfied",
       x = "Organization Size", y = "") +
  theme_survey +
  theme(panel.grid = element_blank())
save_plot(p, "2_4a_satis_gap_heatmap", w = 9, h = 5)

# --- 2.4b: Raise success x org size x gender (line plot / monopsony) --------
d <- df_bin %>%
  filter(!is.na(raise_result_rec), !is.na(org_size_f)) %>%
  group_by(gender, org_size_f) %>%
  summarise(pct = mean(raise_result_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = org_size_f, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "% (n=", n, ")")), vjust = -1, size = 3) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Raise Success Rate by Gender x Org Size (Monopsony Proxy)",
       subtitle = "Among those who asked — larger firms have more market power?",
       x = "Organization Size", y = "% Successful") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_4b_raise_success_monopsony")

# --- 2.4c: Turnover intention by gender x org size --------------------------
d <- df_bin %>%
  filter(!is.na(turnover_intent_rec2), !is.na(org_size_f)) %>%
  group_by(gender, org_size_f) %>%
  summarise(pct = mean(turnover_intent_rec2 == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "org_size_f", "pct",
                      title = "Turnover Intention by Gender x Org Size",
                      subtitle = "% wanting to change job",
                      xlab = "Organization Size", ylab = "% Want to Change")
save_plot(p, "2_4c_turnover_gender_x_orgsize")

# --- 2.4d: HR software usage and gender outcomes ----------------------------
# Salary satisfaction by HR software x gender
d <- df_bin %>%
  filter(!is.na(hr_software_rec), !is.na(satis_salary_rec2)) %>%
  mutate(hr_sw = ifelse(hr_software_rec == 1, "Uses HR Software", "No HR Software")) %>%
  group_by(gender, hr_sw) %>%
  summarise(pct = mean(satis_salary_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "hr_sw", "pct",
                      title = "Salary Satisfaction by Gender x HR Software",
                      subtitle = "Does HR formalization reduce gender gaps?",
                      xlab = "", ylab = "% Satisfied with Salary")
save_plot(p, "2_4d_hr_software_salary_satis")

# Raise success by HR software x gender
d <- df_bin %>%
  filter(!is.na(hr_software_rec), !is.na(raise_result_rec)) %>%
  mutate(hr_sw = ifelse(hr_software_rec == 1, "Uses HR Software", "No HR Software")) %>%
  group_by(gender, hr_sw) %>%
  summarise(pct = mean(raise_result_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "hr_sw", "pct",
                      title = "Raise Success by Gender x HR Software",
                      subtitle = "Does formalization reduce discretion in raise decisions?",
                      xlab = "", ylab = "% Successful")
save_plot(p, "2_4d_hr_software_raise_success")

cat("  Task 09 complete: saved to figures/\n")

# ==============================================================================
# TASK 10: FERTILITY & CAREER TRAJECTORIES (Section 2.5)
# ==============================================================================
cat("\n--- Task 10: Fertility & Career ---\n")

# --- 2.5a: Career (promotion) satisfaction by gender x age -------------------
d <- df_bin %>%
  filter(!is.na(satis_promotion_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(satis_promotion_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Career Satisfaction by Gender x Age (Lifecycle)",
       subtitle = "Does the gender gap widen during childbearing years?",
       x = "Age Group", y = "% Satisfied with Promotion Prospects") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_5a_career_satis_lifecycle")

# --- 2.5a interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(satis_promotion_rec2), !is.na(generation), !is.na(income_tier)) %>%
  group_by(gender, generation, income_tier) %>%
  summarise(pct = mean(satis_promotion_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 2) +
  facet_wrap(~income_tier) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Career Satisfaction Lifecycle by Income Tier",
       x = "Age Group", y = "% Satisfied") +
  theme_survey +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
save_plot(p, "2_5a_career_satis_lifecycle_x_income", w = 10)

# --- 2.5b: Overall job satisfaction by gender x age --------------------------
d <- df_bin %>%
  filter(!is.na(satis_general_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(satis_general_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Overall Job Satisfaction by Gender x Age",
       subtitle = "Do women's satisfaction trajectories diverge from men's in their 30s?",
       x = "Age Group", y = "% Satisfied Overall") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_5b_general_satis_lifecycle")

# --- 2.5c: Salary satisfaction by gender x age ------------------------------
d <- df_bin %>%
  filter(!is.na(satis_salary_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(satis_salary_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Salary Satisfaction by Gender x Age",
       subtitle = "Does the gender salary satisfaction gap open during prime fertility years?",
       x = "Age Group", y = "% Satisfied with Salary") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_5c_salary_satis_lifecycle")

# --- 2.5d: Burnout by gender x age ------------------------------------------
d <- df_bin %>%
  filter(!is.na(burnout_freq_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(burnout_freq_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Burnout by Gender x Age (Lifecycle)",
       subtitle = "Are women in their 30s-40s more burned out (dual burden)?",
       x = "Age Group", y = "% Frequent/Always Burnout") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_5d_burnout_lifecycle")

# --- 2.5d interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(burnout_freq_rec2), !is.na(generation), !is.na(income_tier)) %>%
  group_by(gender, generation, income_tier) %>%
  summarise(pct = mean(burnout_freq_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 2) +
  facet_wrap(~income_tier) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Burnout Lifecycle by Income Tier",
       x = "Age Group", y = "% Frequent/Always Burnout") +
  theme_survey +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
save_plot(p, "2_5d_burnout_lifecycle_x_income", w = 10)

# --- 2.5e: Raise request rate lifecycle profile ------------------------------
d <- df_bin %>%
  filter(!is.na(asked_raise), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(asked_raise == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Raise Request Rate Lifecycle Profile",
       subtitle = "Do women reduce negotiation effort during peak caregiving years?",
       x = "Age Group", y = "% Requested Raise") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_5e_raise_request_lifecycle")

# --- 2.5f: Training access by gender x age ----------------------------------
d <- df_bin %>%
  filter(!is.na(org_training_rec), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(org_training_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Training Access by Gender x Age",
       subtitle = "Do women in their 30s get less employer-funded training?",
       x = "Age Group", y = "% Received Training") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_5f_training_lifecycle")

cat("  Task 10 complete: saved to figures/\n")

# ==============================================================================
# TASK 11: WORK-LIFE BALANCE & HOUSEHOLD DECISIONS (Section 2.6)
# ==============================================================================
cat("\n--- Task 11: Work-Life Balance ---\n")

# --- 2.6a: Work-life interference frequency by gender -----------------------
d <- df_bin %>%
  filter(!is.na(wlb_interfere_personal_rec2)) %>%
  group_by(gender, wlb_interfere_personal_rec2) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(pct = n / sum(n) * 100)

p <- ggplot(d, aes(x = factor(wlb_interfere_personal_rec2), y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), vjust = -0.4, size = 3) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Work-Life Interference Frequency by Gender",
       subtitle = "Distribution from never to always",
       x = "Frequency (low to high)", y = "%") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "2_6a_wlb_interference_by_gender")

# --- 2.6a interaction: by work schedule --------------------------------------
d <- df_bin %>%
  filter(!is.na(wlb_interfere_personal_rec2), !is.na(schedule_f)) %>%
  group_by(gender, schedule_f) %>%
  summarise(pct_high = mean(wlb_interfere_personal_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "schedule_f", "pct_high",
                      title = "Work-Life Interference by Gender x Schedule",
                      subtitle = "% reporting frequent interference",
                      xlab = "", ylab = "% Frequent Interference")
save_plot(p, "2_6a_wlb_interference_gender_x_schedule")

# --- 2.6a interaction: by age ------------------------------------------------
d <- df_bin %>%
  filter(!is.na(wlb_interfere_personal_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(wlb_interfere_personal_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Work-Life Interference by Gender x Age",
       x = "Age Group", y = "% Frequent Interference") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_6a_wlb_interference_gender_x_age")

# --- 2.6b: All boundary violation items by gender (horizontal grouped bar) --
wlb_vars_26 <- c("wlb_overtime_rec2", "wlb_weekends_rec2",
                  "wlb_vacation_work_rec2", "wlb_available_off_hrs_rec2",
                  "wlb_think_after_work_rec2", "wlb_think_before_sleep_rec2",
                  "wlb_interfere_personal_rec2")
wlb_labels_26 <- c("Overtime", "Weekend work", "Vacation work",
                    "After-hours availability", "Think about work after hrs",
                    "Think before sleep", "Work-life interference")

d <- df_bin %>%
  select(gender, all_of(wlb_vars_26)) %>%
  pivot_longer(-gender, names_to = "item", values_to = "value") %>%
  filter(!is.na(value)) %>%
  group_by(gender, item) %>%
  summarise(mean_freq = mean(value, na.rm = TRUE), .groups = "drop") %>%
  mutate(item_label = wlb_labels_26[match(item, wlb_vars_26)],
         item_label = factor(item_label, levels = rev(wlb_labels_26)))

p <- ggplot(d, aes(x = item_label, y = mean_freq, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = round(mean_freq, 1)),
            position = position_dodge(0.8), hjust = -0.2, size = 3) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Work Boundary Violations by Gender",
       subtitle = "Mean frequency per item (higher = more frequent)",
       x = "", y = "Mean Frequency") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)))
save_plot(p, "2_6b_boundary_violations_by_gender", w = 10, h = 5.5)

# --- 2.6b interaction: by leadership ----------------------------------------
d <- df_bin %>%
  filter(!is.na(is_leader)) %>%
  select(gender, is_leader, all_of(wlb_vars_26)) %>%
  pivot_longer(cols = all_of(wlb_vars_26), names_to = "item", values_to = "value") %>%
  filter(!is.na(value)) %>%
  group_by(gender, is_leader, item) %>%
  summarise(mean_freq = mean(value, na.rm = TRUE), .groups = "drop") %>%
  mutate(item_label = wlb_labels_26[match(item, wlb_vars_26)],
         item_label = factor(item_label, levels = rev(wlb_labels_26)))

p <- ggplot(d, aes(x = item_label, y = mean_freq, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  coord_flip() +
  facet_wrap(~is_leader) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Boundary Violations by Gender x Leadership",
       x = "", y = "Mean Frequency") +
  theme_survey
save_plot(p, "2_6b_boundary_violations_gender_x_leader", w = 12, h = 6)

# --- 2.6c: Overtime work by gender x work schedule --------------------------
d <- df_bin %>%
  filter(!is.na(wlb_overtime_rec2), !is.na(schedule_f)) %>%
  group_by(gender, schedule_f) %>%
  summarise(pct = mean(wlb_overtime_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "schedule_f", "pct",
                      title = "Frequent Overtime by Gender x Work Schedule",
                      subtitle = "Do part-time women still work overtime? ('Part-time in name only')",
                      xlab = "", ylab = "% Frequent/Always Overtime")
save_plot(p, "2_6c_overtime_gender_x_schedule")

# --- 2.6d: Burnout frequency by gender (distribution) -----------------------
d <- df_bin %>%
  filter(!is.na(burnout_freq_rec2)) %>%
  group_by(gender, burnout_freq_rec2) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(pct = n / sum(n) * 100)

p <- ggplot(d, aes(x = factor(burnout_freq_rec2), y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), vjust = -0.4, size = 3) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Burnout Frequency by Gender",
       subtitle = "Distribution from never to always",
       x = "Frequency (low to high)", y = "%") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "2_6d_burnout_by_gender")

# --- 2.6d interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(burnout_freq_rec2), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(burnout_freq_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Burnout by Gender x Income",
                      xlab = "Income Tier", ylab = "% Frequent/Always Burnout")
save_plot(p, "2_6d_burnout_gender_x_income")

# --- 2.6d interaction: by work schedule --------------------------------------
d <- df_bin %>%
  filter(!is.na(burnout_freq_rec2), !is.na(schedule_f)) %>%
  group_by(gender, schedule_f) %>%
  summarise(pct = mean(burnout_freq_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "schedule_f", "pct",
                      title = "Burnout by Gender x Work Schedule",
                      xlab = "", ylab = "% Frequent/Always Burnout")
save_plot(p, "2_6d_burnout_gender_x_schedule")

# --- 2.6e: Emotional states by gender ----------------------------------------
emo_vars_26 <- c("emo_happy_rec2", "emo_stressed_rec2", "emo_committed_rec2",
                 "emo_depressed_rec2", "emo_bored_rec2")
emo_labels_26 <- c("Happy", "Stressed", "Committed", "Depressed", "Bored")

d <- df_bin %>%
  select(gender, all_of(emo_vars_26)) %>%
  pivot_longer(-gender, names_to = "emotion", values_to = "value") %>%
  filter(!is.na(value)) %>%
  group_by(gender, emotion) %>%
  summarise(mean_val = mean(value, na.rm = TRUE), .groups = "drop") %>%
  mutate(emo_label = emo_labels_26[match(emotion, emo_vars_26)],
         emo_label = factor(emo_label, levels = rev(emo_labels_26)))

p <- ggplot(d, aes(x = emo_label, y = mean_val, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = round(mean_val, 1)),
            position = position_dodge(0.8), hjust = -0.2, size = 3) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Emotional States at Work by Gender",
       subtitle = "Mean frequency (higher = more frequent)",
       x = "", y = "Mean Frequency") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)))
save_plot(p, "2_6e_emotions_by_gender", w = 9, h = 5)

# --- 2.6e interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(income_tier)) %>%
  select(gender, income_tier, emo_stressed_rec2, emo_depressed_rec2) %>%
  pivot_longer(cols = c(emo_stressed_rec2, emo_depressed_rec2),
               names_to = "emotion", values_to = "value") %>%
  filter(!is.na(value)) %>%
  mutate(emo_label = ifelse(grepl("stressed", emotion), "Stressed", "Depressed")) %>%
  group_by(gender, income_tier, emo_label) %>%
  summarise(mean_val = mean(value, na.rm = TRUE), .groups = "drop")

p <- ggplot(d, aes(x = income_tier, y = mean_val, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  facet_wrap(~emo_label) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Stress & Depression by Gender x Income",
       x = "Income Tier", y = "Mean Frequency") +
  theme_survey
save_plot(p, "2_6e_stress_depression_gender_x_income", w = 10)

# --- 2.6f: Work-life interference by gender x remote work -------------------
d <- df_bin %>%
  filter(!is.na(wlb_interfere_personal_rec2), !is.na(remote_f)) %>%
  group_by(gender, remote_f) %>%
  summarise(pct = mean(wlb_interfere_personal_rec2 >= 3, na.rm = TRUE) * 100,
            n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "remote_f", "pct",
                      title = "Work-Life Interference by Gender x Remote Work",
                      subtitle = "Does remote work reduce interference for women?",
                      xlab = "Remote Work Level", ylab = "% Frequent Interference")
save_plot(p, "2_6f_interference_gender_x_remote")

# --- 2.6g: Vacation length by gender ----------------------------------------
d <- df_bin %>%
  filter(!is.na(max_vacation_days_rec2)) %>%
  group_by(gender, max_vacation_days_rec2) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(pct = n / sum(n) * 100)

p <- ggplot(d, aes(x = factor(max_vacation_days_rec2), y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), vjust = -0.4, size = 3) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Longest Vacation Period by Gender",
       subtitle = "Do women take shorter vacations?",
       x = "Vacation Length Category", y = "%") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "2_6g_vacation_by_gender")

# --- 2.6g interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(max_vacation_days_rec2), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(mean_vac = mean(max_vacation_days_rec2, na.rm = TRUE),
            .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "mean_vac",
                      title = "Mean Vacation Length by Gender x Income",
                      xlab = "Income Tier", ylab = "Mean Vacation Category")
save_plot(p, "2_6g_vacation_gender_x_income")

# --- 2.6h: Burnout x work-life interference by gender (heatmap) -------------
d <- df_bin %>%
  filter(!is.na(burnout_freq_rec2), !is.na(wlb_interfere_personal_rec2)) %>%
  group_by(gender, burnout_freq_rec2, wlb_interfere_personal_rec2) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(pct = n / sum(n) * 100)

p <- ggplot(d, aes(x = factor(wlb_interfere_personal_rec2),
                   y = factor(burnout_freq_rec2), fill = pct)) +
  geom_tile(color = "white") +
  geom_text(aes(label = paste0(round(pct), "%")), size = 2.5) +
  facet_wrap(~gender) +
  scale_fill_gradient(low = "white", high = "#E84393") +
  labs(title = "Burnout x Work-Life Interference by Gender",
       subtitle = "Is the burnout-interference link stronger for women?",
       x = "Work-Life Interference (low to high)",
       y = "Burnout Frequency (low to high)",
       fill = "% of Group") +
  theme_survey +
  theme(panel.grid = element_blank())
save_plot(p, "2_6h_burnout_x_interference", w = 10, h = 5)

cat("  Task 11 complete: saved to figures/\n")

# ==============================================================================
# TASK 12: TURNOVER, DISCRIMINATION & FRONTIER (Section 2.7)
# ==============================================================================
cat("\n--- Task 12: Turnover & Discrimination ---\n")

# --- 2.7a: Turnover intention by gender (stacked bar) ----------------------
# turnover_intent_rec2: 1 = want to change, 2 = undecided, 3 = want to stay
d <- df_bin %>%
  filter(!is.na(turnover_intent_rec2)) %>%
  mutate(turn_label = case_when(
    turnover_intent_rec2 == 3 ~ "Want to stay",
    turnover_intent_rec2 == 2 ~ "Undecided",
    turnover_intent_rec2 == 1 ~ "Want to change",
    TRUE ~ NA_character_
  ),
  turn_label = factor(turn_label,
                      levels = c("Want to change", "Undecided", "Want to stay"))) %>%
  filter(!is.na(turn_label)) %>%
  group_by(gender, turn_label) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(pct = n / sum(n) * 100)

p <- ggplot(d, aes(x = gender, y = pct, fill = turn_label)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_stack(vjust = 0.5), size = 3.5) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Turnover Intention by Gender",
       subtitle = "Are women more likely to want to leave their job?",
       x = "", y = "%", fill = "Intention") +
  theme_survey
save_plot(p, "2_7a_turnover_intent_by_gender")

# --- 2.7a interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(turnover_intent_rec2), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(turnover_intent_rec2 == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Turnover Intention by Gender x Income",
                      xlab = "Income Tier", ylab = "% Want to Change")
save_plot(p, "2_7a_turnover_gender_x_income")

# --- 2.7a interaction: by age ------------------------------------------------
d <- df_bin %>%
  filter(!is.na(turnover_intent_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(turnover_intent_rec2 == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Turnover Intention by Gender x Age",
       x = "Age Group", y = "% Want to Change") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_7a_turnover_gender_x_age")

# --- 2.7b: Reasons for wanting to change job by gender ----------------------
turn_vars <- c("turn_no_growth_rec", "turn_bad_environment_rec",
               "turn_compensation_rec", "turn_work_life_rec",
               "turn_leadership_rec", "turn_discrimination_rec",
               "turn_burnout_rec", "turn_no_purpose_rec")
turn_labels <- c("No growth", "Bad environment", "Compensation",
                 "Work-life imbalance", "Leadership", "Discrimination",
                 "Burnout", "No purpose")

d <- df_bin %>%
  select(gender, all_of(turn_vars)) %>%
  pivot_longer(-gender, names_to = "reason", values_to = "selected") %>%
  filter(!is.na(selected)) %>%
  group_by(gender, reason) %>%
  summarise(pct = mean(selected == 1) * 100, .groups = "drop") %>%
  mutate(reason_label = turn_labels[match(reason, turn_vars)],
         reason_label = factor(reason_label, levels = rev(turn_labels)))

p <- ggplot(d, aes(x = reason_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 2.8) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Reasons for Wanting to Change Job by Gender",
       x = "", y = "% Citing Reason") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.25)))
save_plot(p, "2_7b_turnover_reasons_by_gender", w = 9, h = 5.5)

# --- 2.7c: Work-life imbalance as reason to leave by gender x age -----------
d <- df_bin %>%
  filter(!is.na(turn_work_life_rec), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(turn_work_life_rec == 1) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Work-Life Imbalance as Turnover Driver by Gender x Age",
       subtitle = "Is WLB a bigger driver for women in their 30s?",
       x = "Age Group", y = "% Citing Work-Life Imbalance") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_7c_turnover_worklife_gender_x_age")

# --- 2.7d: Discrimination as reason to leave by gender x role ---------------
d <- df_bin %>%
  filter(!is.na(turn_discrimination_rec), !is.na(role_label)) %>%
  group_by(gender, role_label) %>%
  summarise(pct = mean(turn_discrimination_rec == 1) * 100, n = n(), .groups = "drop") %>%
  filter(!is.na(role_label))

p <- ggplot(d, aes(x = role_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 3) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Discrimination as Turnover Driver by Gender x Role",
       subtitle = "Are women in leadership more likely to cite discrimination?",
       x = "", y = "% Citing Discrimination") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.25)))
save_plot(p, "2_7d_turnover_discrimination_gender_x_role", w = 9, h = 5.5)

# --- 2.7e: Burnout as reason to leave by gender x work schedule -------------
d <- df_bin %>%
  filter(!is.na(turn_burnout_rec), !is.na(schedule_f)) %>%
  group_by(gender, schedule_f) %>%
  summarise(pct = mean(turn_burnout_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "schedule_f", "pct",
                      title = "Burnout as Turnover Driver by Gender x Work Schedule",
                      subtitle = "Burnout-driven turnover among part-time women (dual burden)?",
                      xlab = "", ylab = "% Citing Burnout")
save_plot(p, "2_7e_turnover_burnout_gender_x_schedule")

# --- 2.7f: Compensation inadequacy as reason to leave by gender x income ----
d <- df_bin %>%
  filter(!is.na(turn_compensation_rec), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(turn_compensation_rec == 1) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Compensation as Turnover Driver by Gender x Income",
                      subtitle = "At what income level does compensation become a driver for women?",
                      xlab = "Income Tier", ylab = "% Citing Compensation")
save_plot(p, "2_7f_turnover_compensation_gender_x_income")

cat("  Task 12 complete: saved to figures/\n")

# ==============================================================================
# TASK 13: HUMAN CAPITAL & COMPENSATING DIFFERENTIALS (Section 2.8)
# ==============================================================================
cat("\n--- Task 13: Human Capital ---\n")

# --- 2.8a: Self-assessment of performance by gender -------------------------
prod_vars <- c("prod_tasks_on_time_rec2", "prod_quality_rec2",
               "prod_time_efficient_rec2")
prod_labels <- c("Tasks on time", "Quality satisfaction", "Time efficiency")

d <- df_bin %>%
  select(gender, all_of(prod_vars)) %>%
  pivot_longer(-gender, names_to = "item", values_to = "value") %>%
  filter(!is.na(value)) %>%
  group_by(gender, item) %>%
  summarise(pct = mean(value == 3) * 100, .groups = "drop") %>%
  mutate(item_label = prod_labels[match(item, prod_vars)],
         item_label = factor(item_label, levels = rev(prod_labels)))

p <- ggplot(d, aes(x = item_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 3.5) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Self-Assessment of Performance by Gender",
       subtitle = "% strongly agreeing — are women less confident?",
       x = "", y = "% Strongly Agree") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)))
save_plot(p, "2_8a_self_assessment_by_gender", w = 9, h = 4.5)

# --- 2.8a interaction: by leadership ----------------------------------------
d <- df_bin %>%
  filter(!is.na(is_leader)) %>%
  select(gender, is_leader, all_of(prod_vars)) %>%
  pivot_longer(cols = all_of(prod_vars), names_to = "item", values_to = "value") %>%
  filter(!is.na(value)) %>%
  group_by(gender, is_leader, item) %>%
  summarise(pct = mean(value == 3) * 100, .groups = "drop") %>%
  mutate(item_label = prod_labels[match(item, prod_vars)],
         item_label = factor(item_label, levels = rev(prod_labels)))

p <- ggplot(d, aes(x = item_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  coord_flip() +
  facet_wrap(~is_leader) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Self-Assessment by Gender x Leadership",
       subtitle = "Do women leaders underrate themselves?",
       x = "", y = "% Strongly Agree") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "2_8a_self_assessment_gender_x_leader", w = 10, h = 5)

# --- 2.8a interaction: by age ------------------------------------------------
d <- df_bin %>%
  filter(!is.na(generation)) %>%
  select(gender, generation, prod_quality_rec2) %>%
  filter(!is.na(prod_quality_rec2)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(prod_quality_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Quality Self-Assessment by Gender x Age",
       subtitle = "Does the confidence gap widen with age?",
       x = "Age Group", y = "% Strongly Agree (Quality)") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_8a_quality_assessment_gender_x_age")

# --- 2.8b: Sense of responsibility for own development by gender -------------
d <- df_bin %>%
  filter(!is.na(own_development_rec2)) %>%
  group_by(gender) %>%
  summarise(pct = mean(own_development_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = gender, y = pct, fill = gender)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -0.4, size = 4) +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Responsibility for Own Professional Development",
       subtitle = "% agree/strongly agree: 'I feel responsible for my own development'",
       x = "", y = "% Agree") +
  theme_survey + guides(fill = "none") +
  scale_y_continuous(expand = expansion(mult = c(0, 0.15)))
save_plot(p, "2_8b_own_development_by_gender")

# --- 2.8b interaction: by income tier ----------------------------------------
d <- df_bin %>%
  filter(!is.na(own_development_rec2), !is.na(income_tier)) %>%
  group_by(gender, income_tier) %>%
  summarise(pct = mean(own_development_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- plot_grouped_bar(d, "income_tier", "pct",
                      title = "Own Development Responsibility by Gender x Income",
                      xlab = "Income Tier", ylab = "% Agree")
save_plot(p, "2_8b_own_development_gender_x_income")

# --- 2.8b interaction: by age ------------------------------------------------
d <- df_bin %>%
  filter(!is.na(own_development_rec2), !is.na(generation)) %>%
  group_by(gender, generation) %>%
  summarise(pct = mean(own_development_rec2 == 3) * 100, n = n(), .groups = "drop")

p <- ggplot(d, aes(x = generation, y = pct, color = gender, group = gender)) +
  geom_line(linewidth = 1) + geom_point(size = 3) +
  geom_text(aes(label = paste0(round(pct), "%")), vjust = -1, size = 3.2) +
  scale_color_manual(values = pal_gender) +
  labs(title = "Own Development Responsibility by Gender x Age",
       x = "Age Group", y = "% Agree") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.15)))
save_plot(p, "2_8b_own_development_gender_x_age")

# --- 2.8b interaction: by role -----------------------------------------------
d <- df_bin %>%
  filter(!is.na(own_development_rec2), !is.na(role_label)) %>%
  group_by(gender, role_label) %>%
  summarise(pct = mean(own_development_rec2 == 3) * 100, n = n(), .groups = "drop") %>%
  filter(!is.na(role_label))

p <- ggplot(d, aes(x = role_label, y = pct, fill = gender)) +
  geom_col(position = position_dodge(0.8), width = 0.7) +
  geom_text(aes(label = paste0(round(pct), "%")),
            position = position_dodge(0.8), hjust = -0.2, size = 3) +
  coord_flip() +
  scale_fill_manual(values = pal_gender) +
  labs(title = "Own Development Responsibility by Gender x Role",
       x = "", y = "% Agree") +
  theme_survey +
  scale_y_continuous(expand = expansion(mult = c(0, 0.2)))
save_plot(p, "2_8b_own_development_gender_x_role", w = 9, h = 5.5)

cat("  Task 13 complete: saved to figures/\n")

# ==============================================================================
cat("\n=== All Tasks 01-13 complete ===\n")
cat("Figures saved to:", normalizePath(fig_dir), "\n")

