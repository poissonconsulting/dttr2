
#' @export
as.POSIXct.character <- function(x, tz = "", ...) {
  x <- add_hms_date_time(x)
  as.POSIXct(as.POSIXlt(x, tz = tz), tz = tz)
}
