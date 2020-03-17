#' Time Difference
#' 
#' Gets the time difference in secs, minutes, hours, days or weeks.
#'
#' @param x An object that can be coerced to a POSIXct using date_time.
#' @param y An object that can be coerced to a POSIXct using date_time.
#' @param units A string of the units. The possible values are 
#' "secs", "minutes", "hours", "days" or "weeks".
#' @return A numeric vector of the time difference.
#' @export
dtt_diff <- function(x, y, units = "secs") {
  chk_string(units)
  chk_subset(units, c("secs", "mins", "hours", "days"))
  x <- dtt_date_time(x)
  y <- dtt_date_time(y)
  y <- dtt_adjust_tz(y, tz = dtt_tz(x))
  diff <- difftime(x, y, units = "secs")
  diff <- as.numeric(diff)
  if(units == "secs") return(diff)
  diff <- diff / 60
  if(units == "mins") return(diff)
  diff <- diff / 60
  if(units == "hours") return(diff)
  diff <- diff / 24
  if(units == "days") return(diff)
  diff / 7
}
