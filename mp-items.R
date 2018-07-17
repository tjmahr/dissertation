library(dplyr)
library(littlelisteners)
library(ggplot2)
d_raw <- readr::read_csv("./data/aim2-model-ready.csv.gz") %>%
  select(-starts_with("ot"))
# filter(!is.na(Bias_Fam)) %>%
# filter(0 <= Time) %>%
# %>%
#   polypoly::poly_add_columns(
#     Time, degree = 3, scale_width = 1, prefix = "ot")


items <- tribble(
  ~WordGroup, ~Condition, ~Form,
  "cake", "real", "cake",
  "cake", "MP", "gake",
  "duck", "real", "duck",
  "duck", "MP", "guck",
  "girl", "real", "girl",
  "girl", "MP", "dirl",
  "rice", "real", "rice",
  "rice", "MP", "wice",
  "shoes", "real", "shoes",
  "shoes", "MP", "suze",
  "soup", "real", "soup",
  "soup", "MP", "shoup",
  "dog", "real", "dog",
  "dog", "MP", "tog"
)

d_raw_mp <- d_raw %>%
  filter(Condition == "MP")

d <- readr::read_csv("./data/aim2-screened.csv.gz")



# Aggregate looks to target
resp_def <- create_response_def(
  primary = "Target",
  others = "Distractor",
  elsewhere = "tracked",
  missing = NA)

raw_data <- d %>%
  aggregate_looks(
    resp_def, Study + Age + Bias_Fam + WordGroup + Condition + Time ~ GazeByImageAOI)

both_raw_data <- d %>%
  aggregate_looks(
    resp_def, Study + Age + WordGroup + Condition + Time ~ GazeByImageAOI)

d_trim <- d %>%
  distinct(Time) %>%
  littlelisteners::trim_to_bin_width(3, time_var = Time, 0, 1) %>%
  littlelisteners::assign_bins(3, Time) %>%
  group_by(.bin) %>%
  mutate(BinTime = round(min(Time), -1)) %>%
  ungroup() %>%
  inner_join(d, .) %>%
  aggregate_looks(
    resp_def, Study + Age + Bias_Fam + WordGroup + Condition + BinTime ~ GazeByImageAOI)

d_trim <- d_trim %>%
  rename(Time = BinTime)

both_d_trim <- d %>%
  distinct(Time) %>%
  littlelisteners::trim_to_bin_width(3, time_var = Time, 0, 1) %>%
  littlelisteners::assign_bins(3, Time) %>%
  group_by(.bin) %>%
  mutate(BinTime = round(min(Time), -1)) %>%
  ungroup() %>%
  inner_join(d, .) %>%
  aggregate_looks(
    resp_def, Study + Age + WordGroup + Condition + BinTime ~ GazeByImageAOI)

both_d_trim <- both_d_trim %>%
  rename(Time = BinTime)

pairs <- items %>%
  tidyr::spread(Condition, Form) %>%
  mutate(pair = sprintf("%s vs %s", real, MP))

d_trim %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Unfamiliar", Age == "Age 5") %>%
  filter(Time >= 0) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = Condition) +
    geom_hline(yintercept = .5, color = "white", size = 2) +
    geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
    facet_wrap("pair") +
    labs(title = "Age 5 mispronunciation effects",
         subtitle = "unfamiliar initial")

raw_data %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Unfamiliar", Age == "Age 4") %>%
  filter(Time >= 0) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = Condition) +
    geom_hline(yintercept = .5, color = "white", size = 2) +
    geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
    facet_wrap("pair") +
    labs(title = "Age 4 mispronunciation effects",
         subtitle = "unfamiliar initial")


raw_data %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Unfamiliar", Age == "Age 3") %>%
  filter(Time >= 0) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = Condition) +
    geom_hline(yintercept = .5, color = "white", size = 2) +
    geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
    facet_wrap("pair") +
    labs(title = "Age 3 mispronunciation effects",
         subtitle = "unfamiliar initial")

d_trim %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Unfamiliar") %>%
  filter(Time >= 0) %>%
  mutate(AgeNum = stringr::str_extract(Age, "\\d")) %>%
  group_by(Condition, Age) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = Condition) +
    geom_hline(yintercept = .5, color = "white", size = 2) +
    # geom_text(aes(group = .group, label = AgeNum)) +
    geom_point(aes(group = .group, shape = Age)) +
    facet_wrap("pair") +
    labs(title = "Mispronunciation effects",
         subtitle = "unfamiliar initial")

d_trim %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Unfamiliar") %>%
  filter(Time >= 300) %>%
  mutate(AgeNum = stringr::str_extract(Age, "\\d")) %>%
  group_by(Condition, Age, WordGroup) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = Condition) +
    geom_hline(yintercept = .5, color = "white", size = 2) +
    # geom_text(aes(group = .group, label = AgeNum)) +
    geom_line(aes(group = .group)) +
    facet_grid(~ Age)

d_trim %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Unfamiliar") %>%
  filter(Time >= 300) %>%
  mutate(
    AgeNum = stringr::str_extract(Age, "\\d"),
    SuperCondition = paste0(Study, Condition, sep = "_")) %>%
  group_by(SuperCondition, Condition, Age, WordGroup) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = SuperCondition) +
    geom_hline(yintercept = .5, color = "white", size = 2) +
    # geom_text(aes(group = .group, label = AgeNum)) +
    geom_line(aes(group = .group), size = 1) +
    facet_wrap("pair") +
    scale_color_manual(
      values = c("#440154FF", "#44015444", "#35608DFF",  "#35608D44", "#22A884FF",  "#22A88444"))

d_trim %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Familiar") %>%
  filter(Time >= 300) %>%
  mutate(
    AgeNum = stringr::str_extract(Age, "\\d"),
    SuperCondition = paste0(Study, Condition, sep = "_")) %>%
  group_by(SuperCondition, Condition, Age, WordGroup) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = SuperCondition) +
    geom_hline(yintercept = .5, color = "white", size = 2) +
    # geom_text(aes(group = .group, label = AgeNum)) +
    geom_line(aes(group = .group), size = 1) +
    facet_wrap("pair") +
    scale_color_manual(
      values = c("#440154FF", "#44015444", "#35608DFF",  "#35608D44", "#22A884FF",  "#22A88444"))

d_trim %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Unfamiliar") %>%
  filter(Time >= 300) %>%
  mutate(
    AgeNum = stringr::str_extract(Age, "\\d"),
    SuperCondition = paste0(Study, Condition, sep = "_")) %>%
  group_by(SuperCondition, Condition, Age, WordGroup) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = SuperCondition) +
    geom_hline(yintercept = .5, color = "white", size = 2) +
    # geom_text(aes(group = .group, label = AgeNum)) +
    geom_line(aes(group = .group), size = 1) +
  facet_grid(~ Age) +
  scale_color_manual(
      values = c("#440154FF", "#44015444", "#35608DFF",  "#35608D44", "#22A884FF",  "#22A88444")) +
  guides(color = FALSE)


d_trim %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", !is.na(Bias_Fam)) %>%
  filter(Time >= 300) %>%
  mutate(
    AgeNum = stringr::str_extract(Age, "\\d"),
    SuperCondition = paste0(Study, Condition, sep = "_")) %>%
  group_by(SuperCondition, Condition, Age, WordGroup) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = SuperCondition) +
    geom_hline(yintercept = .5, color = "white", size = 2) +
    # geom_text(aes(group = .group, label = AgeNum)) +
    geom_line(aes(group = .group), size = 1) +
  facet_grid(Bias_Fam ~ Age) +
  scale_color_manual(
      values = c("#440154FF", "#44015444", "#35608DFF",  "#35608D44", "#22A884FF",  "#22A88444")) +
  guides(color = FALSE)














both_d_trim %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense") %>%
  filter(Time >= 300) %>%
  mutate(
    AgeNum = stringr::str_extract(Age, "\\d"),
    SuperCondition = paste0(Study, Condition, sep = "_")) %>%
  group_by(SuperCondition, Condition, Age, WordGroup) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = SuperCondition) +
    geom_hline(yintercept = .5, color = "white", size = 2) +
    # geom_text(aes(group = .group, label = AgeNum)) +
    geom_line(aes(group = .group), size = 1) +
    facet_wrap("pair") +
    scale_color_manual(
      values = c("#440154FF", "#44015444", "#35608DFF",  "#35608D44", "#22A884FF",  "#22A88444"))



# raw_data %>%
#   left_join(pairs) %>%
#   filter(Condition != "nonsense", Bias_Fam == "Unfamiliar") %>%
#   filter(Time >= 0) %>%
#   ggplot() +
#     aes(x = Time, y = Prop, color = Condition) +
#     geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
#     facet_grid(pair ~ Age) +
#     labs(title = "Mispronunciation effects")

raw_data %>%
  left_join(pairs) %>%
  select(-(Distractor:Looks), -(PropSE:real)) %>%
  tidyr::spread(Condition, Prop) %>%
  mutate(diff = real - MP) %>%
  filter(Time >= 0, Time <= 1505, Bias_Fam == "Unfamiliar") %>%
  ggplot() +
    aes(x = Time, y = diff, color = Age) +
    geom_hline(yintercept = 0, color = "white", size = 2) +
    geom_line() +
    facet_wrap("pair") +
    labs(
      title = "Mispronunciation effects",
      y = "Real word - mispronunciation",
      subtitle = "unfamiliar initial")












raw_data %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Familiar", Age == "Age 5") %>%
  filter(Time >= 0) %>%
  ggplot() +
  aes(x = Time, y = Prop, color = Condition) +
  geom_hline(yintercept = .5, color = "white", size = 2) +
  geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
  facet_wrap("pair") +
  labs(title = "Age 5 mispronunciation effects",
       subtitle = "familiar initial")

raw_data %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Familiar", Age == "Age 4") %>%
  filter(Time >= 0) %>%
  ggplot() +
  aes(x = Time, y = Prop, color = Condition) +
  geom_hline(yintercept = .5, color = "white", size = 2) +
  geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
  facet_wrap("pair") +
  labs(title = "Age 4 mispronunciation effects",
       subtitle = "familiar initial")


raw_data %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Familiar", Age == "Age 3") %>%
  filter(Time >= 0) %>%
  ggplot() +
  aes(x = Time, y = Prop, color = Condition) +
  geom_hline(yintercept = .5, color = "white", size = 2) +
  geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
  facet_wrap("pair") +
  labs(
    title = "Age 3 mispronunciation effects",
    subtitle = "familiar initial")


raw_data %>%
  left_join(pairs) %>%
  select(-(Distractor:Looks), -(PropSE:real)) %>%
  tidyr::spread(Condition, Prop) %>%
  mutate(diff = real - MP) %>%
  filter(Time >= 0, Time <= 1505, Bias_Fam == "Familiar") %>%
  ggplot() +
  aes(x = Time, y = diff, color = Age) +
  geom_hline(yintercept = 0, color = "white", size = 2) +
  geom_line() +
  facet_wrap("pair") +
  labs(
    title = "Mispronunciation effects",
    subtitle = "familiar initial",
    y = "Real word - mispronunciation")











both_raw_data %>%
  left_join(pairs) %>%
  select(-(Distractor:Looks), -(PropSE:real)) %>%
  tidyr::spread(Condition, Prop) %>%
  mutate(diff = real - MP) %>%
  filter(Time >= 0, Time <= 1505) %>%
  ggplot() +
  aes(x = Time, y = diff, color = Age) +
  geom_hline(yintercept = 0, color = "white", size = 2) +
  geom_line() +
  facet_wrap("pair") +
  labs(
    title = "Mispronunciation effects",
    subtitle = "all trials",
    y = "Real word - mispronunciation")

both_raw_data %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense",Age == "Age 5") %>%
  filter(Time >= 0) %>%
  ggplot() +
  aes(x = Time, y = Prop, color = Condition) +
  geom_hline(yintercept = .5, color = "white", size = 2) +
  geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
  facet_wrap("pair") +
  labs(title = "Age 5 mispronunciation effects",
       subtitle = "all trials")

both_raw_data %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Age == "Age 4") %>%
  filter(Time >= 0) %>%
  ggplot() +
  aes(x = Time, y = Prop, color = Condition) +
  geom_hline(yintercept = .5, color = "white", size = 2) +
  geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
  facet_wrap("pair") +
  labs(title = "Age 4 mispronunciation effects",
       subtitle = "all trials")


both_raw_data %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense",  Age == "Age 3") %>%
  filter(Time >= 0) %>%
  ggplot() +
  aes(x = Time, y = Prop, color = Condition) +
  geom_hline(yintercept = .5, color = "white", size = 2) +
  geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
  facet_wrap("pair") +
  labs(
    title = "Age 3 mispronunciation effects",
    subtitle = "all trials")

