#' Dayte Time
#'
#' @param x A date time vector.
#' @param start_month An integer vector specifying the start month of the year.
#' @param start_day An integer vector specifying the start day of the year.
#' @return A Date vector with the year set to year.
#' @param ... Unused.
#' @return A Date vector of the daytes.
#' @export
#'
#' @examples
#' dtt_dayte_time(as.POSIXct(c("2001-01-01 12:13:14", "2015-12-13"), tz = "Etc/GMT+10"))
dtt_dayte_time <- function(x, ...) {
  UseMethod("dtt_dayte_time")
}

#' @describeIn dtt_dayte_time Dayte Time a POSIXct vector
#' @export
dtt_dayte_time.POSIXct <- function(x, start_month = 1L, start_day = 1L, ...) {
  check_unused(...)
  daytte(x, start_month = start_month, start_day = start_day)
}
