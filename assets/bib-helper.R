# Helper script that re-format BibTex entries into my preferred formatting

library("stringr")
library("purrr")

format_bib_entry <- function(text = clipr::read_clip()) {
  parsed <- parse_bib_text(text)
  header <- paste0("\n", parsed$header, "\n")
  fields <- prepare_bib_fields(parsed$fields) %>% paste0(collapse = "")

  final <- paste0(header, fields, "}\n", collpase = "")
  # cat(final)
  final
}

parse_bib_text <- function(text) {
  # normalize the text to a single line
  as_blob <- text %>%
    str_split("\\n") %>%
    unlist() %>%
    str_trim() %>%
    str_c(collapse = " ")

  # create one line per bibtex field
  one_line_per_field <- as_blob %>%
    str_replace_all("(\\w+)(\\s*=\\s*)([{])", "\n\\1 = \\3") %>%
    str_replace("[}][,]?[}]$", "},\n}") %>%
    str_split(" \\n") %>%
    unlist()

  list(header = one_line_per_field[1],
       fields = one_line_per_field[c(-1, -length(one_line_per_field))])
}

# xs <- parse_bib_text(text)[["fields"]]

prepare_bib_fields <- function(xs) {
  bib_fields <- xs %>% map(as_bib_field)

  # name the fields
  bib_fields <- bib_fields %>% setNames(map_chr(bib_fields, "name"))

  preferred_order <- c(
    "title", "author", "year", "doi", "url", "journal",
    "volume", "number", "month", "day", "edition", "editor",
    "series", "booktitle", "pages", "publisher", "address", "type",
    "note", "archivePrefix", "arxivId", "eprint",
    "abstract")

  # Mendeley includes these. We won't keep them.
  additional_ones_to_exclude <- c("file", "isbn", "issn", "keywords", "pmid")
  known_names <- c(additional_ones_to_exclude, preferred_order)

  stopifnot(names(bib_fields) %in% known_names)

  # reorder them
  bib_fields <- bib_fields[preferred_order] %>% compact

  # determine padding needed around = sign
  name_lengths <- bib_fields %>% map_int(~ nchar(.x$name))
  padding <- max(name_lengths) - name_lengths

  # apply padding, format and render contents of each field
  formatted_fields <- map2(bib_fields, padding, set_padding) %>%
    map(format_bib_contents) %>%
    map_chr(render_bib_field)
  formatted_fields
}

as_bib_field <- function(x) {
  field <- list()

  printed <- x %>%
    str_extract("(\\w+) = ") %>%
    unlist

  field$name <- printed %>%
    str_replace(" = ", "")

  field$contents <- x %>%
    str_replace(printed, "") %>%
    # final and initial brackets
    str_replace("^[{]", "") %>%
    str_replace("[}][,]$", "")

  field$padding <- 0

  structure(field, class = c(field$name, "bib_field"))
}

set_padding <- function(x, y) {
  x$padding <- y
  x
}

format_bib_contents <- function(x) UseMethod("format_bib_contents")

format_bib_contents.default <- function(x) x

format_bib_contents.abstract <- function(x) {
  padding <- strrep(" ", x$padding)
  leading_part <- sprintf("  %s %s= {", x$name, padding)
  indent <- nchar(leading_part)
  x$contents <- str_wrap(x$contents, 60, exdent = indent)
  x
}

render_bib_field <- function(x) {
  padding <- strrep(" ", x$padding)
  leading_part <- sprintf("  %s %s= {", x$name, padding)
  sprintf("%s%s},\n", leading_part, x$contents)
}


# Copy the text to be reformatted, and run this to get reformatted text.
cat(format_bib_entry())
