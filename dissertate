#!/usr/bin/env Rscript
library(methods)

info <- list(
  filename = "dissertate",
  raw_args = commandArgs(TRUE),
  args = commandArgs(TRUE),
  docs = list()
)

get_command <- function() info$args[1]
set_command <- function(new) info$args[1] <<- new
get_rest <- function() info$args[-1]
set_docs <- function(new) info$docs <<- new
lacks_args <- function() length(info$args) == 0
needs_help <- function() any(c("-h", "--help", "help") %in% info$args)

uses_bad_command <- function() {
  !(get_command() %in% info$docs$names)
}

run <- function() {
  # parse the documentation in this file and set list of legal commands
  set_docs(parse_self_docs(info$filename))

  # fallback to help
  if (lacks_args() | needs_help() | uses_bad_command()) {
    set_command("help")
  }

  invisible(rlang::invoke(get_command(), get_rest()))
}


parse_self_docs <- function(filename) {
  # dev version of roxygen2 provides a parser
  x <- roxygen2::parse_file(filename, NULL)
  titles <- purrr::map_chr(x, purrr::pluck, "title")
  calls <- purrr::map(x, purrr::pluck, purrr::attr_getter("call"))
  fs <- purrr::map_chr(calls, function(x) as.character(x[[2]]))
  list(names = unname(fs), titles = unname(titles))
}

help_menu <- function(docs, width = 70) {
  docs$name_out <- str_pad_flush_right(docs$name)
  newline_indent <- max(nchar(docs$name_out))
  docs$wrapped <- stringr::str_wrap(docs$title, width - newline_indent,
                                    exdent = newline_indent)

  command_info <- glue::glue("{docs$name_out}{docs$wrapped}")
  command_info <- glue::collapse(command_info, sep = "\n")

  msg <- glue::glue(
    "
    Usage: {info$filename} [commands]

    Commands:
    {command_info}
    "
  )
  msg
}

str_pad_flush_right <- function(xs, min_width = 10, indent = 2) {
  width <- max(max(nchar(xs)) + indent, min_width)
  stringr::str_pad(xs, width, "right")
}




#' display usage
help <- function(...) {
  # Recreate create this string with
  # help_menu("dissertate.R")
  msg <- help_menu(info$docs)
  cat(msg)
}

#' install required packages from github
install_gh_packages <- function(...) {
  source("./R/setup-helpers.R")
  install_github_packages()
}

#' erase all data downloaded from database
erase_raw_data <- function(...) {
  data_raw_dir <- rprojroot::find_rstudio_root_file("data-raw")
  curr_files <- list.files(data_raw_dir, "*.csv",
                           full.names = TRUE, recursive = TRUE)

  could_remove <- file.remove(curr_files)
  removed_files <- curr_files[could_remove]
  msg <- paste0(local_file_path(removed_files), collapse = "\n  ")
  message("Removed:\n  ", msg)

  if (any(!could_remove)) {
    error_files <- curr_files[!could_remove]
    msg <- paste0(local_file_path(error_files), collapse = "\n  ")
    message("Could not remove:\n  ", msg)
  }
}

#' download eyetracking block attributes
get_et_blocks <- function(...) {
  source("./R/database-helpers.R")
  get_eyetracking_block_attributes()
}

#' download eyetracking trial attributes
get_et_trials <- function(...) {
  source("./R/database-helpers.R")
  get_eyetracking_trial_attributes()
}

#' download eyetracking looks
get_et_looks <- function(...) {
  source("./R/database-helpers.R")
  get_eyetracking_looks()
}

#' download test scores and demographics
get_child_info <- function(...) {
  source("./R/database-helpers.R")
  suppressWarnings(get_scores_for_participant_summary())
  suppressWarnings(get_scores())
}

#' report unnamed-chunk files
check_fig_names <- function(...) {
  bad_files <- list.files(".", pattern = "unnamed-chunk.*png",
                          recursive = TRUE, full.names = TRUE)
  if (length(bad_files) > 0) {
    file_log <- paste0(bad_files, collapse = "\n  ")
    stop("Unnamed chunk found \n  ", file_log, call. = FALSE)
  }
  invisible(TRUE)
}

wc_rmd <- function() {
  library(magrittr)
  now <- Sys.time()
  list.files("./", "\\d\\d.+.Rmd") %>%
    rlang::set_names(., .) %>%
    purrr::map_df(tjmisc::count_words_in_rmd_file, .id = "File") %>%
    tibble::add_column(Date = now, .before = 1)
}

#' view current word counts
wc_rmd_peek <- function() {
  results <- wc_rmd()
  print(results)
}

#' check word count changes
wc_rmd_diff <- function() {
  suppressWarnings(suppressMessages(library(dplyr, warn.conflicts = FALSE)))

  counts <- list.files("./misc/wcs", full.names = TRUE) %>%
    rlang::set_names(., .) %>%
    purrr::map(readr::read_csv, col_types = "Tciii")

  most_recent <- counts[[length(counts)]] %>%
    select(File, CurrentWords = Words)

  wc_rmd() %>%
    left_join(most_recent, by = c("File")) %>%
    select(File, Words, CurrentWords) %>%
    mutate(Change = sprintf("%+i", Words - CurrentWords),
           Change = ifelse(Change == "+0", "", Change)) %>%
    select(File, Words, Change) %>%
    print()
}

#' count words in rmd files and save
wc_rmd_save <- function() {
  results <- wc_rmd_peek()
  outfile <- file.path("./misc/wcs",
                       paste0(as.integer(unique(results$Date)), ".csv"))
  readr::write_csv(results, outfile)
}

#' clean up the rmd word count files
wc_rmd_clean <- function() {
  library(magrittr)
  counts <- list.files("./misc/wcs", full.names = TRUE) %>%
    rlang::set_names(., .) %>%
    purrr::map(readr::read_csv, col_types = "Tciii")

  no_dates <- counts %>%
    lapply(modifyList, val = list(Date = NULL)) %>%
    unname()

  to_drop <- names(counts)[tjmisc::is_same_as_last(no_dates)]

  if (length(to_drop) != 0) {
    cat("Removing files: \n")
    for (file in to_drop) {
      message(" ", file)
      invisible(file.remove(file))
    }
  }
}

#' delete current bookdown files
clean_site <- function(...) {
  rmarkdown::clean_site()
  if (file.exists("./dissertation.Rmd")) {
    message(" dissertation.Rmd")
    invisible(file.remove("./dissertation.Rmd"))
  }

  # clean up artifacts of individual chapters in root folder
  chapters <- list.files(".", pattern = "Rmd")
  possible_mds <- str_replace_ext(chapters, "Rmd", "md")
  possible_utf_mds <- str_replace_ext(chapters, "Rmd", "utf8.md")
  to_remove <- Filter(file.exists, c(possible_mds, possible_utf_mds))

  for (file in to_remove) {
    message(" ", file)
    invisible(file.remove(file))
  }
}

str_replace_ext <- function(x, ext, new_ext) {
  paste0(tools::file_path_sans_ext(x), ".", new_ext)
}

#' reset bookdown files to last git commit
reset_site <- function(...) {
  clean_site()
  repo <- git2r::repository(".")
  git2r::checkout(repo, path = "docs/")
}

#' rebuild bookdown site
build_gitbook <- function(...) {
  rmarkdown::render_site(output_format = 'bookdown::gitbook',
                         encoding = 'UTF-8')
}

debug <- function(...) {
  debug_info <- list(
    raw_args = info$raw_args,
    args = info$args,
    `args[1]` = info$args[1],
    `get_command()` = get_command(),
    `get_rest()` = get_rest(),
    full_args = commandArgs(FALSE))

  cat(str(debug_info))
}


run()

