#' Aggregate Date/Time
#'
#' Aggregates a date/time vector
#'
#' The possible units values are 'seconds', 'minutes', 'hours', 'days', 'months'
#'  or 'years'.
#'
#' @inheritParams params
#'
#' @return The floored date/time vector.
#' @export
#'
#' @examples
#' dtt_aggregate(as.Date(c("1992-01-01", "1991-02-02", "1991-03-03")), "years")
dtt_aggregate <- function(x, units, ...) {
  UseMethod("dtt_aggregate")
}

#' @describeIn dtt_aggregate Aggregate a Date vector
#' @export
dtt_aggregate.Date <- function(x, units = "days", ...) {
  chk_unused(...)
  x <- dtt_floor(x, units = units)
  unique(x)
}

#' @describeIn dtt_aggregate Aggregate a POSIXct vector
#' @export
dtt_aggregate.POSIXct <- function(x, units = "seconds", ...) {
  chk_unused(...)
  x <- dtt_floor(x, units = units)
  unique(x)
}

#' @describeIn dtt_aggregate Aggregate a hms vector
#' @export
dtt_aggregate.hms <- function(x, units = "seconds", ...) {
  chk_unused(...)
  x <- dtt_floor(x, units = units)
  x <- unique(x)
  dtt_time(x)
}
