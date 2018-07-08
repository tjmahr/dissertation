library(brms)
library(dplyr)
setwd(rprojroot::find_rstudio_root_file())

source("./helpers.R")

roll_one_peak <- function(df) {
  df %>%
    group_by(.draw) %>%
    mutate(
      med = zoo::rollmedian(.posterior_value, 5, fill = "extend")) %>%
    top_n(1, med) %>%
    top_n(-1, Time) %>%
    ungroup()
}

roll_one_valley <- function(df) {
  df %>%
    group_by(.draw) %>%
    mutate(
      med = zoo::rollmedian(.posterior_value, 5, fill = "extend")) %>%
    top_n(-1, med) %>%
    top_n(-1, Time) %>%
    ungroup()
}

mp_unfam <- readr::read_rds("./data/aim2-mp-unfam.rds.gz")
d_u <- readr::read_csv("./data/aim2-mp-unfam-modeled-data.csv.gz")

d_u_fitted <- d_u %>%
  distinct(Study, ResearchID, Time, ot1, ot2, ot3) %>%
  mutate(Target = 0, Trials = 30)

d_u_to_fit <- d_u_fitted %>%
  group_by(Study, ResearchID) %>%
  split(group_indices(.))

n_peaks <- 1000

for (i in seq_along((d_u_to_fit))) {
  d_u_to_fit[[i]] %>%
    distinct(Study, ResearchID) %>%
    glue::glue_data("Group {i}/{length(d_u_to_fit)} ({Study} {ResearchID})") %>%
    message()

  d_u_to_fit[[i]] <- augment_linpred(
    mp_unfam, d_u_to_fit[[i]], allow_new_levels = TRUE,
    re_formula = NULL, nsamples = n_peaks) %>%
    select(-ot1, -ot2, -ot3, -Target, -Trials, -.observation) %>%
    roll_one_peak() %>%
    select(-.posterior_value)
}

bind_rows(d_u_to_fit) %>%
  readr::write_csv("aim2-mp-unfam-peaks.csv.gz")


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

  d_f_to_fit[[i]] <- augment_linpred(
    mp_fam, d_f_to_fit[[i]], allow_new_levels = TRUE,
    re_formula = NULL, nsamples = n_peaks) %>%
    select(-ot1, -ot2, -ot3, -Target, -Trials, -.observation) %>%
    roll_one_valley() %>%
    select(-.posterior_value)
}

bind_rows(d_f_to_fit) %>%
  readr::write_csv("aim2-mp-fam-peaks.csv.gz")

