# Helpers
# 7A475D,#2C9286,#E7A750
# tufts blue "#2980B9"
# charcoal "#2C3E50"

# "Cool and calm"
# "Sun and sky"
# "Cheerful brights"
# "Violet sunset"
# "Sun and sky"
# "Warm and cool"
# "Bright and painterly"
# "Bold and punchy"
# "Warm and wonderful"
# "Tropical tones"

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
  y_prop_fam = "Proportion looks to familiar image",
  y_pred_elog_phon = "Predicted emp. log-odds [Phon.]",
  y_elog_phon = "Emp. log-odds(Phon. vs. Unrelated)",
  y_elog_semy = "Emp. log-odds(Sem. vs. Unrelated)",
  y_elog_diff_phon = "Diff. in emp. log-odds",
  y_elog_diff_semy = "Diff. in emp. log-odds",
  lab_study = "Study",
  col_blue_highlight = "#0074D9",
  col_off_black = "#111111",
  col_infobox_blue = "#EEF7FA",
  col_infobox_plot_bg = "#E5EAEF",
  col_darker_coral = "#BB655F",
  col_darker_turquoise = "#009DA1",
  cap_median_90_50 = "Posterior median with 90% and 50% intervals",
  cap_90_50 = "90% and 50% intervals",
  cap_mean_95 = "Fitted means with 95% interval",
  cap_diff_95 = "Estimated difference with 95% interval",
  note_mp_fam =
    "Mispronunciation trials starting on familiar image",
  note_mp_unfam =
    "Mispronunciation trials starting on unfamiliar image",
  note_unfam = "Trials starting on unfamiliar image",
  col_real = "#6b7a8f",
  col_nonword = "#f7882f",
  col_mispronunciation = "#cyan4"
)

if (knitr::is_latex_output()) {
  out_tex100_else80 <- "100%"
  out_tex100_else60 <- "100%"
  out_tex80_else66 <- "80%"
  out_tex80_else50 <- "80%"

} else {
  out_tex100_else80 <- "80%"
  out_tex100_else60 <- "60%"
  out_tex80_else66 <- "66%"
  out_tex80_else50 <- "50%"

}

library(extrafont)
extrafont::loadfonts(quiet = TRUE)

theme_teej <- function(base_size = 11, base_family = "Lato Medium",
                       base_line_size = base_size / 22,
                       base_rect_size = base_size / 22) {
  half_line <- base_size / 2

  start <- theme_grey(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size)

  start %+replace%
    theme(
      axis.title = element_text(hjust = 1),
      strip.text = element_text(
        hjust = 0, family = "Lato Medium", size = rel(1),
        margin = margin(
          t = 0.80 * half_line,
          r = 0.25 * half_line,
          b = 0.80 * half_line,
          l = 0.25 * half_line)),
      strip.background = element_rect(fill = NA, colour = NA))
}
theme_set(theme_teej())

if (knitr::is_latex_output()) {
  theme_set(theme_teej(base_size = 12))
}

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
  already_converted <- all(unique(xs) %in% c("Age 3", "Age 4", "Age 5"))
  if (!already_converted) {
    xs <- factor(
      xs,
      levels = c("TimePoint1", "TimePoint2", "TimePoint3"),
      labels = c("Age 3", "Age 4", "Age 5"))
  } else {
    xs <- factor(
      xs,
      levels = c("Age 3", "Age 4", "Age 5"),
      labels = c("Age 3", "Age 4", "Age 5"))
  }
  xs
}

convert_condition_to_name <- function(xs) {
  factor(
    xs,
    levels = c("real", "nonsense", "MP"),
    labels = c("real words", "nonwords", "mispronunciations"))
}

augment_linpred <- function(model, data, ...) {
  model %>%
    posterior_linpred(newdata = data, ...) %>%
    as.data.frame() %>%
    as_tibble() %>%
    rlang::set_names(seq_len(nrow(data))) %>%
    tibble::rowid_to_column(".draw") %>%
    tidyr::gather(".observation", ".posterior_value", -.draw) %>%
    mutate(.observation = as.numeric(.observation)) %>%
    left_join(
      data %>% tibble::rowid_to_column(".observation"),
      by = ".observation")
}

parse_text <- function(x) parse(text = x)

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
    format_p_value(digits)
}

get_para_pvalue <- function(summary, term, digits = 3) {
  summary$p.table %>%
    as.data.frame() %>%
    tibble::rownames_to_column(".term") %>%
    rename(estimate = Estimate, p.value = `Pr(>|t|)`) %>%
    filter(.term == term) %>%
    pull(p.value) %>%
    format_p_value(digits)
}

get_para_estimate <- function(summary, term) {
  summary$p.table %>%
    as.data.frame() %>%
    tibble::rownames_to_column(".term") %>%
    rename(estimate = Estimate, p.value = `Pr(>|t|)`) %>%
    filter(.term == term) %>%
    pull(estimate)
}

pluck <- purrr::pluck

get_pts <- function(x, n = 2) {
  x %>%
    lapply(
      . %>%
        pluck("m") %>%
        printy::fmt_fix_digits(n) %>%
        printy::fmt_minus_sign())
}

get_uis <- function(x, n = 2) {
  fmt_one_ui <- . %>%
    printy::fmt_fix_digits(n) %>%
    printy::fmt_minus_sign()

  fmt_ui <- . %>%
    glue::glue_data("{fmt_one_ui(ll)}, {fmt_one_ui(hh)}")

  x %>%
    lapply(fmt_ui)
}

get_cor_pts <- function(x, n = 2) {
  fmt_cor <- . %>%
    printy::fmt_fix_digits(n) %>%
    printy::fmt_leading_zero() %>%
    printy::fmt_minus_sign()

  x %>%
    lapply(. %>% pluck("m") %>% fmt_cor())
}

get_cor_uis <- function(x, n = 2) {
  fmt_cor <- . %>%
    printy::fmt_fix_digits(n) %>%
    printy::fmt_leading_zero() %>%
    printy::fmt_minus_sign()

  x %>%
    lapply(. %>% glue::glue_data("{fmt_cor(ll)}, {fmt_cor(hh)}"))
}

fmt_inline_median_interval <- function(x, n = 2) {
  pts <- get_pts(x, n)
  uis <- get_uis(x, n)

  purrr::map2(pts, uis,
    function(a, b) sprintf("%s [%s]", a,b)
  )
}

add_ui_slug_to_first <- function(x, slug = "90%&nbsp;UI: ") {
  x[[1]] <- x[[1]] %>%
    stringr::str_replace(" \\[", paste0(" [", slug))
  x
}

fmt_convert_prop_to_percent <- function(xs) {
  stringr::str_replace_all(
    xs,
    "(0?[.]\\d+)",
    function(prop) scales::percent(as.numeric(prop)))
}

fmt_remove_leading_zeros_in_text <- function(xs) {
  stringr::str_replace_all(xs, "0[.]", ".")
}

fct_add_counts <- function(xs, fmt = "{levels} ({counts})", first_fmt = "{levels} ({counts})") {
  levels <- names(table(xs))
  counts <- unname(table(xs))
  with_counts <- as.character(glue::glue(fmt))
  with_counts[1] <- as.character(glue::glue(first_fmt))[1]
  factor(xs, levels, labels = with_counts)
}


scale_color_real_non <- function(..., palette = "Cheerful and sleek") {
  ggthemes::scale_color_canva(
    ...,
    palette = palette)
}

scale_color_study <- function(..., end = .6, option = "D") {
  ggplot2::scale_color_viridis_d(
    ...,
    end = end,
    option = option)
}

scale_fill_study <- function(..., end = .6, option = "D") {
  ggplot2::scale_fill_viridis_d(
    ...,
    end = end,
    option = option)

}


