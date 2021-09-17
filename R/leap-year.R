#' Test for Leap Year
#'
#' Tests whether each year is a leap year.
#'
#' @inheritParams params
#'
#' @return A logical vector indicating whether each year is a leap year.
#' @family leap year
#' @export
#'
#' @examples
#' dtt_leap_year(as.Date("1999-03-04", "2000-02-01"))
dtt_leap_year <- function(x) {
  year <- dtt_year(x)
  (year %% 4 == 0) & ((year %% 100 != 0) | (year %% 400 == 0))
}
