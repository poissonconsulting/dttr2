#' Wrap
#'
#' @inheritParams params
#'
#' @export
#' @examples
#' dtt_wrap(hms::as_hms("24:00:00"))
dtt_wrap <- function(x, ...) {
  UseMethod("dtt_wrap")
}

#' @export
dtt_wrap.hms <- function(x, ...) {
  chk_unused(...)
  dtt_time(as.POSIXlt(x))
}
