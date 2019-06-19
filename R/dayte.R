#' Dayte
#'
#' @param x A date time vector.
#' @param start An integer scalar of the starting month or a Date scalar of the starting date.
#' @return A Date vector with the year set to year.
#' @param ... Unused.
#' @return A Date vector of the daytes.
#' @export
#'
#' @examples
#' dtt_dayte(as.Date(c("2001-01-01", "2015-12-13")))
dtt_dayte <- function(x, ...) {
  UseMethod("dtt_dayte")
}

#' @describeIn dtt_dayte Dayte a Date vector
#' @export
dtt_dayte.Date <- function(x, start = 1L, ...) {
  check_unused(...)
  daytte(x, start = start)
}

#' @describeIn dtt_dayte Dayte a POSIXct vector
#' @export
dtt_dayte.POSIXct <- function(x, start = 1L,...) {
  check_unused(...)
  dtt_dayte(dtt_date(x), start = start)
}
