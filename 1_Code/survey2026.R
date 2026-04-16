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
data_path <- file.path("/Users/sofiavaldivia/Documents/GitHub/BUK/3_Documents/Original/Base de datos WiP 2026.xlsx")
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

# --- Filter: keep only Chilean workers ----------------------------------------
df <- df %>% filter(country == "Chile")

# --- Quick overview -----------------------------------------------------------
cat("Data loaded:", nrow(df), "Chilean observations,", ncol(df), "variables\n\n")
glimpse(df)



