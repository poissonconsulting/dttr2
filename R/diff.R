#' Time Difference
#'
#' Gets the time difference in secs, minutes, hours, days or weeks.
#' Uses difftime() but floors x and y first after coercing to POSIXct
#' and adjusts the timezone of y to match that of x.
#'
#' @inheritParams params
#' @param x An object that can be coerced to a POSIXct using dtt_date_time().
#'
#' @return A numeric vector of the time difference.
#' @export
#' @examples
#' dtt_diff(as.Date(c("2001-01-02", "2000-12-31")), as.Date("2001-01-01"), "hours")
#' dtt_diff(as.Date("2001-01-02"), as.Date("2001-01-01"), "weeks")
dtt_diff <- function(x, y, units = "secs", as_difftime = FALSE) {
  chk_string(units)
  chk_subset(units, c("secs", "mins", "hours", "days", "weeks"))
  chk_flag(as_difftime)

  x <- dtt_date_time(x)
  y <- dtt_date_time(y)
  y <- dtt_adjust_tz(y, tz = dtt_tz(x))
  diff <- difftime(x, y, units = units)
  if (as_difftime) {
    return(diff)
  }
  as.numeric(diff)
}
