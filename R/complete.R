#' Complete
#'
#' Completes date/time vector.
#'
#' @inheritParams params
#' @param unique A flag specifying whether to only return unique values.
#'
#' @return The completed date/time vector.
#' @family complete
#' @export
#'
#' @examples
#' dtt_complete(as.Date(c("2001-01-01", "2001-01-03", "2001-01-01")))
dtt_complete <- function(x, ...) {
  UseMethod("dtt_complete")
}

#' @describeIn dtt_complete Complete a Date sequence vector
#' @export
dtt_complete.Date <- function(x, from = min(x), to = max(x), units = "days",
                              unique = TRUE, sort = TRUE, ...) {
  chk_not_empty(x)
  chk_date(from)
  chk_date(to)
  chk_string(units)
  chk_subset(units, c("days", "months", "years"))
  chk_flag(unique)
  chk_flag(sort)
  chk_unused(...)

  x <- dtt_floor(x, units = units)
  from <- dtt_floor(from, units = units)
  to <- dtt_floor(to, units = units)

  if (from > to) err("from must not be greater than to")
  if (from > min(x) || to < max(x)) err("from and to must span x")

  seq <- dtt_seq(from, to, units = units)
  seq <- as.Date(setdiff(seq, x), origin = "1970-01-01")
  if (unique) x <- unique(x)
  x <- c(x, seq)
  if (sort) x <- sort(x)
  x
}

#' @describeIn dtt_complete Complete a POSIXct sequence vector
#' @export
dtt_complete.POSIXct <- function(x, from = min(x), to = max(x),
                                 units = "seconds", unique = TRUE, sort = TRUE,
                                 ...) {
  chk_not_empty(x)
  chk_date_time(from)
  chk_date_time(to)
  chk_string(units)
  chk_subset(units, c("seconds", "minutes", "hours", "days", "months", "years"))
  chk_flag(unique)
  chk_flag(sort)
  chk_unused(...)

  chk_identical(dtt_tz(from), dtt_tz(x))
  chk_identical(dtt_tz(to), dtt_tz(x))

  x <- dtt_floor(x, units = units)
  from <- dtt_floor(from, units = units)
  to <- dtt_floor(to, units = units)

  if (from > to) err("from must not be greater than to")
  if (from > min(x) || to < max(x)) err("from and to must span x")

  seq <- try(dtt_seq(from, to, units = units), silent = FALSE)
  if (inherits(seq, "try-error")) {
    err("attempting to generate more than 2^32 POSIXct values")
  }
  seq <- as.Date(setdiff(seq, x), origin = "1970-01-01")
  if (unique) x <- unique(x)
  x <- c(x, seq)
  if (sort) x <- sort(x)
  x
}

#' @describeIn dtt_complete Complete a hms sequence vector
#' @export
dtt_complete.hms <- function(x, from = min(x), to = max(x), units = "seconds",
                             unique = TRUE, sort = TRUE, ...) {
  chk_s3_class(x, "hms")
  chk_not_any_na(x)
  chk_not_empty(x)

  chk_time(from)
  chk_time(to)
  chk_string(units)
  chk_subset(units, c("seconds", "minutes", "hours"))
  chk_flag(unique)
  chk_flag(sort)
  chk_unused(...)

  x <- dtt_floor(x, units = units)
  from <- dtt_floor(from, units = units)
  to <- dtt_floor(to, units = units)

  if (from > to) err("from must not be greater than to")
  if (from > min(x) || to < max(x)) err("from and to must span x")

  seq <- try(dtt_seq(from, to, units = units), silent = FALSE)
  if (inherits(seq, "try-error")) {
    err("attempting to generate more than 2^32 hms values")
  }
  seq <- as.Date(setdiff(seq, x), origin = "1970-01-01")
  if (unique) x <- unique(x)
  x <- c(x, seq)
  if (sort) x <- sort(x)
  dtt_time(x)
}
