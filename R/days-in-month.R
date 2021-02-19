#' Days in the Month
#'
#' @param x A Date or POSIXct vector.
#' @return A integer vector of 28 to 31 indicating the days in the month.
#' @family days
#' @export
#'
#' @examples
#' dtt_days_in_month(as.Date(c("2000-02-11", "2001-02-01")))
dtt_days_in_month <- function(x) {
  month <- dtt_month(x)
  days <- .days_in_month[month]
  days[month == 2L & dtt_leap_year(x)] <- 29L
  days
}
