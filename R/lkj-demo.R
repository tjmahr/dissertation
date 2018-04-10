library(rstanarm)
library(dplyr)

d <- lme4::sleepstudy

lkj1 <- stan_glmer(
  Reaction ~ 1 + Days + (Days | Subject),
  prior = normal(0, 1),
  prior_covariance = decov(1, 1, 1, 1),
  data = d,
  prior_PD = TRUE)

lkj2 <- stan_glmer(
  Reaction ~ 1 + Days + (Days | Subject),
  prior = normal(0, 1),
  prior_covariance = decov(2, 1, 1, 1),
  data = d,
  prior_PD = TRUE)

big_dumb_model1 <- tristan::draw_var_corr(lkj1, nsamples = 4000)
big_dumb_model2 <- tristan::draw_var_corr(lkj2, nsamples = 4000)

correlations <- bind_rows(
  big_dumb_model1 %>% mutate(Model = "LKJ(1)"),
  big_dumb_model2 %>% mutate(Model = "LKJ(2)")) %>%
  filter(!is.na(var2))

readr::write_csv(correlations, "./data/aim1-lkj-prior-demo.csv.gz")
