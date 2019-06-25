#' Wrap
#'
#' @param x A date/time vector.
#' @param ... Unused.
#' @export
#' @examples 
#' dtt_wrap(hms::as.hms("24:00:00"))
dtt_wrap <- function(x, ...) {
  UseMethod("dtt_wrap")
}

#' @export
dtt_wrap.hms <- function(x, ...) {
  check_unused(...)
  dtt_time(as.POSIXlt(x))
}
