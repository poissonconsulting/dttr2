#' Subtract Units
#' 
#' Subtract time units from a date time vector.
#'
#' @param x A date time vector.
#' @param units A string of the units.
#' @param n An integer of the number of units.
#'
#' @return The modified date time vector.
#' @seealso \code{\link{dtt_add_units}()}
#' @export
#'
#' @examples
#' dtt_subtract_units(as.Date("1999-12-31"), 2L, "days")
dtt_subtract_units <- function(x, n = 1L, units = dtt_units(x)) {
  dtt_add_units(x, units = units, n =  n * -1L)
}

#' @rdname dtt_subtract_units
#' @export
dtt_subtract_years <- function(x, n = 1L) {
  dtt_add_years(x, n * -1L)
}

#' @rdname dtt_subtract_units
#' @export
dtt_subtract_months <- function(x, n = 1L) {
  dtt_add_months(x, n * -1L)
}

#' @rdname dtt_subtract_units
#' @export
dtt_subtract_days <- function(x, n = 1L) {
  dtt_add_days(x, n * -1L)
}

#' @rdname dtt_subtract_units
#' @export
dtt_subtract_hours <- function(x, n = 1L) {
  dtt_add_hours(x, n * -1L)
}

#' @rdname dtt_subtract_units
#' @export
dtt_subtract_minutes <- function(x, n = 1L) {
  dtt_add_minutes(x, n * -1L)
}

#' @rdname dtt_subtract_units
#' @export
dtt_subtract_seconds <- function(x, n = 1L) {
  dtt_add_seconds(x, n * -1L)
}
