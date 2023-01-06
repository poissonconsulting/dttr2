#' Completed
#'
#' Tests whether a date time is complete.
#'
#' @inheritParams params
#' @param unique A flag indicating whether the values must be unique.
#'
#' @return A flag indicating whether complete.
#' @family complete
#' @export
dtt_completed <- function(x, ...) {
  UseMethod("dtt_completed")
}

#' @describeIn dtt_completed Test if Date vector is complete
#' @export
dtt_completed.Date <- function(x, units = "days", unique = TRUE, sorted = TRUE,
                               ...) {
  chk_string(units)
  chk_subset(units, c("days", "months", "years"))
  chk_flag(unique)
  chk_flag(sorted)
  chk_unused(...)

  if (anyNA(x)) {
    return(NA)
  }

  x <- dtt_floor(x, units)
  if (length(x) <= 1) {
    return(TRUE)
  }
  if (unique && anyDuplicated(x)) {
    return(FALSE)
  }
  if (sorted && is.unsorted(x)) {
    return(FALSE)
  }
  x <- unique(x)
  seq <- dtt_seq(min(x), max(x), units = units)
  identical(length(x), length(seq))
}

#' @describeIn dtt_completed Test if POSIXct vector is complete
#' @export
dtt_completed.POSIXct <- function(x, units = "seconds", unique = TRUE,
                                  sorted = TRUE, ...) {
  chk_string(units)
  chk_subset(units, c("seconds", "minutes", "hours", "days", "months", "years"))
  chk_flag(unique)
  chk_flag(sorted)
  chk_unused(...)

  if (anyNA(x)) {
    return(NA)
  }

  x <- dtt_floor(x, units)
  if (length(x) <= 1) {
    return(TRUE)
  }
  if (unique && anyDuplicated(x)) {
    return(FALSE)
  }
  if (sorted && is.unsorted(x)) {
    return(FALSE)
  }
  x <- unique(x)
  seq <- dtt_seq(min(x), max(x), units = units)
  identical(length(x), length(seq))
}

#' @describeIn dtt_completed Test if POSIXct vector is complete
#' @export
dtt_completed.hms <- function(x, units = "seconds", unique = TRUE,
                              sorted = TRUE, ...) {
  chk_string(units)
  chk_subset(units, c("seconds", "minutes", "hours"))
  chk_flag(unique)
  chk_flag(sorted)
  chk_unused(...)

  if (anyNA(x)) {
    return(NA)
  }

  x <- dtt_floor(x, units)
  if (length(x) <= 1) {
    return(TRUE)
  }
  if (unique && anyDuplicated(x)) {
    return(FALSE)
  }
  if (sorted && is.unsorted(x)) {
    return(FALSE)
  }
  x <- unique(x)
  seq <- dtt_seq(min(x), max(x), units = units)
  identical(length(x), length(seq))
}
