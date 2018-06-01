# I'm having a hard time remembering whether the target in the mispronunciation
# task's nonword trials are the novel object or not. This script convinces me
# that I coded everything correctly.

library(dplyr)
library(rlang)
library(littlelisteners)
library(ggplot2)
library(tjmisc)

# Load gazes
looks <- c(
  "./data-raw/mp_timepoint1_looks.csv.gz",
  "./data-raw/mp_timepoint2_looks.csv.gz",
  "./data-raw/mp_timepoint3_looks.csv.gz") %>%
  lapply(readr::read_csv) %>%
  bind_rows()

# Load trial info
trials <- c(
  "./data-raw/mp_timepoint1_trials.csv.gz",
  "./data-raw/mp_timepoint2_trials.csv.gz",
  "./data-raw/mp_timepoint3_trials.csv.gz") %>%
  lapply(readr::read_csv) %>%
  bind_rows() %>%
  rename(Condition = StimType)

glimpse(trials)

target_info <- trials %>%
  mutate(
    TargetImageFile = ifelse(TargetImage == "ImageL", ImageL, ImageR),
    TargetImageWord = stringr::str_extract(TargetImageFile, "\\D*"),
    FamiliarImageFile = FamiliarImage,
    FamiliarImageWord = stringr::str_extract(FamiliarImage, "\\D*"),
    FamiliarImageLocation = ifelse(FamiliarImageFile == ImageL, "ImageL", "ImageR"))


target_info %>%
  select(
    Condition, TargetImage, ImageL, ImageR,
    TargetImageFile, TargetImageWord,
    FamiliarImageFile, FamiliarImageWord, FamiliarImageLocation) %>%
  distinct() %>%
  arrange(Condition, TargetImage)

# Confirm that the familiar image location is the target image location
stopifnot(target_info$FamiliarImageLocation == target_info$TargetImage)
stopifnot(target_info$FamiliarImageFile == target_info$TargetImageFile)

fam_words <- c(
  "dog", "cup", "car", "bed", "ball", "cake", "book", "duck", "girl",
  "sock", "soup", "rice", "shoes")

target_image_words <- target_info %>%
  distinct(Condition, TargetImageWord) %>%
  arrange(Condition, TargetImageWord)

# Confirm that every familiar word in the design is a target
stopifnot(target_image_words$TargetImageWord %in% fam_words)
stopifnot(fam_words %in% target_image_words$TargetImageWord)

# Confirm that the Target in the gazedata has the same location as the familiar
# word
gaze_locations <- looks %>%
  distinct(TrialID, GazeByImageAOI, GazeByAOI) %>%
  left_join(target_info) %>%
  select(
    TrialID:GazeByAOI, Condition, TargetImage, DistractorImage,
    FamiliarImageLocation)

target_looks <- gaze_locations %>%
  filter(GazeByImageAOI == "Target")

stopifnot(target_looks$TargetImage == target_looks$GazeByAOI)
stopifnot(target_looks$FamiliarImageLocation == target_looks$GazeByAOI)
stopifnot(target_looks$DistractorImage != target_looks$GazeByAOI)

distractor_looks <- gaze_locations %>%
  filter(GazeByImageAOI == "Distractor")

stopifnot(distractor_looks$DistractorImage == distractor_looks$GazeByAOI)
stopifnot(distractor_looks$FamiliarImageLocation != distractor_looks$GazeByAOI)
stopifnot(distractor_looks$TargetImage != distractor_looks$GazeByAOI)

tracked <- gaze_locations %>%
  filter(GazeByImageAOI == "tracked")

stopifnot(tracked$GazeByImageAOI == tracked$GazeByAOI)

na_looks <- gaze_locations %>%
  filter(is.na(GazeByImageAOI))

stopifnot(is.na(na_looks$GazeByImageAOI) == is.na(na_looks$GazeByAOI))


# Which trials favor the target at noun onset
target_bias <- target_info %>%
  filter(Bias_ImageAOI == "Target")

# Count looks to each AOI at noun onset for those trials
target_bias_frame_counts <- looks %>%
  filter(0 <= Time, Time <= 245) %>%
  semi_join(target_bias) %>%
  inner_join(target_bias %>% select(TrialID, Condition)) %>%
  filter(GazeByImageAOI %in% c("Target", "Distractor")) %>%
  count(Condition, TrialID, GazeByImageAOI) %>%
  inner_join(target_bias %>% select(TrialID, Bias_FrameCount, Bias_ImageAOI))

# If the bias is the target, then the count of target frames should equal the
# highest count. There should be no rows where this is not the case
target_bias_frame_counts %>%
  group_by(TrialID) %>%
  mutate(max_n = max(n)) %>%
  ungroup() %>%
  filter(GazeByImageAOI == "Target") %>%
  filter(n != max_n)


# Which trials favor the distractor at noun onset
distractor_bias <- target_info %>%
  filter(Bias_ImageAOI == "Distractor")

# Count looks to each AOI at noun onset for those trials
distractor_bias_frame_counts <- looks %>%
  filter(0 <= Time, Time <= 245) %>%
  semi_join(distractor_bias) %>%
  inner_join(distractor_bias %>% select(TrialID, Condition)) %>%
  filter(GazeByImageAOI %in% c("Target", "Distractor")) %>%
  count(Condition, TrialID, GazeByImageAOI) %>%
  inner_join(distractor_bias %>% select(TrialID, Bias_FrameCount, Bias_ImageAOI))

distractor_bias_frame_counts %>%
  group_by(TrialID) %>%
  mutate(max_n = max(n)) %>%
  ungroup() %>%
  filter(GazeByImageAOI == "Distractor") %>%
  filter(n != max_n)

# So...
#
# * the "Target" in the Bias_ImageAOI is the same as the "Target" in the
#   GazeByImageAOI column
# * the "Target" in the GazeByImageAOI column has the same location in the
#   "GazeByAOI" column as the location in the TargetImage trial field
# * the image in the location specified by TargetImage is always a familiar
#   word
#
# So the "Target" always refers to the familar word.
