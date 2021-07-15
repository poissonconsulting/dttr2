#' Days in the Year
#'
#' @param x A Date or POSIXct vector.
#' @return A integer vector of 365 and 366 indicates the days of the year.
#' @family days
#' @export
#'
#' @examples
#' dtt_days_in_year(as.Date(c("2000-10-11", "2001-01-01")))
dtt_days_in_year <- function(x) {
  x <- ifelse(dtt_leap_year(x), 366L, 365L)
  as.integer(x)
}
