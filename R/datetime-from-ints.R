#' Create datetimes from integers 
#'
#' @param year 
#' @param month 
#' @param day 
#' @param hour 
#' @param minute 
#' @param second 
#' @param tz 
#'
#' @return
#' @export
#'
#' @examples
dtt_datetime_from_ints <- function(year = 1970L , month = 1L, day = 1L, hour = 0L,
                               minute = 0L, second = 0L, tz = dtt_default_tz()) {
  chk::chk_whole_number(year)
  chk::chk_gte(year, 0) # ask Joe if there is a better range for this 
  chk::chk_whole_number(month)
  chk::chk_range(month, range = c(1L, 12L))
  chk::chk_whole_number(day)
  chk::chk_range(day, range = c(1L, 31L))
  chk::chk_whole_number(hour)
  chk::chk_range(hour, range = c(0L, 23L))
  chk::chk_whole_number(minute)
  chk::chk_range(minute, range = c(0L, 59L))
  chk::chk_whole_number(second)
  chk::chk_range(second, range = c(0L, 59L))
  chk::chk_string(tz)
  
}