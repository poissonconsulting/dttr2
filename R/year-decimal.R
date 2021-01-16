#' Get Decimal Year Values
#'
#' Gets decimal year values for date/time vectors.
#'
#' @param x A date/time vector.
#' @param ... Unused.
#' @return A numeric vector.
#' @export
#'
#' @examples
#' x <- as.Date("1990-01-02")
#' dtt_year_decimal(x)
#'
dtt_year_decimal <- function(x, ...) {
  UseMethod("dtt_year_decimal")
}

#' @describeIn dtt_year Get numeric vector of decimal year values for a Date vector
#' @export
dtt_year_decimal.Date <- function(x, ...) {
  chk_unused(...)
  year <- dtt_year(x)
  doy <- dtt_doy(x) - 0.5
  
  year + doy / dtt_days_of_year(x)
}

#' @describeIn dtt_year Get numeric vector of decimal year values for a POSIXct vector
#' @export
dtt_year_decimal.POSIXct <- function(x, ...) {
  chk_unused(...)
  .NotYetImplemented()
}
