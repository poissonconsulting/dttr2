#' Create time from vectors
#'
#' @param hour An integer of the hour between 0 and 23.The default value is hour
#'   zero.
#' @param minute An integer of the minute between 0 to 59. The default value is
#'   minute zero.
#' @param second An integer of the second between 0 to 59. The default value is
#'   second zero.
#'
#' @return A floored hms vector.
#' @export
#'
#' @examples
#' dtt_time_from_ints()
#'
#' dtt_time_from_ints(
#'   hour = 10,
#'   minute = 15,
#'   second = 30
#' )
#'
#' dtt_time_from_ints(
#'   hour = c(10, 11),
#'   minute = c(15, 15),
#'   second = c(30, 0)
#' )
dtt_time_from_ints <- function(hour = 0L, minute = 0L, second = 0L) {
  chk::chk_whole_numeric(hour)
  chk::chk_range(hour, range = c(0L, 23L))
  chk::chk_whole_numeric(minute)
  chk::chk_range(minute, range = c(0L, 59L))
  chk::chk_whole_numeric(second)
  chk::chk_range(second, range = c(0L, 59L))

  ### check length of each vector before proceeding
  
  times <- dtt_time(paste(hour, minute, second, sep = ":"))
  times
}
