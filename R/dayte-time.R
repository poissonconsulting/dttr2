#' Dayte Time
#'
#' @inheritParams params
#'
#' @return A Date vector with the year set to year.
#' @return A POSIXct vector of the dayte times.
#' @family dayte
#' @export
#'
#' @examples
#' dtt_dayte_time(as.POSIXct(c("2001-01-01 12:13:14", "2015-12-13"), tz = "Etc/GMT+10"))
dtt_dayte_time <- function(x, ...) {
  UseMethod("dtt_dayte_time")
}

#' @describeIn dtt_dayte_time Dayte Time a Date vector
#' @export
dtt_dayte_time.Date <- function(x, start = 1L, tz = dtt_default_tz(), ...) {
  chk_unused(...)
  x <- dtt_date_add_time(x, dtt_time(0), tz = tz)
  dtt_dayte_time(x, start = start)
}

#' @describeIn dtt_dayte_time Dayte Time a POSIXct vector
#' @export
dtt_dayte_time.POSIXct <- function(x, start = 1L, ...) {
  chk_unused(...)
  daytte(x, start = start)
}
