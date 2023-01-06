#' Get Decimal Year Values
#'
#' Gets decimal year values for date/time vectors.
#'
#' @inheritParams params
#'
#' @return A numeric vector.
#' @family decimal
#' @seealso [dtt_year()]
#' @export
#'
#' @examples
#' x <- as.Date("1990-01-02")
#' dtt_year_decimal(x)
dtt_year_decimal <- function(x, ...) {
  UseMethod("dtt_year_decimal")
}

#' @describeIn dtt_year_decimal Get numeric vector of decimal year values for a
#'   Date vector
#' @export
dtt_year_decimal.Date <- function(x, ...) {
  dtt_year(x) + (dtt_doy(x) - 1) / dtt_days_in_year(x)
}

#' @describeIn dtt_year_decimal Get numeric vector of decimal year values for a
#'   POSIXct vector
#' @export
dtt_year_decimal.POSIXct <- function(x, ...) {
  dtt_year(x) + (dtt_doy_decimal(x) - 1) / dtt_days_in_year(x)
}
