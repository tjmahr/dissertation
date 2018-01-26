library(dplyr)
library(rstanarm)
source("./helpers.R")

b <- readr::read_rds("./data/stan_aim1_cubic_model.rds.gz")
b$stan_function <- "stan_glmer"
d_m <- b$data

# Create a minimal grid of variables used in the model's fixed effects
fixef_pred_grid <- function(model) {
  # Get a data-frame with everything on the right hand side of model formula
  data <- model.frame(model)
  f <- lme4::nobars(formula(model))
  f[[2]] <- NULL
  preds <- model.frame(f, data)

  # Find the names of continuous variables
  mm <- model.matrix(model)
  factors <- names(attr(mm, "contrasts"))
  values <- preds %>% lapply(modelr::typical)
  cont_vars <- setdiff(names(values), factors)

  levels_or_defaults <- function(xs) {
    levels(xs) %||% levels(factor(unique(xs)))
  }

  # Expand the "typical" values of factors to all levels
  values[factors] <- data[factors] %>%
    lapply(levels_or_defaults)

  # Create a model matrix with just the continuous vars and intercept
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



done <- fixef_pred_grid(b) %>%
  tidyr::crossing(Primary = 0, Others = 0, ResearchID = "DUMMY") %>%
  tristan::augment_posterior_linpred(b, ., re.form = ~ 0) %>%
  remove_intercept_effects()

ggplot(done) +
  aes(x = coef, y = .posterior_value, color = Study) +
  stat_summary(fun.data = median_hilow, position = position_dodge(-.4),
               fun.args = list(conf.int = .9)) +
  coord_flip()

# Confirm that the median of the predictions matches the model's fixed effects
# point values
done %>%
  filter(Study == "TimePoint1") %>%
  group_by(coef) %>%
  summarise(effect = median(.posterior_value)) %>%
  tibble::add_column(fixef(b)[1:4])

# Look at some predictions for individual participants
set.seed(20180126)
df <- sample_n_of(d_m, 5, ResearchID) %>%
  distinct(ResearchID)

done <- fixef_pred_grid(b) %>%
  tidyr::crossing(Primary = 0, Others = 0, ResearchID = df$ResearchID) %>%
  tristan::augment_posterior_linpred(b, .) %>%
  remove_intercept_effects()

ggplot(done) +
  aes(x = coef, y = .posterior_value, color = Study) +
  stat_summary(fun.data = median_hilow, position = position_dodge(-.4),
               fun.args = list(conf.int = .9)) +
  coord_flip() +
  facet_wrap("ResearchID")





# Extract values in batches of 10 participants
df <- d_m %>% distinct(ResearchID)
sub_groups <- df$ResearchID %>% split(seq_along(.) %% 10)
output <- list_along(sub_groups)

# Output and prediction grid for computing growth curve peaks
df_minimal <- d_m %>%
  select(Study, ResearchID, ot1, ot2, ot3) %>%
  mutate(Primary = 0, Others = 0)
output_peaks <- list_along(sub_groups)

for (sub_group_i in seq_along(sub_groups)) {
  ids <- sub_groups[[sub_group_i]]
  preds <- fixef_pred_grid(b) %>%
    tidyr::crossing(Primary = 0, Others = 0, ResearchID = ids) %>%
    tristan::augment_posterior_linpred(b, .) %>%
    remove_intercept_effects() %>%
    select(-Primary, -Others)
  output[[sub_group_i]] <- preds

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

all <- bind_rows(output) %>%
  readr::write_csv("./data/fits.csv.gz")

peaks <- bind_rows(output_peaks) %>%
  readr::write_csv("./data/peaks.csv.gz")










as.data.frame(b) %>%
  transmute(
    int = `(Intercept)` +
      `b[(Intercept) Study:ResearchID:TimePoint1:085L]` +
      `b[(Intercept) ResearchID:085L]`) %>%
  lapply(median)

all %>%
  filter(Study == "TimePoint1", ResearchID == "085L", coef == "intercept") %>%
  pull(.posterior_value) %>%
  median()

as.data.frame(b) %>%
  transmute(
    int = `ot1` +
      `b[ot1 Study:ResearchID:TimePoint1:085L]` +
      `b[ot1 ResearchID:085L]`) %>%
  lapply(median)

all %>%
  filter(Study == "TimePoint1", ResearchID == "085L", coef == "ot1") %>%
  pull(.posterior_value) %>%
  median()


# Other code to test the high-level stuff above
draws <- as.data.frame(b) %>%
  as_tibble() %>%
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
  select(
    -one_of("(Intercept)", "ot1", "ot2", "ot3"),
    -ends_with("TimePoint2"), -ends_with("TimePoint3"))

rows <- d_m %>% distinct(ResearchID, Study)

terms <- c("(Intercept)", "ot1", "ot2", "ot3")
terms_out <- c("int", "ot1", "ot2", "ot3")

offsets <- list(
  TimePoint1 = c("int_TP1", "ot1_TP1", "ot2_TP1", "ot3_TP1"),
  TimePoint2 = c("int_TP2", "ot1_TP2", "ot2_TP2", "ot3_TP2"),
  TimePoint3 = c("int_TP3", "ot1_TP3", "ot2_TP3", "ot3_TP3")
)

for (row_i in seq_len(nrow(rows))) {
  study <- rows[[row_i, "Study"]]
  id <- rows[[row_i, "ResearchID"]]

  fixefs <- offsets[[study]]
  ranef_study <- sprintf("b[%s Study:ResearchID:%s:%s]", terms, study, id)
  ranef_child <- sprintf("b[%s ResearchID:%s]", terms, id)

  study_id_term <- paste0(id, "_", study, "_", terms_out)

  for (col in seq_along(study_id_term)) {
    draws[study_id_term[col]] <-
      draws[[ranef_study[col]]] + draws[[ranef_child[col]]] +
        draws[[fixefs[col]]]
  }

  draws[ranef_study]  <- NULL
}

x <- all %>%
  filter(ResearchID == "010L", Study == "TimePoint3", coef == "ot3") %>%
  pull(.posterior_value) %>%
  sort()
all.equal((draws[["010L_TimePoint3_ot3"]] %>% sort), x)
data_frame(x, (draws[["010L_TimePoint3_ot3"]] %>% sort))

terms <- names(draws) %>%
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
  samples1 <- semi_join(all, row, by = c("Study", "ResearchID", "coef")) %>%
    pull(.posterior_value) %>%
    sort()
  samples2 <- draws[[row$row]] %>% sort()

  stopifnot(all.equal(samples1, samples2))
}
