fits <- readr::read_csv("./data/fits.csv.gz")
fits <- fits %>% semi_join(d_m)


# Compute Kendall's coefficient of correspondence
tidy_kendall <- . %>% unclass() %>% as.data.frame(stringsAsFactors = FALSE)

new_coef <- fits %>%
  filter(coef == "intercept") %>%
  mutate(.posterior_value = rnorm(length(.posterior_value)),
         coef = "random values")

w <- fits %>%
  bind_rows(new_coef) %>%
  tidyr::spread(Study, .posterior_value) %>%
  # group_by(.draw) %>%
  tidyr::drop_na(TimePoint1:TimePoint3) %>%
  select(-ResearchID) %>%
  tidyr::nest(TimePoint1:TimePoint3) %>%
  mutate(ws = purrr::map(data, irr::kendall) %>% purrr::map(tidy_kendall)) %>%
  select(-data) %>%
  tidyr::unnest(ws)

posterior_w <- w %>%
  select(.draw, coef, value) %>%
  tidyr::spread(coef, value) %>%
  rename(`random numbers` = `random values`) %>%
  select(-.draw)

mcmc_areas_ridges(posterior_w) + theme_bw() +
  ggtitle("Kendall's W for child-level effects") +
  labs(caption = "random numbers used to illustrate null Ws")
ggsave("w.png")
w %>%
  rename(parameter = coef) %>%
  ggplot() +
    aes(x = value) +
    geom_histogram() +
    facet_wrap("parameter", ncol = 1) +
    labs()

w2 <- fits %>%
  filter(coef == "ot1") %>%
  tidyr::spread(Study, .posterior_value) %>%
  # group_by(.draw) %>%
  tidyr::drop_na(TimePoint1:TimePoint3) %>%
  select(-ResearchID) %>%
  group_by(.draw, coef) %>%
  mutate_at(c("TimePoint1", "TimePoint2", "TimePoint3"), sample) %>%
  tidyr::nest(TimePoint1:TimePoint3) %>%
  mutate(ws = purrr::map(data, irr::kendall) %>% purrr::map(tidy_kendall)) %>%
  select(-data) %>%
  tidyr::unnest(ws)

w3 <- fits %>%
  tidyr::spread(.draw, .posterior_value) %>%
  select(-ResearchID) %>%
  tidyr::nest(-Study, -coef) %>%
  mutate(ws = purrr::map(data, irr::kendall) %>% purrr::map(tidy_kendall)) %>%
  select(-data) %>%
  tidyr::unnest(ws)

mutate(ws = purrr::map(data, ) %>% purrr::map(tidy_kendall)) %>%
  select(-data) %>%
  tidyr::unnest(ws)

hist(w2$value)


point_ests <- fits %>%
  group_by(Study, ResearchID, coef) %>%
  summarise(point = median(.posterior_value)) %>%
  ungroup() %>%
  tidyr::spread(coef, point)
