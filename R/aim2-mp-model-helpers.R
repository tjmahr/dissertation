library(brms)
library(dplyr)
setwd(rprojroot::find_rstudio_root_file())

source("./helpers.R")
n_peaks <- 1000

tidy_gcas <- function(data) {
  qtidy <- purrr::quietly(broom::tidy)
  model1 <- suppressWarnings(lm(plogis(.posterior_value) ~ ot1 + ot2 + ot3, data))
  model2 <- suppressWarnings(lm(.posterior_value ~ ot1 + ot2 + ot3, data))

  df1 <- qtidy(model1) %>%
    getElement("result") %>%
    select(term, estimate) %>%
    tidyr::spread(term, estimate) %>%
    rename(
      Prop_Intercept = `(Intercept)`,
      Prop_ot1 = ot1,
      Prop_ot2 = ot2,
      Prop_ot3 = ot3)

  df2 <- qtidy(model2) %>%
    getElement("result") %>%
    select(term, estimate) %>%
    tidyr::spread(term, estimate) %>%
    rename(
      Logit_Intercept = `(Intercept)`,
      Logit_ot1 = ot1,
      Logit_ot2 = ot2,
      Logit_ot3 = ot3)
  bind_cols(df1, df2)
}


mp_unfam <- readr::read_rds("./data/aim2-mp-unfam.rds.gz")
d_u <- readr::read_csv("./data/aim2-mp-unfam-modeled-data.csv.gz")

d_u_fitted <- d_u %>%
  distinct(Study, ResearchID, Time, ot1, ot2, ot3) %>%
  mutate(Target = 0, Trials = 30)

d_u_to_fit <- d_u_fitted %>%
  group_by(Study, ResearchID) %>%
  split(group_indices(.))

for (i in seq_along((d_u_to_fit))) {
  d_u_to_fit[[i]] %>%
    distinct(Study, ResearchID) %>%
    glue::glue_data("Group {i}/{length(d_u_to_fit)} ({Study} {ResearchID})") %>%
    message()

  rolled <- mp_unfam %>%
    augment_linpred(
      d_u_to_fit[[i]],
      allow_new_levels = TRUE,
      re_formula = NULL,
      nsamples = n_peaks) %>%
    select(-Target, -Trials, -.observation) %>%
    group_by(.draw) %>%
    mutate(
      med = zoo::rollmedian(.posterior_value, 5, fill = "extend")) %>%
    ungroup()

    minimum <- rolled %>%
      group_by(.draw) %>%
      top_n(-1, med) %>%
      top_n(-1, Time) %>%
      ungroup() %>%
      mutate(Valley_Prop = plogis(med)) %>%
      rename(Valley_Time = Time, Valley_Logit = med) %>%
      select(.draw, Study, ResearchID, starts_with("Valley"))

    peak <- rolled %>%
      group_by(.draw) %>%
      top_n(1, med) %>%
      top_n(-1, Time) %>%
      ungroup() %>%
      mutate(Peak_Prop = plogis(med)) %>%
      rename(Peak_Time = Time, Peak_Logit = med) %>%
      select(.draw, Study, ResearchID, starts_with("Peak"))

    broomed <- rolled %>%
      tidyr::nest(-.draw) %>%
      mutate(
        Prop = data %>% purrr::map(tidy_gcas)) %>%
      select(-data) %>%
      tidyr::unnest(Prop)

    rise_after_min <- rolled %>%
      left_join(minimum,  by = c(".draw", "Study", "ResearchID")) %>%
      group_by(.draw) %>%
      filter(Valley_Time <= Time) %>%
      top_n(1, med) %>%
      top_n(-1, Time) %>%
      ungroup() %>%
      mutate(
        PeakAfterValley_Logit = med,
        PeakAfterValley_Prop = plogis(med),
        RiseAfterValley_Logit = PeakAfterValley_Logit - Valley_Logit,
        RiseAfterValley_Prop = PeakAfterValley_Prop - Valley_Prop) %>%
      select(
        .draw, Study, ResearchID, starts_with("Valley"),
        starts_with("PeakAfter"), starts_with("RiseAfter"))

    combined <- rise_after_min %>%
      left_join(peak, by = c(".draw", "Study", "ResearchID")) %>%
      left_join(broomed, by = ".draw")

    d_u_to_fit[[i]] <- combined
}

bind_rows(d_u_to_fit) %>%
  readr::write_csv("./data/aim2-mp-unfam-peaks.csv.gz")

rm(d_u_to_fit)
rm(d_u)
rm(d_u_fitted)
rm(mp_unfam)






d_f <- readr::read_csv("./data/aim2-mp-fam-modeled-data.csv.gz")
mp_fam <- readr::read_rds("data/aim2-mp-fam.rds.gz")
d_f_fitted <- d_f %>%
  distinct(Study, ResearchID, Time, ot1, ot2, ot3) %>%
  mutate(Target = 0, Trials = 30)

d_f_to_fit <- d_f_fitted %>%
  group_by(Study, ResearchID) %>%
  split(group_indices(.))

n_peaks <- 1000
for (i in seq_along((d_f_to_fit))) {
  d_f_to_fit[[i]] %>%
    distinct(Study, ResearchID) %>%
    glue::glue_data("Group {i}/{length(d_f_to_fit)} ({Study} {ResearchID})") %>%
    message()

  rolled <- mp_fam %>%
    augment_linpred(
      d_f_to_fit[[i]],
      allow_new_levels = TRUE,
      re_formula = NULL,
      nsamples = n_peaks) %>%
    select(-Target, -Trials, -.observation) %>%
    group_by(.draw) %>%
    mutate(
      med = zoo::rollmedian(.posterior_value, 5, fill = "extend")) %>%
    ungroup()

  minimum <- rolled %>%
    group_by(.draw) %>%
    top_n(-1, med) %>%
    top_n(-1, Time) %>%
    ungroup() %>%
    mutate(Valley_Prop = plogis(med)) %>%
    rename(Valley_Time = Time, Valley_Logit = med) %>%
    select(.draw, Study, ResearchID, starts_with("Valley"))

  peak <- rolled %>%
    group_by(.draw) %>%
    top_n(1, med) %>%
    top_n(-1, Time) %>%
    ungroup() %>%
    mutate(Peak_Prop = plogis(med)) %>%
    rename(Peak_Time = Time, Peak_Logit = med) %>%
    select(.draw, Study, ResearchID, starts_with("Peak"))

  broomed <- rolled %>%
    tidyr::nest(-.draw) %>%
    mutate(
      Prop = data %>% purrr::map(tidy_gcas)) %>%
    select(-data) %>%
    tidyr::unnest(Prop)

  rise_after_min <- rolled %>%
    left_join(minimum,  by = c(".draw", "Study", "ResearchID")) %>%
    group_by(.draw) %>%
    filter(Valley_Time <= Time) %>%
    top_n(1, med) %>%
    top_n(-1, Time) %>%
    ungroup() %>%
    mutate(
      PeakAfterValley_Logit = med,
      PeakAfterValley_Prop = plogis(med),
      RiseAfterValley_Logit = PeakAfterValley_Logit - Valley_Logit,
      RiseAfterValley_Prop = PeakAfterValley_Prop - Valley_Prop) %>%
    select(
      .draw, Study, ResearchID, starts_with("Valley"),
      starts_with("PeakAfter"), starts_with("RiseAfter"))

  combined <- rise_after_min %>%
    left_join(peak, by = c(".draw", "Study", "ResearchID")) %>%
    left_join(broomed, by = ".draw")

  d_f_to_fit[[i]] <- combined
}

bind_rows(d_f_to_fit) %>%
  readr::write_csv("./data/aim2-mp-fam-peaks.csv.gz")

