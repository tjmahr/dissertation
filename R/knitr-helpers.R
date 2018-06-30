# ---- set-options ----
library(methods)
knitr::opts_chunk$set(
  tidy = FALSE,
  collapse = TRUE,
  comment = "#>",
  out.width = 80,
  fig.align = "center",
  dpi = 300
)

options(width = 80)


# ---- knitr-helper-functions ----
is_word_output <- function() {
  knitr::opts_knit$get("rmarkdown.pandoc.to") == "docx"
}
is_html_output <- knitr:::is_html_output
is_latex_output <- knitr:::is_latex_output

# Make a function that prints a string of characters if the output is pdf
make_latex_decorator <- function(output, otherwise) {
  function() {
    if (is_latex_output()) output else otherwise
  }
}

# insert_pause <- make_latex_decorator(". . .", "\n")
# insert_slide_break <- make_latex_decorator("----", "\n")
# insert_inc_bullet <- make_latex_decorator("> *", "*")
insert_html_math <- make_latex_decorator("", "$$")
