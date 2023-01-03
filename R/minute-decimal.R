#' Get Decimal Minute Values
#'
#' Gets decimal minute values for date/time vectors.
#'
#' @inheritParams params
#'
#' @return A numeric vector.
#' @family decimal
#' @seealso [dtt_minute()]
#' @export
#'
#' @examples
#' x <- as.POSIXct("1990-01-02 23:40:51")
#' dtt_minute_decimal(x)
#' x <- hms::as_hms("23:40:51")
#' dtt_minute_decimal(x)
dtt_minute_decimal <- function(x, ...) {
  UseMethod("dtt_minute_decimal")
}

#' @describeIn dtt_minute_decimal Get numeric vector of decimal minute values
#'   for a Date vector
#' @export
dtt_minute_decimal.Date <- function(x, ...) {
  rep(0, length(x))
}

#' @describeIn dtt_minute_decimal Get numeric vector of decimal minute values
#'   for a POSIXct vector
#' @export
dtt_minute_decimal.POSIXct <- function(x, ...) {
  dtt_minute(x) + dtt_second(x) / 60
}

#' @describeIn dtt_minute_decimal Get numeric vector of decimal minute values
#'   for a hms vector
#' @export
dtt_minute_decimal.hms <- function(x, ...) {
  dtt_minute(x) + dtt_second(x) / 60
}
