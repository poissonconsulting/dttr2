#' Get Decimal Month Values
#'
#' Gets decimal month values for date/time vectors.
#'
#' @inheritParams params
#'
#' @return A numeric vector.
#' @family decimal
#' @seealso [dtt_month()]
#' @export
#'
#' @examples
#' x <- as.POSIXct("1990-01-03 10:00:01")
#' dtt_month_decimal(x)
dtt_month_decimal <- function(x, ...) {
  UseMethod("dtt_month_decimal")
}

#' @describeIn dtt_month_decimal Get numeric vector of decimal year values for a Date vector
#' @export
dtt_month_decimal.Date <- function(x, ...) {
  dtt_month(x) + (dtt_day_decimal(x) - 1) / dtt_days_in_month(x)
}

#' @describeIn dtt_month_decimal Get numeric vector of decimal year values for a POSIXct vector
#' @export
dtt_month_decimal.POSIXct <- function(x, ...) {
  dtt_month(x) + (dtt_day_decimal(x) - 1) / dtt_days_in_month(x)
}
