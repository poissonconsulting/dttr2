#' Get Week Day
#'
#' Gets the week days for the locale.
#'
#' @param x A date/time vector.
#' @param abbr A flag specifying whether to abbreviate the week days.
#' @param ... Unused.
#' @return An character vector of the week days.
#' @export
#'
#' @examples
#' x <- as.Date("1990-01-02")
#' dtt_wday(x)
#'
#' x <- as.POSIXct("1990-01-02 23:40:51")
#' dtt_wday(x, abbr = TRUE)
dtt_wday <- function(x, abbr = FALSE, ...) {
  UseMethod("dtt_wday")
}

#' @describeIn dtt_wday Get character vector of week days for a Date vector
#' @export
dtt_wday.default <- function(x, abbr = FALSE, ...) {
  chk_flag(abbr)
  chk_unused(...)
  x <- dtt_floor(x)
  format <- if(abbr) "%a" else "%A"
  format(x, format)
}
