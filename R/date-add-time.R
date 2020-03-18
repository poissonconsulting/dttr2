#' Date Add Time
#' 
#' Adds times to Dates vector and sets timezone in a single function.
#' @param x A Date vector.
#' @param time A hms vector.
#' @param tz A string of the timezone.
#' @return A POSIXct vector.
#' @export
#' @examples 
#' dtt_date_add_time(as.Date("2001-03-05"), hms::as_hms("06:07:08"), tz = "Etc/GMT+9")
dtt_date_add_time <- function(x, time, tz = dtt_default_tz()) {
  chk_s3_class(x, "Date")
  chk_s3_class(time, "hms")
  chk_subset(length(time), c(1L, length(x)))
  chk_tz(tz)

  if (!length(x)) {
    return(dtt_date_time(integer(0), tz = tz))
  }

  x <- dtt_date_time(x, tz = tz)
  dtt_time(x) <- dtt_time(time)
  x
}