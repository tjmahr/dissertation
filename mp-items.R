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

# Flip things so that the nonword and real-word curves go upward
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

pairs <- items %>% tidyr::spread(Condition, Form) %>% mutate(pair = sprintf("%s vs %s", real, MP))

raw_data %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Unfamiliar", Age == "Age 5") %>%
  filter(Time >= 0) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = Condition) +
    geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
    facet_wrap("pair") +
    labs(title = "Age 5 mispronunciation effects")

raw_data %>%
  left_join(pairs) %>%
  filter(Condition != "nonsense", Bias_Fam == "Unfamiliar", Age == "Age 4") %>%
  filter(Time >= 0) %>%
  ggplot() +
    aes(x = Time, y = Prop, color = Condition) +
    geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
    facet_wrap("pair") +
    labs(title = "Age 4 mispronunciation effects")


raw_data %>%
  filter(Condition != "nonsense", Bias_Fam != "Unfamiliar", Age == "Age 5") %>%
  ggplot() +
    aes(x = Time, y = Prop, color = Condition) +
    geom_pointrange(aes(ymin = Prop - PropSE, ymax = Prop + PropSE)) +
    facet_wrap("WordGroup")
