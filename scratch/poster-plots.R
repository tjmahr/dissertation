library(extrafont)
library(ggplot2)



#
# if (!exists("fits")) {
#   fits <- readr::read_csv("./data/aim1-gca-features.csv.gz")
# }
#
# scores <- readr::read_csv("./data-raw/test_scores.csv") %>%
#   select(
#     Study, ResearchID, Age, EVT_GSV, EVT_Standard, PPVT_GSV, PPVT_Standard)
#
# fits
# scores %>%
#   semi_join(fits) %>%
#   group_by(Study) %>%
#   summarise(n = n(), mean(Age), sd(Age), min(Age), max(Age))
#
# scores %>%
#   semi_join(fits) %>%
#   group_by(Study) %>%
#   summarise(n = n(), mean(EVT_Standard, na.rm = TRUE),
#             sd(EVT_Standard, na.rm = TRUE))
#
#
#
#
#
#
#
#
#
#
#
#
#
#   t1_poly <- lm(Prop ~ poly(Time, 3), data = t1_fam)
#
#   poly_basis <- polypoly::poly_melt(poly(t1_fam$Time, 3)) %>%
#     mutate(observation = as.numeric(observation)) %>%
#     left_join(
#       data.frame(Time = times, observation = seq_along(times)),
#       by = "observation")
#
#   p1_poly <- ggplot(poly_basis) +
#     aes(x = Time, y = value) +
#     geom_line(aes(color = degree)) +
#     # ylim(c(-2, 2)) +
#     guides(color = FALSE) +
#     ggtitle("Basis functions (time features)") +
#     labs(
#       x = constants$x_time,
#       y = NULL) +
#     theme_grey(base_size = 9)
#
#   poly_weighted <- (poly(t1_fam$Time, 3) %*% diag(coef(t1_poly)[-1])) %>%
#     polypoly::poly_melt() %>%
#     mutate(observation = as.numeric(observation)) %>%
#     left_join(
#       data.frame(Time = times, observation = seq_along(times)),
#       by = "observation")
#
#   p2_poly <- ggplot(poly_weighted) +
#     aes(x = Time, y = value) +
#     geom_line(aes(color = factor(degree))) +
#     stat_summary(
#       fun.y = sum,
#       color = constants$col_blue_highlight,
#       geom = "line",
#       size = 1.25) +
#     ylim(c(-.2, .2)) +
#     guides(color = FALSE) +
#     ggtitle("Weighted basis functions") +
#     labs(
#       x = constants$x_time,
#       y = NULL) +
#     theme_grey(base_size = 9)
#
#   p3_poly <- cowplot::plot_grid(p1_poly, p2_poly)
#
#   p3 <- cowplot::plot_grid(p1, p2)
#   print(p3)
#
#
#
#
#
#
#
#
#
#
#
#
#
#


