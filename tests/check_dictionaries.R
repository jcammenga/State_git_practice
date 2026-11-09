#-------------------------------------------------------------------------------
# Project: State Tax Competitiveness Index (STCI)
# Script: check_dictionaries
#
# Verifies that every dictionary.csv is consistent with the topic CSVs in its
# subindex folder. Catches two classes of mistake:
#   1. Adding or renaming a column in a topic CSV without updating dictionary.csv.
#   2. Splitting, renaming, or deleting a topic CSV without updating the
#      dictionary's `file` column to match.
#
# Usage:
#   Rscript tests/check_dictionaries.R       # check all years under input/
#   source("tests/check_dictionaries.R")     # define check_dictionaries(), no side effects
#
# When run via Rscript, this script exits 0 on success and 1 on any finding.
# When sourced, it defines check_dictionaries() and does nothing else.
#-------------------------------------------------------------------------------

suppressPackageStartupMessages({
  library(readr)
})

# Expand "var_1 … var_N" dictionary entries into the actual column names they
# represent. Returns the input unchanged for ordinary single-column entries.
expand_range_entry <- function(var) {
  if (!grepl(" … ", var, fixed = TRUE)) return(var)
  parts <- strsplit(var, " … ", fixed = TRUE)[[1]]
  if (length(parts) != 2) return(var)
  left  <- regmatches(parts[1], regexec("^(.+_)(\\d+)$", parts[1]))[[1]]
  right <- regmatches(parts[2], regexec("^(.+_)(\\d+)$", parts[2]))[[1]]
  if (length(left) < 3 || length(right) < 3) return(var)
  if (left[2] != right[2]) return(var)
  paste0(left[2], as.integer(left[3]):as.integer(right[3]))
}

check_dictionaries <- function(input_root, index_year = NULL) {
  findings <- character()

  if (is.null(index_year)) {
    years <- list.dirs(input_root, recursive = FALSE, full.names = FALSE)
    years <- years[grepl("^[0-9]{4}$", years)]
  } else {
    years <- as.character(index_year)
  }

  for (year in years) {
    year_dir <- file.path(input_root, year)
    if (!dir.exists(year_dir)) {
      findings <- c(findings, sprintf("[%s] input directory does not exist", year))
      next
    }

    subindices <- list.dirs(year_dir, recursive = FALSE, full.names = FALSE)

    for (sub in subindices) {
      sub_dir <- file.path(year_dir, sub)
      dict_path <- file.path(sub_dir, "dictionary.csv")

      if (!file.exists(dict_path)) {
        findings <- c(findings, sprintf("[%s/%s] missing dictionary.csv", year, sub))
        next
      }

      dict <- suppressMessages(read_csv(dict_path, show_col_types = FALSE))
      documented <- unique(unlist(lapply(dict$variable, expand_range_entry)))

      csv_files <- list.files(sub_dir, pattern = "\\.csv$", full.names = TRUE)
      csv_files <- csv_files[basename(csv_files) != "dictionary.csv"]

      all_cols <- list()
      for (f in csv_files) {
        hdr <- suppressMessages(read_csv(f, n_max = 0, show_col_types = FALSE))
        all_cols[[basename(f)]] <- names(hdr)
      }

      # Check 1: every non-state data column must appear in the dictionary.
      data_cols <- unique(unlist(all_cols))
      undocumented <- setdiff(data_cols, c(documented, "state"))
      for (v in undocumented) {
        in_files <- names(all_cols)[vapply(all_cols, function(c) v %in% c, logical(1))]
        findings <- c(findings, sprintf(
          "[%s/%s] column '%s' in %s is not in dictionary.csv",
          year, sub, v, paste(in_files, collapse = ", ")
        ))
      }

      # Check 2: every dictionary `file` pointer must resolve to a real file
      # that actually contains the named column(s).
      for (i in seq_len(nrow(dict))) {
        var <- dict$variable[i]
        file_name <- dict$file[i]
        if (is.na(file_name) || file_name == "") next

        file_path <- file.path(sub_dir, file_name)
        if (!file.exists(file_path)) {
          findings <- c(findings, sprintf(
            "[%s/%s] dictionary lists '%s' in '%s' but that file does not exist",
            year, sub, var, file_name
          ))
          next
        }

        expanded <- expand_range_entry(var)
        file_cols <- all_cols[[file_name]]
        missing <- setdiff(expanded, file_cols)
        if (length(missing) > 0) {
          findings <- c(findings, sprintf(
            "[%s/%s] dictionary lists '%s' in '%s' but file lacks column(s): %s",
            year, sub, var, file_name, paste(missing, collapse = ", ")
          ))
        }
      }
    }
  }

  findings
}

# Run-as-script entry point: only fires when invoked via `Rscript`, not when
# sourced from another R script.
if (sys.nframe() == 0L) {
  input_root <- file.path(getwd(), "input")
  if (!dir.exists(input_root)) {
    cat("Error: ", input_root, " does not exist. Run from the repo root.\n", sep = "")
    quit(status = 2)
  }

  findings <- check_dictionaries(input_root)
  if (length(findings) == 0) {
    cat("Dictionaries are consistent with their topic CSVs.\n")
    quit(status = 0)
  }

  cat("Dictionary consistency check failed:\n")
  for (f in findings) cat("  - ", f, "\n", sep = "")
  quit(status = 1)
}
