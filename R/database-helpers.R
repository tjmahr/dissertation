library(dplyr, warn.conflicts = FALSE)
library(L2TDatabase)
library(readr)

create_directory <- function(path) {
  if (!dir.exists(path)) {
    message("Creating directory: ", path)
    dir.create(path, showWarnings = FALSE)
  }
  invisible(path)
}

create_directory("./data-raw")
create_directory("./data")

find_database_config <- function() {
  home_config <- path.expand("~/l2t_db.cnf")
  repo_config <- rprojroot::find_rstudio_root_file("l2t_db.cnf")

  if (file.exists(home_config)) {
    home_config
  } else if (file.exists(repo_config)) {
    repo_config
  } else {
    stop("Cannot find `l2t_db.cnf` file")
  }
}

get_scores_for_participant_summary <- function() {
  l2t <- l2t_connect(find_database_config())
  on.exit(DBI::dbDisconnect(l2t$con))

  # For TP1, I had added everyone we recruited. Many did not participate. Verbal
  # fluency and fruit stroop are short tasks and the scores are hard to
  # invalidate. (Unlike say, the GFTA2, where we might not have a score because
  # of a recording error.) So these two are good indicators for whether children
  # participated in the study.

  t1 <- l2t %>%
    tbl("Scores_TimePoint1") %>%
    filter(!is.na(VerbalFluency_Raw), !is.na(FruitStroop_Score),
           !is.na(PPVT_GSV), !CImplant) %>%
    collect()

  t2 <- l2t %>%
    tbl("Scores_TimePoint2") %>%
    filter(!is.na(VerbalFluency_Raw), !CImplant) %>%
    collect()

  t3 <- l2t %>%
    tbl("Scores_TimePoint3") %>%
    filter(!CImplant) %>%
    collect()

  medu_scheme <- data_frame(
    Maternal_Education_LMH = c("Low", "Low", "Low", "Mid",
                               "Mid", "Mid", "High", NA),
    Maternal_Education_Level = c(1:7, NA))

  df_all_three <- bind_rows(t1, t2, t3) %>%
    left_join(medu_scheme, by = "Maternal_Education_Level") %>%
    mutate(
      AAE = as.logical(AAE),
      Female = as.logical(Female),
      MAE = !AAE,
      Male = !Female,
      Age = ifelse(is.na(PPVT_Age), EVT_Age, PPVT_Age)) %>%
    select(Study, ResearchID, Female, Male, MAE, AAE, LateTalker, Age,
           Maternal_Education_LMH, EVT_Standard, PPVT_Standard, GFTA_Standard)

  df_all_three %>%
    verbosely_write_csv("./data-raw/scores_for_participant_summary.csv")
}

get_scores <- function() {
  l2t <- l2t_connect(find_database_config())
  on.exit(DBI::dbDisconnect(l2t$con))

  t1 <- l2t %>%
    tbl("Scores_TimePoint1") %>%
    filter(!is.na(VerbalFluency_Raw), !is.na(FruitStroop_Score),
           !is.na(PPVT_GSV), !CImplant) %>%
    collect()

  t2 <- l2t %>%
    tbl("Scores_TimePoint2") %>%
    filter(!is.na(VerbalFluency_Raw), !CImplant) %>%
    collect()

  t3 <- l2t %>%
    tbl("Scores_TimePoint3") %>%
    filter(!CImplant) %>%
    collect()

  medu_scheme <- data_frame(
    Maternal_Education_LMH = c("Low", "Low", "Low", "Mid",
                               "Mid", "Mid", "High", NA),
    Maternal_Education_Level = c(1:7, NA))

  df_all_three <- bind_rows(t1, t2, t3) %>%
    left_join(medu_scheme, by = "Maternal_Education_Level") %>%
    mutate(
      AAE = as.logical(AAE),
      Female = as.logical(Female),
      MAE = !AAE,
      Male = !Female,
      Age = ifelse(is.na(PPVT_Age), EVT_Age, PPVT_Age)) %>%
    select(Study, ResearchID, Female, Male, MAE, AAE, LateTalker, Age,
           Maternal_Education_LMH,
           EVT_Age, EVT_GSV, EVT_Standard,
           PPVT_Age, PPVT_GSV, PPVT_Standard,
           MinPair_Age, MinPair_NumTestTrials, MinPair_ProportionCorrect,
           SAILS_Age, SAILS_NumTestTrials, SAILS_ProportionTestCorrect)

  df_all_three %>%
    verbosely_write_csv("./data-raw/test_scores.csv")
}



# Download block info from database
get_eyetracking_block_attributes <- function() {
  et <- l2t_connect(find_database_config(), db_name = "eyetracking")
  on.exit(DBI::dbDisconnect(et$con))

  # Set up tables with block information
  tbl_blocks <- tbl(et, "q_BlocksByStudy")
  tbl_attributes <- tbl(et, "q_BlockAttributesByStudy") %>%
    select(BlockID, starts_with("BlockAttribute"))

  # Combine and download
  block_attributes <- tbl_blocks %>%
    left_join(tbl_attributes, by = "BlockID") %>%
    filter(Study %in% c("TimePoint1", "TimePoint2", "TimePoint3")) %>%
    # Exclude unimportant attributes
    filter(!(BlockAttribute_Name %in% c("RandomSeed", "FrameRate",
                                        "ScreenHeight", "ScreenWidth"))) %>%
    collect(n = Inf)

  # Partition into separate datafromes for each task x study
  wide_attributes <- block_attributes %>%
    spread_by_task_study(BlockAttribute_Name, BlockAttribute_Value)

  # Save each task x study wide dataframe to a csv
  out_files <- file.path(".", "data-raw",
                         paste0(wide_attributes$task_study, "_blocks.csv"))
  invisible(purrr::map2(wide_attributes$data, out_files, verbosely_write_csv))

}


# Download trial info from database
get_eyetracking_trial_attributes <- function() {
  et <- l2t_connect(find_database_config(), db_name = "eyetracking")
  on.exit(DBI::dbDisconnect(et$con))

  trial_attributes <- tbl(et, "q_TrialAttributesByStudy") %>%
    filter(Study %in% c("TimePoint1", "TimePoint2", "TimePoint3")) %>%
    collect(n = Inf)

  # Partition into separate datafromes for each task x study
  wide_attributes <- trial_attributes %>%
    spread_by_task_study(TrialAttribute_Name, TrialAttribute_Value)

  # Save each task x study wide dataframe to a csv
  out_files <- file.path(".", "data-raw",
                         paste0(wide_attributes$task_study, "_trials.csv.gz"))

  invisible(purrr::map2(wide_attributes$data, out_files, verbosely_write_csv))

}


# Download eyetracking data from database
get_eyetracking_looks <- function() {
  et <- l2t_connect(find_database_config(), db_name = "eyetracking")
  on.exit(DBI::dbDisconnect(et$con))

  # To be more efficient, and to avoid downloading 1.2 gigs of eyetracking data,
  # limit queries to just the trials we are interested in
  tbl_trials_to_keep <- tbl(et, "q_TrialsByStudy") %>%
    filter(Study %in% c("TimePoint1", "TimePoint2", "TimePoint3"))

  tbl_trial_ids_to_keep <- tbl_trials_to_keep %>%
    select(TrialID)

  # ... and limit the eyetracking data we download too
  tbl_looks <- tbl(et, "Looks") %>%
    select(TrialID, Time, GazeByImageAOI, GazeByAOI)

  # Download the looking data from the trials we want
  tbl_looks_to_keep <- tbl_trial_ids_to_keep %>%
    inner_join(tbl_looks, by = "TrialID") %>%
    collect()

  # Combine looks with trial info
  to_save <- tbl_trials_to_keep %>%
    collect() %>%
    left_join(tbl_looks_to_keep, by = "TrialID") %>%
    mutate(task_study = tolower(paste0(Task, "_", Study))) %>%
    tidyr::nest(-task_study)

  # Save each task x study wide dataframe to a csv
  out_files <- file.path(".", "data-raw",
                         paste0(to_save$task_study, "_looks.csv.gz"))
  invisible(purrr::map2(to_save$data, out_files, verbosely_write_csv))
}


# Download participant abilities from an item-response analysis of
# age-3 minimal pairs data
get_tp1_minpair_scores <- function() {
  "https://github.com/LearningToTalk/MinPairItemResponse/raw/master/data" %>%
    file.path("minpair-abilities.csv") %>%
    read_csv(
      col_types = cols(
        Model = col_character(),
        ResearchID = col_character(),
        coef = col_double(),
        ranef = col_double(),
        fitted = col_double(),
        PPVT_GSV = col_integer(),
        MinPair_Age = col_integer(),
        Correct = col_integer(),
        Trials = col_integer(),
        Proportion = col_double())) %>%
    verbosely_write_csv("./data-raw/age3-minpair-fits.csv")
}


# Partition a long dataframe by each task x study, and convert into
# wide format
spread_by_task_study <- function(df, attr_name, attr_value) {
  # Capture the column names
  attr_name <- enquo(attr_name)
  attr_value <- enquo(attr_value)

  # Partition into separate datafromes for each task x study
  df %>%
    mutate(task_study = tolower(paste0(Task, "_", Study))) %>%
    tidyr::nest(-task_study) %>%
    # Convert each dataframe from long to wide, plugging in column names with
    # !! (unquote) operator
    mutate(data = purrr::map(data, tidyr::spread, !! attr_name, !! attr_value))
}

verbosely_write_csv <- function(x, path, ...) {
  message("Writing ", path)
  readr::write_csv(x, path, ...)
}

local_file_path <- function(x) {
  file.path(basename(dirname(x)), basename(x))
}
