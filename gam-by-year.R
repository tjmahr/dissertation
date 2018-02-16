library(mgcv)
library(itsadug)

## now fit the model...
phon_d$S <- factor(phon_d$Study, c("TimePoint2", "TimePoint1", "TimePoint3"))
phon_d$R <- as.factor(phon_d$ResearchID)
phon_d$SR <- interaction(phon_d$S, phon_d$R)
b <- gam(
  cbind(PhonologicalFoil, Unrelated) ~ s(Time), data = phon_d, family = binomial())
summary(b)
plot(b, pages = 1)

phon_d$elog <- lookr::empirical_logit(phon_d$PhonologicalFoil, phon_d$Unrelated)
phon_d$elog_wt <- lookr::empirical_logit_weight(phon_d$PhonologicalFoil, phon_d$Unrelated)

b1 <- gam(
  cbind(PhonologicalFoil, Unrelated) ~ S + s(Time) + s(Time, by = S), data = phon_d, family = binomial())
summary(b1)
plot(b1, pages = 1)


b2n <- gam(
  elog ~ s(Time), data = phon_d, , method = "REML")
summary(b2n)
plot(b2n, pages = 1)


itsadug::gamtabs(b2, type = "html")

b2 <- gam(
  elog ~ S + s(Time) + s(Time, by = S), data = phon_d, method = "REML")
summary(b2)
plot(b2, pages = 1)


anova(b2n, b2)

itsadug::plot_diff(
  b2,
  view = "Time",
  comp = list(S = c("TimePoint2", "TimePoint1")))

itsadug::plot_diff(
  b2,
  view = "Time",
  comp = list(S = c("TimePoint3", "TimePoint1")))

itsadug::plot_diff(
  b2,
  view = "Time",
  comp = list(S = c("TimePoint3", "TimePoint2")))

itsadug::plot_smooth(b2, view = "Time", plot_all = "S")


plot_parametric(b2, pred = list(S = levels(phon_d$S)))

phon_d$Event <- interaction(phon_d$R, phon_d$S)
plot_modelfit(b2, view = "Time", event = phon_d$Event, n = 8)

phon_d$fitted_elogit <- predict.gam(b2)

ggplot(phon_d) +
  aes(x = Time, y = elog, color = Study) +
  stat_summary()

ggplot(phon_d) +
  aes(x = Time, y = elog, color = Study) +
  stat_summary()

ggplot(phon_d) +
  aes(x = Time, y = fitted_elogit, color = Study) +
  stat_summary(aes(y = elog)) +
  stat_summary(fun.y = "mean", geom = "line") +
  labs(
    y = "empirical logit",
    caption = "Lines: GAM fit. Point-ranges: Obs. Mean +- SE")

gam.check(b1)
gam.check(b2)
gam.check(b3)

# library(rstanarm)
#
# test <- stan_gamm4(
#   cbind(PhonologicalFoil, Unrelated) ~ S + s(Time, by = S), random = NULL, data = phon_d, family = binomial(), prior = normal(0, 1))
# )



b <- bam(
  cbind(PhonologicalFoil, Unrelated) ~ S + s(Time, by = S) + s(R, bs = "re"), data = phon_d, family = binomial())
gam.vcomp(b)

b <- gamm(
  cbind(PhonologicalFoil, Unrelated) ~ s(Time, R, bs = "fs"), data = phon_d, family = binomial())
summary(b)
plot(b,pages=1)

par()
b <- gam(list(y~s(x1)+s(x2),~s(x1)+s(x2)),family=multinom(K=2))
b <- gam(list(y~s(x1)+s(x2),~s(x1)+s(x2)),family=multinom(K=2))
plot(b,pages=1)
gam.check(b)

## now a simple classification plot...
expand.grid(x1=seq(0,1,length=40),x2=seq(0,1,length=40)) -> gr
pp <- predict(b,newdata=gr,type="response")
pc <- apply(pp,1,function(x) which(max(x)==x)[1])-1
plot(gr,col=pc+3,pch=19)
