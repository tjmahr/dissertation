#!/usr/bin/env Rscript

raw_args <- commandArgs(TRUE)
args <- raw_args

get_rest <- function() args[-1]
set_command <- function(new) args[1] <<- new
get_command <- function() args[1]

lacks_args <- function() length(args) == 0
needs_help <- function() any(c("-h", "--help", "help") %in% args)
uses_bad_command <- function() {
  # Quickly recreate with
  # dput(parse_self_docs("dissertate.R")[["names"]])
  legal <- c("help", "install_gh_packages", "erase_raw_data",
             "get_et_blocks", "get_et_trials", "get_et_looks")

  !(get_command() %in% legal)
}

if (lacks_args() | needs_help() | uses_bad_command()) {
  set_command("help")
}


# Helpers to create the help menu dynamically
help_menu <- function(filename, width = 70) {
  info <- parse_self_docs(filename)

  info$name_out <- str_pad_flush_right(info$name)
  newline_indent <- max(nchar(info$name_out))
  info$wrapped <- stringr::str_wrap(info$title, width - newline_indent,
                                    exdent = newline_indent)

  command_info <- glue::glue("{info$name_out}{info$wrapped}")
  command_info <- glue::collapse(command_info, sep = "\n")

  msg <- glue::glue(
    "
    Usage: {filename} [commands]

    Commands:
    {command_info}
    "
  )
  msg
}

parse_self_docs <- function(filename) {
  shh_proc_text <- purrr::quietly(roxygen2::roc_proc_text)
  x <- shh_proc_text(roxygen2::roclet("rd"), input = readLines(filename))
  x <- x$result
  names <- purrr::map_chr(x, purrr::pluck, "fields", "name", "values")
  titles <- purrr::map_chr(x, purrr::pluck, "fields", "title", "values")
  list(names = unname(names), titles = unname(titles))
}

str_pad_flush_right <- function(xs, min_width = 10, indent = 2) {
  width <- max(max(nchar(xs)) + indent, min_width)
  stringr::str_pad(xs, width, "right")
}


#' display usage
help <- function(...) {
  # Recreate create this string with
  # help_menu("dissertate.R")
  msg <- glue::glue(
    "
    Usage: dissertate.R [commands]

    Commands:
    help                 display usage
    install_gh_packages  installs required packages from github
    erase_raw_data       erase all data downloaded from database
    get_et_blocks        download eyetracking block attributes
    get_et_trials        download eyetracking trial attributes
    get_et_looks         download eyetracking looks
    "
  )
  cat(msg)
}

#' installs required packages from github
install_gh_packages <- function(...) {
  source("./R/setup_helpers.R")
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

# debug <- function(...) {
#   info <- list(
#     raw_args = raw_args,
#     args = args,
#     `args[1]` = args[1],
#     `get_command()` = get_command(),
#     `get_rest()` = get_rest(),
#     `cli` = Sys.getenv("cli-status"))
#
#   cat(str(info))
# }
# debug()

# flag to avoid infinite recursions if help_menu() is called
if (Sys.getenv("r-cli-status") == "") {
  Sys.setenv("r-cli-status" = "running")
  invisible(rlang::invoke(get_command(), get_rest()))
}



