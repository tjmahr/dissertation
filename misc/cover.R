# data <- b2r %>%
#   get_predictions(
#     cond = list(
#       Time = unique(phon_d$Time),
#       S2 = unique(phon_d$S2)),
#     rm.ranef = TRUE,
#     print.summary = FALSE) %>%
#   left_join(recode_studies)

# This is just a dput() of the plotting dataframe
data <- structure(list(S2 = c("TimePoint1", "TimePoint2", "TimePoint3",
                              "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                              "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                              "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                              "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                              "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                              "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                              "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                              "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                              "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                              "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                              "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                              "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                              "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                              "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                              "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                              "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                              "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                              "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3"
), Time = c(0, 0, 0, 50, 50, 50, 100, 100, 100, 150, 150, 150,
            200, 200, 200, 250, 250, 250, 300, 300, 300, 350, 350, 350, 400,
            400, 400, 450, 450, 450, 500, 500, 500, 550, 550, 550, 600, 600,
            600, 650, 650, 650, 700, 700, 700, 750, 750, 750, 800, 800, 800,
            850, 850, 850, 900, 900, 900, 950, 950, 950, 1000, 1000, 1000,
            1050, 1050, 1050, 1100, 1100, 1100, 1150, 1150, 1150, 1200, 1200,
            1200, 1250, 1250, 1250, 1300, 1300, 1300, 1350, 1350, 1350, 1400,
            1400, 1400, 1450, 1450, 1450, 1500, 1500, 1500), R = structure(c(1L,
                                                                             1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                                                                             1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                                                                             1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                                                                             1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                                                                             1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                                                                             1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L), .Label = "001L", class = "factor"),
fit = c(0.126033765281746, 0.109805069127576, 0.164119732860795,
        0.12136629728668, 0.111147943051205, 0.171890168321606, 0.120832993062407,
        0.114440549225345, 0.181610345529523, 0.127518561126021,
        0.121210318156037, 0.194807712337172, 0.141224947124638,
        0.131661522281435, 0.211686569206929, 0.158113100712573,
        0.144707455426222, 0.231160250871027, 0.17271443829314, 0.159064980672629,
        0.251945675616667, 0.180968137036626, 0.17463729913106, 0.273946111670212,
        0.182506512919006, 0.193230641583463, 0.298967860427636,
        0.180938627696053, 0.218003693997264, 0.330169668326582,
        0.182035988246961, 0.251756465568004, 0.37035158036862, 0.190824541157803,
        0.294843475283906, 0.419868117408373, 0.209046596252701,
        0.343776029180585, 0.475230554078275, 0.234115256799454,
        0.391310586085564, 0.529195295674331, 0.259850733280812,
        0.428147324354351, 0.572462462223168, 0.278488404821596,
        0.445629870001749, 0.596375632979448, 0.283076947566953,
        0.43839942917326, 0.595575987718782, 0.269493490482443, 0.405999804253887,
        0.569607321183446, 0.237650046021265, 0.352894327765794,
        0.522932966617712, 0.191754327199706, 0.286995126429536,
        0.46346504599334, 0.139598973027683, 0.217329132858083, 0.400230470339967,
        0.0908987573788225, 0.151681092539068, 0.341013941925931,
        0.0548698227150554, 0.0949337384029335, 0.290698131631206,
        0.0376024230053109, 0.0484820249128151, 0.250677921879751,
        0.0401283701013085, 0.0107019553377102, 0.219329245958862,
        0.0581022412351336, -0.0218522582178748, 0.193206260431107,
        0.0835010035280494, -0.0529960846961832, 0.168493465561882,
        0.107833552858068, -0.0856688262321842, 0.142251559315783,
        0.125495348896622, -0.121226490227061, 0.113124565268329,
        0.135622905933178, -0.159417993375594, 0.0813636207335622,
        0.141330022179701, -0.199000527601281, 0.0482115943896256
), CI = c(0.155098051256206, 0.148363560846178, 0.148723572550525,
          0.142310692977915, 0.139532339314972, 0.139881062054375,
          0.137846345046914, 0.135826141074977, 0.136151563660206,
          0.136287111470943, 0.133967825152273, 0.134266499400443,
          0.134746205600274, 0.132437067779582, 0.132709536705538,
          0.134689033078847, 0.13227362781727, 0.132518807880127, 0.136383762050393,
          0.133561480811855, 0.133779153533644, 0.137929034131637,
          0.134885951683192, 0.135078948296266, 0.138657240499929,
          0.135577308775072, 0.135749379666619, 0.138924570914388,
          0.135722779666328, 0.135877321832001, 0.138397706324643,
          0.135154930882777, 0.135295348869765, 0.137202926042549,
          0.134097413791601, 0.134226749974397, 0.136487667325231,
          0.133397089124467, 0.133517589331665, 0.13646616069923, 0.133241049412398,
          0.133354906957019, 0.136336997040443, 0.133110042120337,
          0.133219948679564, 0.136152860603018, 0.132986932094934,
          0.133095586682503, 0.136336997040445, 0.133110042120337,
          0.133219948679565, 0.136466160699234, 0.1332410494124, 0.133354906957022,
          0.136487667325236, 0.13339708912447, 0.133517589331668, 0.137202926042547,
          0.134097413791598, 0.134226749974394, 0.13839770632463, 0.135154930882766,
          0.135295348869753, 0.138924570914375, 0.135722779666316,
          0.135877321831989, 0.13865724049993, 0.135577308775073, 0.13574937966662,
          0.137929034131658, 0.134885951683209, 0.135078948296284,
          0.136383762050417, 0.133561480811876, 0.133779153533665,
          0.134689033078856, 0.132273627817278, 0.132518807880135,
          0.134746205600264, 0.132437067779574, 0.13270953670553, 0.136287111470928,
          0.13396782515226, 0.13426649940043, 0.137846345046906, 0.135826141074972,
          0.136151563660201, 0.142310692977915, 0.139532339314974,
          0.139881062054378, 0.155098051256203, 0.148363560846179,
          0.148723572550527), rm.ranef = c("s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)", "s(Time,R)",
                                           "s(Time,R)"), S = c("TimePoint1", "TimePoint2", "TimePoint3",
                                                               "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                               "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                               "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                               "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                               "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                               "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                               "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                               "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                               "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                               "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                               "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                               "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                               "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                               "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                               "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                               "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                               "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                               "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3"
                                           ), Study = c("TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                        "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                        "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                        "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                        "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                        "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                        "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                        "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                        "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                        "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                        "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                        "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                        "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                        "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                        "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                        "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1",
                                                        "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3",
                                                        "TimePoint1", "TimePoint2", "TimePoint3", "TimePoint1", "TimePoint2",
                                                        "TimePoint3", "TimePoint1", "TimePoint2", "TimePoint3"),
Age = c("Age 3", "Age 4", "Age 5", "Age 3", "Age 4", "Age 5",
        "Age 3", "Age 4", "Age 5", "Age 3", "Age 4", "Age 5", "Age 3",
        "Age 4", "Age 5", "Age 3", "Age 4", "Age 5", "Age 3", "Age 4",
        "Age 5", "Age 3", "Age 4", "Age 5", "Age 3", "Age 4", "Age 5",
        "Age 3", "Age 4", "Age 5", "Age 3", "Age 4", "Age 5", "Age 3",
        "Age 4", "Age 5", "Age 3", "Age 4", "Age 5", "Age 3", "Age 4",
        "Age 5", "Age 3", "Age 4", "Age 5", "Age 3", "Age 4", "Age 5",
        "Age 3", "Age 4", "Age 5", "Age 3", "Age 4", "Age 5", "Age 3",
        "Age 4", "Age 5", "Age 3", "Age 4", "Age 5", "Age 3", "Age 4",
        "Age 5", "Age 3", "Age 4", "Age 5", "Age 3", "Age 4", "Age 5",
        "Age 3", "Age 4", "Age 5", "Age 3", "Age 4", "Age 5", "Age 3",
        "Age 4", "Age 5", "Age 3", "Age 4", "Age 5", "Age 3", "Age 4",
        "Age 5", "Age 3", "Age 4", "Age 5", "Age 3", "Age 4", "Age 5",
        "Age 3", "Age 4", "Age 5")), class = "data.frame", row.names = c(NA,
                                                                         -93L))

library(dplyr)
library(ggplot2)

x_smooth <- seq(from = -100, to = 1600, by = 20)
y_smooth <- seq(-.40, .90, length.out = 80)

xs <- seq(0, 1500, by = 250)
ys <- c(-.25, 0, .25, .5, .75)

x_grid <- expand.grid(Time = x_smooth, fit = ys, Age = NA)
y_grid <- expand.grid(Time = xs, fit = y_smooth, Age = NA)

rect <- as.data.frame(rbind(
  cbind(fit = min(y_smooth), Time = x_smooth),
  cbind(fit = y_smooth, Time = max(x_smooth)),
  cbind(fit = max(y_smooth), Time = rev(x_smooth)),
  cbind(fit = rev(y_smooth), Time = min(x_smooth))))

ggplot(data) +
  aes(x = Time, y = fit, fill = Age) +

  # background
  geom_polygon(
    data = rect,
    fill = "#eee8d5",
    alpha = .25,
    position = position_jitter(height = .005, width = 8)) +
  geom_polygon(
    data = rect,
    fill = "#eee8d5",
    alpha = .25,
    position = position_jitter(height = .004, width = 4)) +
  geom_polygon(
    data = rect,
    fill = "#eee8d5",
    alpha = .25,
    position = position_jitter(height = .006, width = 8)) +
  geom_polygon(
    data = rect,
    fill = "#eee8d5",
    alpha = .25,
    position = position_jitter(height = .005, width = 4)) +

  # x grid
  geom_line(
    aes(group = fit),
    data = x_grid,
    position = position_jitter(height = .002, width = .05),
    color = "#fdf6e3",
    alpha = .3) +
  geom_line(
    aes(group = fit),
    data = x_grid,
    position = position_jitter(height = .002, width = .05),
    color = "#fdf6e3",
    alpha = .3) +
  geom_line(
    aes(group = fit),
    data = x_grid,
    position = position_jitter(height = .004, width = .05),
    color = "#fdf6e3",
    alpha = .3) +
  geom_line(
    aes(group = fit),
    data = x_grid,
    position = position_jitter(height = .006, width = .01),
    color = "#fdf6e3",
    alpha = .3) +
  geom_line(
    aes(group = fit),
    data = x_grid,
    position = position_jitter(height = .002, width = .05),
    color = "#fdf6e3",
    alpha = .3) +
  geom_line(
    aes(group = fit),
    data = x_grid,
    position = position_jitter(height = .002, width = .05),
    color = "#fdf6e3",
    alpha = .3) +
  geom_line(
    aes(group = fit),
    data = x_grid,
    position = position_jitter(height = .004, width = .05),
    color = "#fdf6e3",
    alpha = .3) +
  geom_line(
    aes(group = fit),
    data = x_grid,
    position = position_jitter(height = .006, width = .01),
    color = "#fdf6e3",
    alpha = .3) +

  # y grid
  geom_line(
    aes(group = Time),
    data = y_grid,
    position = position_jitter(height = .002, width = 4),
    color = "#fdf6e3", alpha = .3) +
  geom_line(
    aes(group = Time),
    data = y_grid,
    position = position_jitter(height = .002, width = 6),
    color = "#fdf6e3", alpha = .3) +
  geom_line(
    aes(group = Time),
    data = y_grid,
    position = position_jitter(height = .004, width = 8),
    color = "#fdf6e3", alpha = .3) +
  geom_line(
    aes(group = Time),
    data = y_grid,
    position = position_jitter(height = .006, width = 4),
    color = "#fdf6e3", alpha = .3) +
  geom_line(
    aes(group = Time),
    data = y_grid,
    position = position_jitter(height = .002, width = 4),
    color = "#fdf6e3", alpha = .3) +
  geom_line(
    aes(group = Time),
    data = y_grid,
    position = position_jitter(height = .002, width = 6),
    color = "#fdf6e3", alpha = .3) +
  geom_line(
    aes(group = Time),
    data = y_grid,
    position = position_jitter(height = .004, width = 8),
    color = "#fdf6e3", alpha = .3) +
  geom_line(
    aes(group = Time),
    data = y_grid,
    position = position_jitter(height = .006, width = 4),
    color = "#fdf6e3", alpha = .3) +

  # ribbons
  geom_ribbon(
    aes(ymin = fit - CI, ymax = fit + CI),
    alpha = .07,
    position = position_jitter(width = 10)) +
  geom_ribbon(
    aes(ymin = fit - CI, ymax = fit + CI),
    alpha = .07,
    position = position_jitter(height = .01)) +
  geom_ribbon(
    aes(ymin = fit - CI, ymax = fit + CI),
    alpha = .07,
    position = position_jitter(height = .01, width = 10)) +

  # lines
  geom_line(
    aes(color = Age),
    alpha = .1,
    position = position_jitter(height = .01)) +
  geom_line(
    aes(color = Age),
    alpha = .1,
    position = position_jitter(width = 4)) +
  geom_line(
    aes(color = Age),
    alpha = .2,
    position = position_jitter(height = .01, width = 4)) +
  geom_line(
    aes(color = Age),
    alpha = .1,
    position = position_jitter(height = .01)) +
  geom_line(
    aes(color = Age),
    alpha = .1,
    position = position_jitter(width = 4)) +
  geom_line(
    aes(color = Age),
    alpha = .2,
    position = position_jitter(height = .01, width = 4)) +
  geom_line(
    aes(color = Age),
    alpha = .1,
    position = position_jitter(height = .01)) +
  geom_line(
    aes(color = Age),
    alpha = .1,
    position = position_jitter(width = 4)) +
  geom_line(
    aes(color = Age),
    alpha = .2,
    position = position_jitter(height = .01, width = 4)) +

  # themes
  coord_cartesian(xlim = c(-125, 1625), ylim = c(-.42, .92), expand = FALSE) +
  guides(color = FALSE, fill = FALSE) +
  ggthemes::theme_solarized_2() +
  ggthemes::scale_color_solarized("green") +
  ggthemes::scale_fill_solarized("green") +
  theme(
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    panel.background = element_rect(fill = NA))

ggsave("./assets/cover.png", last_plot(), width = 5, height = 5)
