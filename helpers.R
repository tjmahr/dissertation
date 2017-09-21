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
