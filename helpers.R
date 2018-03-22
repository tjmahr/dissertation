# Helpers

# ---- helpers ----
library(dplyr)
library(rlang)
library(littlelisteners)
library(ggplot2)
library(tjmisc)

constants <- list(
  x_time = "Time after target onset [ms]",
  y_logodds_target = "Log-odds looking to target",
  y_prop_target = "Proportion looks to target",
  col_blue_highlight = "#0074D9",
  col_off_black = "#111111",
  cap_median_90_50 = "Posterior median with 90% and 50% intervals",
  cap_90_50 = "90% and 50% intervals"
)
