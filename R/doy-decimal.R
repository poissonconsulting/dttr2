#' Day of the Year Decimal
#'
#' @inheritParams params
#' @param x A Date or POSIXct vector.
#'
#' @return A numeric vector between 0 and 366 of the day of the year.
#' @family decimal
#' @seealso [dtt_doy()]
#' @export
#'
#' @examples
#' dtt_doy_decimal(Sys.Date())
dtt_doy_decimal <- function(x, ...) {
  UseMethod("dtt_doy_decimal")
}

#' @export
dtt_doy_decimal.Date <- function(x, ...) {
  as.numeric(dtt_doy(x))
}

#' @export
dtt_doy_decimal.POSIXct <- function(x, ...) {
  dtt_doy(x) + dtt_hour_decimal(x) / 24
}
