#' Subtract Time Units
#'
#' Subtract time units from a date time vector.
#'
#' @inheritParams params
#'
#' @return The modified date time vector.
#' @family subtract
#' @seealso [dtt_add_units()]
#' @export
#'
#' @examples
#' dtt_subtract_units(as.Date("1999-12-31"), 2L, "days")
dtt_subtract_units <- function(x, n = 1L, units = dtt_units(x)) {
  dtt_add_units(x, units = units, n = n * -1L)
}
#' Subtract Years
#' @rdname dtt_subtract_units
#' @export
dtt_subtract_years <- function(x, n = 1L) {
  dtt_add_years(x, n * -1L)
}

#' Subtract Months
#' @rdname dtt_subtract_units
#' @export
dtt_subtract_months <- function(x, n = 1L) {
  dtt_add_months(x, n * -1L)
}

#' Subtract Days
#' @rdname dtt_subtract_units
#' @export
dtt_subtract_days <- function(x, n = 1L) {
  dtt_add_days(x, n * -1L)
}

#' Subtract Hours
#' @rdname dtt_subtract_units
#' @export
dtt_subtract_hours <- function(x, n = 1L) {
  dtt_add_hours(x, n * -1L)
}
#' Subtract Minutes
#' @rdname dtt_subtract_units
#' @export
dtt_subtract_minutes <- function(x, n = 1L) {
  dtt_add_minutes(x, n * -1L)
}

#' Subtract Seconds
#' @rdname dtt_subtract_units
#' @export
dtt_subtract_seconds <- function(x, n = 1L) {
  dtt_add_seconds(x, n * -1L)
}
