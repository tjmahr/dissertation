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

aim1_stim <- list(
  good_phon = c(
    "bear", "bee", "bell", "dress", "drum", "flag", "fly",
    "heart", "horse", "pan", "pear", "pen", "vase"),
  good_semy = c(
    "bear", "bee", "bell", "bread", "cheese", "dress",
    "drum", "fly", "horse", "pan", "pear", "shirt", "spoon")
)

recode_studies <- tibble::tribble(
  ~S,           ~S2,          ~Study,       ~Age,
  "TimePoint1", "TimePoint1", "TimePoint1", "Age 3",
  "TimePoint2", "TimePoint2", "TimePoint2", "Age 4",
  "TimePoint3", "TimePoint3", "TimePoint3", "Age 5"
)

convert_study_to_age <- function(xs) {
  factor(
    xs,
    levels = c("TimePoint1", "TimePoint2", "TimePoint3"),
    labels = c("Age 3", "Age 4", "Age 5"))
}

# prints p-value in markdown as "*p* < .001" or "*p* = [whatever]"
format_p_value <- function(p, digits = 3) {
  formatted <- printy::fmt_p_value(p, digits)
  less_than <- stringr::str_detect(formatted, "<")
  if (less_than) {
    paste0("*p*&nbsp;", formatted)
  } else {
    paste0("*p*&nbsp;= ", formatted)
  }
}

# formats a chi-square stat provided by itsadug
format_chi_squared <- function(comparison, round_by = 2, p_digits = 3) {
  comp_df <- levels(comparison$table$Df)[2] %>%
    as.numeric() %>%
    round(round_by)

  comp_diff <- levels(comparison$table$Difference)[round_by] %>%
    as.numeric() %>%
    round(2)

  comp_p <- levels(comparison$table$p.value)[round_by] %>%
    as.numeric() %>%
    format_p_value(digits = p_digits)

  sprintf("_&chi;_<sup>2</sup>(%s)&nbsp;= %s, %s",
          comp_df, comp_diff, comp_p)
}


get_smooth_edf <- function(summary, term, digits = 2) {
  summary$s.table %>%
    as.data.frame() %>%
    setNames(c("edf", "Ref.df", "F", "p.value")) %>%
    tibble::rownames_to_column(".term") %>%
    filter(.term == term) %>%
    pull(edf) %>%
    printy::fmt_fix_digits(digits)
}

get_smooth_pvalue <- function(summary, term, digits = 3) {
  summary$s.table %>%
    as.data.frame() %>%
    setNames(c("edf", "Ref.df", "F", "p.value")) %>%
    tibble::rownames_to_column(".term") %>%
    filter(.term == term) %>%
    pull(p.value) %>%
    format_p_value()
}

