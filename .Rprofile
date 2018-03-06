options(Ncpus = parallel::detectCores() - 1)
options(WrapRmd.width = 72)

list_bibcodes <- function(sort = TRUE) {
  refs <- bibtex::read.bib("./assets/refs.bib")

  if (sort) {
    refs <- refs[sort(names(refs))]
  }

  titles <- purrr::map_chr(refs, purrr::pluck, 1, "title")

  titles <- stringr::str_replace_all(titles, "\\{|\\}", "")
  titles <- stringr::str_replace_all(titles, "\\s\\s+", " ")

  preview_width <- unlist(options("width")) - max(nchar(names(refs))) - 3
  short_titles <- ifelse(
    nchar(titles) > (preview_width - 3),
    paste0(substr(titles, 1, (preview_width - 3)), "..."),
    titles
    )

  tags <- paste0("[@", names(refs), "]")
  padded <- stringr::str_pad(tags, max(nchar(tags)), "left")
  print(glue::glue("{padded} {short_titles}"))
}

invisible(file.copy("dissertate.R", "dissertate", overwrite = TRUE))
