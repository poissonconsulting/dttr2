#' Get Decimal Day Values
#'
#' Gets decimal day values for date/time vectors.
#'
#' @inheritParams params
#'
#' @return A numeric vector.
#' @family decimal
#' @seealso [dtt_day()]
#' @export
#'
#' @examples
#' x <- as.POSIXct("1990-01-03 10:00:01")
#' dtt_day_decimal(x)
dtt_day_decimal <- function(x, ...) {
  UseMethod("dtt_day_decimal")
}

#' @describeIn dtt_day_decimal Get numeric vector of decimal year values for a
#'   Date vector
#' @export
dtt_day_decimal.Date <- function(x, ...) {
  as.numeric(dtt_day(x))
}

#' @describeIn dtt_day_decimal Get numeric vector of decimal year values for a
#'   POSIXct vector
#' @export
dtt_day_decimal.POSIXct <- function(x, ...) {
  dtt_day(x) + dtt_hour_decimal(x) / 24
}
