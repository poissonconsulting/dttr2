#' Decade
#'
#' @inheritParams params
#'
#' @return A integer vector of the decade.
#' @export
#'
#' @examples
#' dtt_decade(as.Date(c("2001-01-01", "2015-12-13")))
dtt_decade <- function(x, ...) {
  UseMethod("dtt_decade")
}

#' @describeIn dtt_decade Decade a Date vector
#' @export
dtt_decade.Date <- function(x, ...) {
  chk_unused(...)
  year <- dtt_year(x)
  year <- year / 10
  year <- floor(year)
  year <- year * 10
  year <- as.integer(year)
  year
}
