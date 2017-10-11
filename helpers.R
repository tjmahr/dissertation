# Helpers

# ---- helpers ----
library(dplyr)
library(rlang)
library(littlelisteners)
library(ggplot2)

#' group `data` by some grouping variables (`...`),
#' randomly select `size` of the groups
#' keep just the data from those sampled groups
sample_n_of <- function(data, size, ...) {
  dots <- quos(...)
  rows <- data_frame(row = seq_len(nrow(data)))
  rows[, "group"] <- data %>%
    group_by(!!! dots) %>%
    group_indices()

  subset <- rows %>%
    filter(.data$group %in% sample(unique(.data$group), size)) %>%
    pull(.data$row)

  data[subset, ]
}

create_pairs <- function(xs) {
  if (!is.factor(xs)) xs <- ordered(xs)
  xs %>%
    levels() %>%
    rev() %>%
    combn(2) %>%
    t() %>%
    as.data.frame() %>%
    set_names("x1", "x2") %>%
    mutate(name = paste0(.data$x1, "-", .data$x2)) %>%
    mutate_all(as.character) %>%
    arrange(x1, desc(x2))
}

compare_pairs <- function(data, levels, values, f = `-`) {
  levels <- enquo(levels)
  values <- enquo(values)

  pairs <- data %>% pull(!! levels) %>% create_pairs()
  wide <- tidyr::spread(data, !! levels, !! values)
  for (row_i in seq_len(nrow(pairs))) {
    pair_i <- pairs[row_i, ]
    wide[, pair_i$name] <- f(wide[[pair_i$x1]], wide[[pair_i$x2]])
  }

  wide %>%
    select(-one_of(c(pairs$x1), c(pairs$x2))) %>%
    tidyr::gather("pair", "value", one_of(c(pairs$name))) %>%
    mutate(pair = factor(.data$pair, levels = pairs$name))
}

# ---- other helpers ----

# preview a file that would be created by ggsave()
ggpreview <- function(...) {
  fname <- tempfile(fileext = ".png")
  ggsave(filename = fname, ...)
  system2("open", fname)
  invisible(NULL)
}

