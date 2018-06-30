
library(brms)
?me

evt_t1 <- brm(
  scale(TimePoint3) ~ scale(TimePoint1) + me(nonsense, nonsense_sd), w_evt)


lm_evt_resid <- lm(
  TimePoint3 ~ TimePoint1, w_evt)

lm_evt_t1 <- lm(
  TimePoint3 ~ scale(TimePoint1) + nonsense, w_evt)
summary(lm_evt_t1)

# lm_evt_t1_0 <- lm(
#   TimePoint3 ~ nonsense, w_evt)
# summary(lm_evt_t1_0)

try <- marginal_effects(evt_t1, nsamples = 100, spaghetti = TRUE)
df <- try$`nonsense:nonsense_sd`
df$z <- df$estimate__ * sd(w_evt$TimePoint3, na.rm = TRUE)
full_error <- df %>% select(nonsense, TimePoint3, TimePoint1) %>% distinct() %>% mutate(nonsense_sd = .07)
no_error <- df %>% select(nonsense, TimePoint3, TimePoint1) %>% distinct() %>% mutate(nonsense_sd = .001)

full_error %>% summary
sss <- posterior_linpred(evt_t1, newdata = full_error, nsamples = 500)
try <- augment_linpred(evt_t1, full_error, nsamples = 500)
try2 <- augment_linpred(evt_t1, no_error, nsamples = 500)


p1 <- ggplot(w_evt) +
  aes(x = nonsense, y = EVT_Residualized) +
  geom_point() +
  geom_segment(
    aes(
      x = nonsense - nonsense_sd, xend = nonsense + nonsense_sd,
      y = EVT_Residualized, yend = EVT_Residualized)) +
  # geom_line(aes(y = .posterior_value * 14.56344, group = .draw), data = try, alpha = .02) +
  geom_line(aes(y = .posterior_value * 14.56344, group = .draw), data = try2, alpha = .02, color = "blue") +
  labs(title = "error = .001")

p2 <- ggplot(w_evt) +
  aes(x = nonsense, y = EVT_Residualized) +
  geom_point() +
  geom_segment(
    aes(
      x = nonsense - nonsense_sd, xend = nonsense + nonsense_sd,
      y = EVT_Residualized, yend = EVT_Residualized)) +
  geom_line(aes(y = .posterior_value * 14.56344, group = .draw), data = try, alpha = .02, color = "blue") +
  # geom_line(aes(y = .posterior_value * 14.56344, group = .draw), data = try2, alpha = .02, color = "blue") +
  labs(title = "error = .07")

library(patchwork)
p1 + p2
