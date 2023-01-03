#' Create datetimes from integers
#'
#' @param year An integer of the year. The default value is 1970.
#' @param month An integer of the month between 1 and 12. The default value is
#'   the 1st month.
#' @param day An integer of the day between 1 and 31. The default value is the
#'   1st day.
#' @param hour An integer of the hour between 0 and 23.The default value is hour
#'   zero.
#' @param minute An integer of the minute between 0 to 59. The default value is
#'   minute zero.
#' @param second An integer of the second between 0 to 59. The default value is
#'   second zero.
#' @param tz A string of the time zone.
#'
#' @return A POSIXct vector
#' @export
#'
#' @examples
#' dtt_date_time_from_ints(
#'   year = 1991,
#'   month = 07,
#'   day = 23,
#'   hour = 06,
#'   minute = 25,
#'   second = 0,
#'   tz = "Etc/GMT+8"
#' )
#'
#' dtt_date_time_from_ints(
#'   year = c(1991, 1992, 1993),
#'   month = c(07, 07, 07),
#'   day = c(23, 24, 21),
#'   hour = c(06, 05, 07),
#'   minute = c(25, 24, 15),
#'   second = c(0, 0, 0),
#'   tz = "Etc/GMT+8"
#' )
dtt_date_time_from_ints <- function(year = 1970L, month = 1L, day = 1L,
                                    hour = 0L, minute = 0L, second = 0L,
                                    tz = dtt_default_tz()) {
  chk::chk_whole_numeric(year)
  chk::chk_gte(year, 0)
  chk::chk_whole_numeric(month)
  chk::chk_range(month, range = c(1L, 12L))
  chk::chk_whole_numeric(day)
  chk::chk_range(day, range = c(1L, 31L))
  chk::chk_whole_numeric(hour)
  chk::chk_range(hour, range = c(0L, 23L))
  chk::chk_whole_numeric(minute)
  chk::chk_range(minute, range = c(0L, 59L))
  chk::chk_whole_numeric(second)
  chk::chk_range(second, range = c(0L, 59L))
  chk::chk_string(tz)

  datetimes <- dtt_date_time(
    dtt_date(paste(year, month, day, sep = "-")),
    dtt_time(paste(hour, minute, second, sep = ":")),
    tz = tz
  )
  datetimes
}
