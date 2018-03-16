library(dplyr)
library(rstanarm)
source("./helpers.R")
theme_set(theme_grey())

# Load the model and the data-set used to train it
b <- readr::read_rds("./data/stan_aim1_cubic_model.rds.gz")
d_m <- b$data

# Set the model function if it's missing. This fixes a programming oversight
# from an rstanarm update <https://github.com/stan-dev/rstanarm/issues/244>
if (is.null(b$stan_function)) {
  b$stan_function <- "stan_glmer"
}

# Create a minimal grid of variables used in the model's fixed effects
fixef_pred_grid <- function(model) {
  # Get a data-frame with everything on the right hand side of model formula
  data <- model.frame(model)
  f <- get_f_rhs(lme4::nobars(formula(model)))
  preds <- model.frame(f, data)

  # Find the names of continuous variables
  mm <- model.matrix(model)
  factors <- names(attr(mm, "contrasts"))
  values <- lapply(preds, modelr::typical)
  cont_vars <- setdiff(names(values), factors)

  levels_or_defaults <- function(xs) {
    levels(xs) %||% levels(factor(unique(xs)))
  }

  # Expand the "typical" values of factors to all levels
  values[factors] <- data[factors] %>%
    lapply(levels_or_defaults)

  # Create a model frame with just the continuous vars and intercept
  cont_df <- seq_along(cont_vars) %>%
    lapply(function(i) diag(length(cont_vars) + 1)[, i + 1]) %>%
    as.data.frame() %>%
    setNames(cont_vars) %>%
    tibble::add_column(intercept = 1, .before = 1)

  if (nrow(cont_df) == 0) {
    cont_df <- data.frame(intercept = 1)
  }

  # Repeat the matrix of continuous vars for each level of
  # each factor
  tidyr::crossing(!!! values[factors], cont_df) %>%
    mutate(.focus = rep(names(cont_df), len = nrow(.)))
}

# Get right-hand side of a model formula
get_f_rhs <- function(f) {
  f[[2]] <- NULL
  f
}

# Remove the intercept's contribution from a model's fitted values
remove_intercept_effects <- function(predictions) {
  # Find the names of non-intercept values
  focuses <- unique(predictions$.focus)
  non_intercepts <- setdiff(focuses, "intercept")

  # Each row has a focus on a coefficient. Subtract the intercept effect from
  # the posterior value whenever the focus is not the intercept. This yields
  # the predicted effect of the coefficient.
  predictions %>%
    tidyr::gather("coef", "weight", one_of(focuses)) %>%
    select(-one_of(".observation", "weight")) %>%
    tidyr::spread(.data$.focus, .data$.posterior_value) %>%
    mutate_at(non_intercepts, funs(. - intercept)) %>%
    tidyr::gather(".focus", ".posterior_value", one_of(focuses)) %>%
    filter(.data$coef == .data$.focus) %>%
    select(-one_of(".focus"))
}




# Test feature extraction functions ---------------------------------------

predictions <- fixef_pred_grid(b) %>%
  tidyr::crossing(Primary = 0, Others = 0, ResearchID = "DUMMY") %>%
  tristan::augment_posterior_linpred(b, ., re.form = ~ 0)

adjusted_effects <- remove_intercept_effects(predictions)

# ggplot(adjusted_effects) +
#   aes(x = coef, y = .posterior_value, color = Study) +
#   stat_summary(fun.data = median_hilow, position = position_dodge(-.4),
#                fun.args = list(conf.int = .9)) +
#   coord_flip()

# Confirm that the median of the predictions matches the model's fixed effects
# point values
adjusted_effects %>%
  filter(Study == "TimePoint1") %>%
  group_by(coef) %>%
  summarise(effect = median(.posterior_value)) %>%
  tibble::add_column(fixef(b)[1:4])

# Look at some predictions for individual participants
set.seed(20180126)
df <- sample_n_of(d_m, 5, ResearchID) %>%
  distinct(ResearchID)

sample_children <- fixef_pred_grid(b) %>%
  tidyr::crossing(Primary = 0, Others = 0, ResearchID = df$ResearchID) %>%
  tristan::augment_posterior_linpred(b, .) %>%
  remove_intercept_effects()

# ggplot(sample_children) +
#   aes(x = coef, y = .posterior_value, color = Study) +
#   stat_summary(fun.data = median_hilow, position = position_dodge(-.4),
#                fun.args = list(conf.int = .9)) +
#   coord_flip() +
#   facet_wrap("ResearchID")

# We see wide intervals for participants without any data in a study.
d_m %>%
  filter(ResearchID %in% df$ResearchID) %>%
  distinct(ResearchID, Study) %>%
  count(ResearchID, Study) %>%
  tidyr::spread(Study, n)




# Extract participant features --------------------------------------------

# Extract values in batches of 10 participants
df <- d_m %>% distinct(ResearchID)
sub_groups <- df$ResearchID %>% split(seq_along(.) %% 10)

# Set up prediction grid and lists for storing prediction outputs
df_minimal <- d_m %>%
  select(Study, ResearchID, ot1, ot2, ot3) %>%
  mutate(Primary = 0, Others = 0)
output <- list_along(sub_groups)
output_peaks <- list_along(sub_groups)

for (sub_group_i in seq_along(sub_groups)) {
  # Compute growth curve features for each participant
  ids <- sub_groups[[sub_group_i]]
  preds <- fixef_pred_grid(b) %>%
    tidyr::crossing(Primary = 0, Others = 0, ResearchID = ids) %>%
    tristan::augment_posterior_linpred(b, .) %>%
    remove_intercept_effects() %>%
    select(-Primary, -Others)
  output[[sub_group_i]] <- preds

  # Compute growth curve peaks for each participant
  peaks <- df_minimal %>%
    semi_join(data_frame(ResearchID = ids), by = "ResearchID") %>%
    tristan::augment_posterior_linpred(b, .) %>%
    select(ResearchID, Study, .draw, .posterior_value) %>%
    group_by(ResearchID, Study, .draw) %>%
    top_n(5, .posterior_value) %>%
    summarise(Peak_Logit = median(.posterior_value)) %>%
    ungroup()
  output_peaks[[sub_group_i]] <- peaks
}

all <- bind_rows(output)
peaks <- bind_rows(output_peaks) %>%
  rename(.posterior_value = Peak_Logit) %>%
  mutate(coef = "peak_logit")

bind_rows(all, peaks) %>%
  # Keep only GCA features for observed study-child values
  semi_join(d_m) %>%
  arrange(ResearchID, Study, coef, .draw) %>%
  readr::write_csv("./data/aim1-gca-features.csv.gz")

rm(peaks)

# Checking on results -----------------------------------------------------

# The calculation from the model grid (above) should give the same values as
# when we add columns together individually. These are two fast checks.

quick_test_tp1_085L_intercept_median <- function(model, fits) {
  model_median <- as.data.frame(model) %>%
    transmute(
      int = `(Intercept)` +
        `b[(Intercept) Study:ResearchID:TimePoint1:085L]` +
        `b[(Intercept) ResearchID:085L]`) %>%
    lapply(median) %>%
    unlist(use.names = FALSE)

  fitted_median <- fits %>%
    filter(
      Study == "TimePoint1", ResearchID == "085L", coef == "intercept") %>%
    pull(.posterior_value) %>%
    median()

  stopifnot(all.equal(model_median, fitted_median))
  TRUE
}

quick_test_tp1_085L_slope_median <- function(model, fits) {
  model_median <- as.data.frame(model) %>%
    transmute(
      int = `ot1` +
        `b[ot1 Study:ResearchID:TimePoint1:085L]` +
        `b[ot1 ResearchID:085L]`) %>%
    lapply(median) %>%
    unlist(use.names = FALSE)

  fitted_median <- fits %>%
    filter(Study == "TimePoint1", ResearchID == "085L", coef == "ot1") %>%
    pull(.posterior_value) %>%
    median()

  stopifnot(all.equal(model_median, fitted_median))
  TRUE
}

quick_test_tp1_085L_intercept_median(b, all)
quick_test_tp1_085L_slope_median(b, all)


# Now, we manually compute the fitted values by adding columns. This is the long
# way that the above technique avoided.

draws <- as.data.frame(b) %>%
  as_tibble() %>%
  # Compute the fixed effects for each study
  mutate(
    `int_TP1` = `(Intercept)`,
    `int_TP2` = `(Intercept)` + StudyTimePoint2,
    `int_TP3` = `(Intercept)` + StudyTimePoint3,
    `ot1_TP1` = ot1,
    `ot1_TP2` = ot1 + `ot1:StudyTimePoint2`,
    `ot1_TP3` = ot1 + `ot1:StudyTimePoint3`,
    `ot2_TP1` = ot2,
    `ot2_TP2` = ot2 + `ot2:StudyTimePoint2`,
    `ot2_TP3` = ot2 + `ot2:StudyTimePoint3`,
    `ot3_TP1` = ot3,
    `ot3_TP2` = ot3 + `ot3:StudyTimePoint2`,
    `ot3_TP3` = ot3 + `ot3:StudyTimePoint3`) %>%
  # Keep those values, plus the random effects
  select(
    -one_of("(Intercept)", "ot1", "ot2", "ot3"),
    -ends_with("TimePoint2"), -ends_with("TimePoint3"))

study_child_rows <- d_m %>%
  distinct(ResearchID, Study)

terms <- c("(Intercept)", "ot1", "ot2", "ot3")
terms_out <- c("int", "ot1", "ot2", "ot3")

# Look-up list for study-level fixed effects
offsets <- list(
  TimePoint1 = c("int_TP1", "ot1_TP1", "ot2_TP1", "ot3_TP1"),
  TimePoint2 = c("int_TP2", "ot1_TP2", "ot2_TP2", "ot3_TP2"),
  TimePoint3 = c("int_TP3", "ot1_TP3", "ot2_TP3", "ot3_TP3")
)

for (row_i in tjmisc::seq_along_rows(study_child_rows)) {
  study <- study_child_rows[[row_i, "Study"]]
  id <- study_child_rows[[row_i, "ResearchID"]]

  # Get names of effects that need to be summed.
  #
  # Some example random effect names to show the template are following
  #   "b[(Intercept) ResearchID:100L]"
  #   "b[ot2 ResearchID:130L]"
  #   "b[(Intercept) Study:ResearchID:TimePoint2:613L]"
  #   "b[ot2 Study:ResearchID:TimePoint1:666L]"
  fixefs <- offsets[[study]]
  ranef_child <- sprintf("b[%s ResearchID:%s]", terms, id)
  ranef_study_child <- sprintf(
    "b[%s Study:ResearchID:%s:%s]", terms, study, id)

  study_id_term <- paste0(id, "_", study, "_", terms_out)

  for (col in seq_along(study_id_term)) {
    draws[study_id_term[col]] <-
      draws[[fixefs[col]]] +
      draws[[ranef_child[col]]] +
      draws[[ranef_study_child[col]]]
  }

  draws[ranef_study_child] <- NULL
}

quick_test_tp3_010L_ot3_posterior <- function(predicted, column_summed) {
  predicted <- predicted %>%
    filter(ResearchID == "010L", Study == "TimePoint3", coef == "ot3") %>%
    pull(.posterior_value)
  summed <- column_summed[["010L_TimePoint3_ot3"]]
  stopifnot(all.equal(predicted, summed))
  TRUE
}

quick_test_tp3_010L_ot3_posterior(all, draws)

test_all_posteriors <- function(predicted, column_summed) {
  terms <- names(column_summed) %>%
    stringr::str_subset("\\d{3}L_TimePoint\\d_") %>%
    stringr::str_split_fixed("_", 3) %>%
    as.data.frame(stringsAsFactors = FALSE) %>%
    as_tibble() %>%
    set_names("ResearchID", "Study", "coef") %>%
    mutate(
      row = paste0(ResearchID, "_", Study, "_", coef),
      coef = ifelse(coef == "int", "intercept", coef))

  for (row_i in tjmisc::seq_along_rows(terms)) {
    row <- terms[row_i, ]
    samples1 <- predicted %>%
      semi_join(row, by = c("Study", "ResearchID", "coef")) %>%
      pull(.posterior_value)
    samples2 <- column_summed[[row$row]]

    stopifnot(all.equal(samples1, samples2))
  }
  TRUE
}

test_all_posteriors(all, draws)
