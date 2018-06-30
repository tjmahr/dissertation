library(brms)
library(dplyr)
source("./helpers.R")

m_tp1 <- readr::read_rds("./data/aim2-real-vs-nw-tp1.rds.gz")
m_tp2 <- readr::read_rds("./data/aim2-real-vs-nw-tp2.rds.gz")
m_tp3 <- readr::read_rds("./data/aim2-real-vs-nw-tp3.rds.gz")

d_r_nw_dis <- readr::read_rds("./data/aim2-real-vs-nw-modeled-data.rds.gz")

d_tp1 <- d_r_nw_dis %>%
  filter(Study == "TimePoint1")

d_tp2 <- d_r_nw_dis %>%
  filter(Study == "TimePoint2")

d_tp3 <- d_r_nw_dis %>%
  filter(Study == "TimePoint3")

# Sets for predictions
n_tp1_all <- d_tp1 %>%
  distinct(Study, ResearchID, Condition, Time, ot1, ot2, ot3) %>%
  mutate(Trials = 30)

n_tp2_all <- d_tp2 %>%
  distinct(Study, ResearchID, Condition, Time, ot1, ot2, ot3) %>%
  mutate(Trials = 30)

n_tp3_all <- d_tp3 %>%
  distinct(Study, ResearchID, Condition, Time, ot1, ot2, ot3) %>%
  mutate(Trials = 30)

tp1_fits <- augment_linpred(
  m_tp1, n_tp1_all, allow_new_levels = TRUE,
  re_formula = NULL, nsamples = 4000)

tp2_fits <- augment_linpred(
  m_tp2, n_tp2_all, allow_new_levels = TRUE,
  re_formula = NULL, nsamples = 4000)

tp3_fits <- augment_linpred(
  m_tp3, n_tp3_all, allow_new_levels = TRUE,
  re_formula = NULL, nsamples = 4000)


# Get distribution of averages of growth curves
tp1_dist_means <- tp1_fits %>%
  group_by(.draw, Study, Time, Condition) %>%
  summarise(
    mean_plogis = mean(plogis(.posterior_value))) %>%
  ungroup() %>%
  readr::write_rds("./data/aim2-real-vs-nw-tp1-averages.rds.gz")

tp2_dist_means <- tp2_fits %>%
  group_by(.draw, Study, Time, Condition) %>%
  summarise(
    mean_plogis = mean(plogis(.posterior_value))) %>%
  ungroup() %>%
  readr::write_rds("./data/aim2-real-vs-nw-tp2-averages.rds.gz")

tp3_dist_means <- tp3_fits %>%
  group_by(.draw, Study, Time, Condition) %>%
  summarise(
    mean_plogis = mean(plogis(.posterior_value))) %>%
  ungroup() %>%
  readr::write_rds("./data/aim2-real-vs-nw-tp3-averages.rds.gz")

# Distribution of peaks
get_peaks <- . %>%
  select(.draw, Study, ResearchID, Condition, .posterior_value) %>%
  group_by(Study, ResearchID, Condition, .draw) %>%
  top_n(5, .posterior_value) %>%
  summarise(med = median(plogis(.posterior_value))) %>%
  ungroup()  %>%
  tidyr::spread(Condition, med) %>%
  mutate(diff = nonsense - real)

tp1_peaks <- tp1_fits %>% get_peaks()
tp2_peaks <- tp2_fits %>% get_peaks()
tp3_peaks <- tp3_fits %>% get_peaks()

bind_rows(tp1_peaks, tp2_peaks, tp3_peaks) %>%
  readr::write_rds("./data/aim2-real-vs-nw-all-peaks.rds.gz")

# Here I explore ways to calculate the average fixation probability to
# account for the nonlinear effect of the log-odds -> probability
# transformation. It looks like average over proportions matches the observed
# data well.
means <- tp1_fits %>%
  group_by(Time, Condition) %>%
  summarise(
    `mean -> inv_logit` = plogis(mean(.posterior_value)),
    `median -> inv_logit` = plogis(median(.posterior_value)),
    `inv_logit -> mean` = mean(plogis(.posterior_value)),
    `inv_logit -> median` = median(plogis(.posterior_value))) %>%
  ungroup() %>%
  tidyr::gather("method", "value", `mean -> inv_logit`:`inv_logit -> median`)

empirical <- d_tp1 %>%
  mutate(prop = Target / Trials) %>%
  group_by(Time, Condition) %>%
  do(mean_se(.$prop)) %>%
  ungroup() %>%
  tidyr::crossing(method = unique(means$method))

ggplot(means) +
  aes(x = Time, color = Condition) +
  geom_ribbon(
    aes(ymin = ymin, ymax = ymax),
    data = empirical, alpha = .1) +
  geom_point(aes(y = value)) +
  facet_wrap("method") +
  labs(
    caption = "Ribbons: Observed means +/- SE. Points: Estimates.",
    y = "Probability", x = "Time [ms]",
    title = "Which central probability matches the data?")

# Here I check how the posterior mean of participant means look compared to
# observed means
dist_means <- tp1_fits %>%
  group_by(.draw, Time, Condition) %>%
  summarise(
    mean_prop = mean(plogis(.posterior_value))) %>%
  ungroup()

dist_means %>%
  tjmisc::sample_n_of(500, .draw) %>%
  ggplot() +
    aes(x = Time, color = Condition) +
    geom_ribbon(
      aes(ymin = ymin, ymax = ymax, color = NULL, group = Condition),
      data = empirical, alpha = .2) +
    geom_line(aes(y = mean_prop, group = interaction(.draw, Condition)),
              alpha = .01)
