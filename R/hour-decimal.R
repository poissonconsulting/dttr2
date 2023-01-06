#' Get Decimal Hour Values
#'
#' Gets decimal hour values for date/time vectors.
#'
#' @inheritParams params
#'
#' @return A numeric vector.
#' @family decimal
#' @seealso [dtt_hour()]
#' @export
#'
#' @examples
#' x <- as.POSIXct("1990-01-02 23:40:51")
#' dtt_hour_decimal(x)
#' x <- hms::as_hms("23:40:51")
#' dtt_hour_decimal(x)
dtt_hour_decimal <- function(x, ...) {
  UseMethod("dtt_hour_decimal")
}

#' @describeIn dtt_hour_decimal Get numeric vector of decimal hour values for a
#'   Date vector
#' @export
dtt_hour_decimal.Date <- function(x, ...) {
  chk_unused(...)
  rep(0, length(x))
}

#' @describeIn dtt_hour_decimal Get numeric vector of decimal hour values for a
#'   POSIXct vector
#' @export
dtt_hour_decimal.POSIXct <- function(x, ...) {
  dtt_hour(x) + dtt_minute_decimal(x) / 60
}

#' @describeIn dtt_hour_decimal Get numeric vector of decimal hour values for a
#'   hms vector
#' @export
dtt_hour_decimal.hms <- function(x, ...) {
  dtt_hour(x) + dtt_minute_decimal(x) / 60
}
