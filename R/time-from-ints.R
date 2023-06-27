#' Create Time from Vectors
#'
#' Pass vectors of hour, minute and second values to create a time object.
#'
#' @param hour An integer of the hour between 0 and 23.The default value is hour
#'   zero.
#' @param minute An integer of the minute between 0 to 59. The default value is
#'   minute zero.
#' @param second An integer of the second between 0 to 59. The default value is
#'   second zero.
#' @details This can be very helpful when needing to create a time column in a
#'   data frame from hour, minute and second columns. Vectors must all be the
#'   same length or be of length one.
#' @return A floored hms vector.
#' @export
#' @family creates
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
#'
#' hour <- c(9, 10, 11)
#' minute <- c(15, 30, 45)
#' second <- 0
#' dtt_time_from_ints(hour, minute, second)
dtt_time_from_ints <- function(hour = 0L, minute = 0L, second = 0L) {
  chk::chk_whole_numeric(hour)
  chk::chk_range(hour, range = c(0L, 23L))
  chk::chk_whole_numeric(minute)
  chk::chk_range(minute, range = c(0L, 59L))
  chk::chk_whole_numeric(second)
  chk::chk_range(second, range = c(0L, 59L))
  chk::chk_compatible_lengths(hour, minute, second)

  time_string <- paste(hour, minute, second, sep = ":")
  na_positions <- grep("NA", time_string)
  time_string[na_positions] <- NA_character_

  times <- dtt_time(time_string)
  times
}
