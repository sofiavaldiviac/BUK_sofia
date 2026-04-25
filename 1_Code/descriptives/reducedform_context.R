# ==============================================================================
# Reduced-Form Context Plots — Issue #2 Descriptive Plots
# ==============================================================================
# Plots that use external or hardcoded data (no BUK data loading).
# Organized by data source: this file parallels reducedform_survey.R
# (which handles survey-based plots).
#
# Covers:
#   Plot 6.4  (task issue2_36) — Reform timeline overlaid on BUK panel coverage
# ==============================================================================

# --- Libraries ----------------------------------------------------------------
library(tidyverse)

# --- Paths --------------------------------------------------------------------
fig_dir <- "/Users/sofiavaldivia/Documents/GitHub/Chile_BUK_CNS/BUK_sofia/1_Code/figures"
dir.create(fig_dir, showWarnings = FALSE, recursive = TRUE)

# ==============================================================================
# THEME & HELPERS (consistent with reducedform_survey.R)
# ==============================================================================

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
# PLOT 6.4 — Reform Timeline Overlaid on BUK Panel Coverage (Task issue2_36)
# ==============================================================================
cat("--- Plot 6.4: Reform Timeline ---\n")

# --- BUK firm growth (from summary_stats.py) ----------------------------------
buk_growth <- tibble(
  date  = as.Date(c("2022-01-01", "2023-01-01", "2024-01-01",
                     "2025-01-01", "2026-07-01")),
  firms = c(2299, 3906, 6325, 10606, 11682)
)

# --- Reform events ------------------------------------------------------------
reforms <- tibble(
  date = as.Date(c("2024-01-29", "2024-04-26", "2026-04-26", "2028-04-26")),
  label = c(
    "Ley 21.645\nFlexible work\nfor caregivers",
    "Ley 21.561\n45 \u2192 44 hrs",
    "Ley 21.561\n44 \u2192 42 hrs",
    "Ley 21.561\n42 \u2192 40 hrs"
  ),
  law = c("21.645", "21.561", "21.561", "21.561")
)

# --- Color palette for reform lines ------------------------------------------
pal_reform <- c("21.561" = "#2d3436", "21.645" = "#d63031")

# --- X-axis limits ------------------------------------------------------------
x_min <- as.Date("2022-01-01")
x_max <- as.Date("2027-01-01")

# --- Build plot ---------------------------------------------------------------
p6_4 <- ggplot() +
  # 1. BUK panel window shading
  annotate("rect",
           xmin = as.Date("2022-01-01"), xmax = as.Date("2027-12-31"),
           ymin = -Inf, ymax = Inf,
           fill = "#dfe6e9", alpha = 0.5) +

  # 2. BUK firm count — background area
  geom_area(data = buk_growth, aes(x = date, y = firms),
            fill = "#74b9ff", alpha = 0.3, color = "#0984e3",
            linewidth = 0.6) +

  # 3. Reform vertical lines
  geom_vline(data = reforms, aes(xintercept = date, color = law),
             linetype = "dashed", linewidth = 0.7) +

  # 4. Reform labels
  geom_label(data = reforms,
             aes(x = date, y = c(10500, 8500, 10500, 8500), label = label,
                 color = law),
             size = 2.8, fontface = "bold", fill = "white",
             label.padding = unit(0.3, "lines"),
             linewidth = 0.3, show.legend = FALSE) +

  # 5. Color scale for reform lines
  scale_color_manual(
    values = pal_reform,
    labels = c("21.561" = "Ley 21.561 (40-hr workweek)",
               "21.645" = "Ley 21.645 (flexible work)"),
    name = ""
  ) +

  # 6. BUK panel label

  annotate("text", x = as.Date("2024-06-01"), y = 500,
           label = "BUK panel coverage (2022\u20132026)",
           size = 3.2, color = "grey40", fontface = "italic") +

  # 7. Axes and labels
  scale_x_date(
    limits = c(x_min, x_max),
    date_breaks = "1 year", date_labels = "%Y",
    expand = expansion(mult = c(0.02, 0.02))
  ) +
  scale_y_continuous(
    labels = scales::comma,
    expand = expansion(mult = c(0, 0.15))
  ) +
  labs(
    title    = "Chilean Labor Reforms and BUK Panel Coverage",
    subtitle = "Reform implementation dates overlaid on BUK platform firm growth",
    x = "", y = "Number of firms on BUK platform",
    caption  = paste0(
      "Source: BUK administrative records. ",
      "Art. 203 (childcare mandate for firms with 20+ female workers) ",
      "in effect throughout the panel period."
    )
  ) +
  theme_rf +
  theme(
    panel.grid.minor.x = element_blank(),
    legend.position = "bottom"
  )

save_plot(p6_4, "rf_6_4_reform_timeline", w = 10, h = 6)

# ==============================================================================
# Summary
# ==============================================================================
cat("\n=== Context plots complete ===\n")
cat("Figures saved to:", fig_dir, "\n")
cat("Files:\n")
cat("  rf_6_4_reform_timeline.png\n")
