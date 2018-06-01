library("mgcv")

set.seed(2)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
m1 <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

library(schoenberg)
draw(m1)
draw(m1, unconditional = TRUE)


set.seed(2)
dat <- gamSim(2, n = 4000, dist = "normal", scale = 1)
m2 <- gam(y ~ s(x, z, k = 30), data = dat$data, method = "REML")

draw(m2)

dat <- gamSim(4)
m3 <- gam(y ~ fac + s(x2, by = fac) + s(x0), data = dat)

draw(m3, scales = "fixed")
draw(m3, scales = "fixed", unconditional = TRUE)


library("mgcv")

set.seed(2)
dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
m1 <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat, method = "REML")

sm <- evaluate_smooth(m1, "s(x2)")
draw(sm)

set.seed(2)
dat <- gamSim(2, n = 4000, dist = "normal", scale = 1)
m2 <- gam(y ~ s(x, z, k = 40), data = dat$data, method = "REML")

sm <- evaluate_smooth(m2, "s(x,z)", n = 100)
draw(sm)

## now the standard error the smooth instead
draw(sm, show = "se")
?bdots


library(bdots)
data(ci)
names(ci)[1] <- "Group"
ci.1 <- subset(ci, ci$LookType == "Target")
head(ci.1)
ci.1$Subject <- factor(ci.1$Subject)
dplyr::distinct(ci.1, Group, Subject)

# Include intercepts and smooths for studies
ci.1$Group <- as.ordered(ci.1$Group)
contrasts(ci.1$Group) <- "contr.treatment"
contrasts(ci.1$Group)

bbb <- bam(
  Fixations ~ Group +
    s(Time) + s(Time, by = Group) +
    s(Time, Subject, bs = "fs", m = 1, k = 5),
  data = ci.1)

library(itsadug)
plot_smooth(bbb, view="Time", plot_all="Group", rm.ranef=TRUE)

plot_modelfit(bbb, view="Time", event=ci.1$Subject, n=12)



