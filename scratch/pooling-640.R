f <- function(data) {
  glm(cbind(Primary, Others) ~ (ot1 + ot2 + ot3), data, family = binomial)
}

x <- d_m %>%
  tidyr::nest(-Study, -ResearchID) %>%
  mutate(model = purrr::map(data, f),
         coef = purrr::map(model, broom::tidy))

aug_640 <- x %>%
  filter(ResearchID == "640L") %>%
  mutate(aug = purrr::map2(model, data, broom::augment,
                           type.predict = "response")) %>%
  select(-model, -data, -coef) %>%
  tidyr::unnest()

coefs <- x %>%
  select(-model, -data) %>%
  tidyr::unnest() %>%
  select(Study:estimate) %>%
  tidyr::spread(term, estimate)

ggplot(coefs) +
  aes(x = ot1) +
  geom_histogram() +
  labs(x = "Linear time estimate", y = "Count",
       caption = "Count unit: a child in a study")
# Saving 3.87 x 2.85 in image

ranks <- m %>%
  coef() %>%
  getElement("ResearchID") %>%
  tibble::rownames_to_column("ResearchID") %>%
  as_tibble() %>%
  select(ResearchID, ot1)

okay <- m %>%
  ranef() %>%
  getElement("Study:ResearchID") %>%
  tibble::rownames_to_column("ResearchID") %>%
  as_tibble() %>%
  tidyr::separate(ResearchID, c("Study", "ResearchID")) %>%
  select(Study, ResearchID, ot1_off = ot1)

ggplot(d_m %>% filter(ResearchID == "640L") %>% filter(Study == 'TimePoint2')) +
  aes(x = Time, y = Prop, ymin = Prop - PropSE, ymax = Prop + PropSE) +
  # geom_point() +
  geom_pointrange(color = "grey50") +
  geom_line(aes(y = cubic_fit, color = "pooled")) +
  geom_line(aes(y = .fitted, color = "no pooling"), aug_640 %>% filter(Study == 'TimePoint2')) +
  labs(color = "Estimate") +
  theme(legend.position = "bottom")
ggsave("scurve.png")

pooling <- left_join(okay, ranks) %>%
  rename(ot1_p = ot1) %>%
  left_join(coefs) %>%
  select(Study, ResearchID, starts_with("ot1")) %>%
  mutate(ot1_both = ot1_p + ot1_off)

ggplot(pooling) +
  aes(x = ResearchID, y = ot1, color = Study) +
  geom_point() +
  geom_path(aes(x))
  geom_path(aes(group = interaction(Study, ResearchID), ))
  geom_blank(aes(x = ot1), data = coefs) +
  geom_histogram() +
  labs(x = "Linear time estimate", y = "Count",
       caption = "Count unit: a child (effects pooled over studies)")

ggplot(pooling) +
  aes(x = ot1, y = ot1_both) +
  geom_point() +
  facet_wrap("Study")
  geom_path(aes(group = interaction(Study, ResearchID), ))
  geom_blank(aes(x = ot1), data = coefs) +
  geom_histogram() +
  labs(x = "Linear time estimate", y = "Count",
       caption = "Count unit: a child (effects pooled over studies)")



ggplot(pooling) +
  aes(x = ot1_both) +
  geom_blank(aes(x = ot1), data = coefs) +
  geom_histogram() +
  labs(x = "Linear time estimate", y = "Count",
       caption = "Count unit: a child (effects pooled over studies)")


ggplot(ranks) +
  aes(x = ot1) +
  geom_blank(data = coefs) +
  geom_histogram() +
  labs(x = "Linear time estimate", y = "Count",
       caption = "Count unit: a child (effects pooled over studies)")

ggplot(okay) +
  aes(x = ot1) +
  geom_blank(data = coefs) +
  geom_histogram() +
  labs(x = "Linear time estimate", y = "Count",
       caption = "Count unit: a child (effects pooled over studies)")

coefs %>% top_n(1, ot1)

d_m$fitted <- fitted(m)
