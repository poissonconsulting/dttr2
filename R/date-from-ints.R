#' Create Dates from Integers
#'
#' Create date object from vectors of year, month and day values.
#'
#' @param year An integer of the year. The default value is 1972.
#' @param month An integer of the month between 1 and 12. The default value is
#'   the 1st month.
#' @param day An integer of the day between 1 and 31. The default value is the
#'   1st day.
#' @details This can be very helpful when needing to create a date column in a
#'   data frame from year, month and days columns. Vectors must all be the same
#'   length or be of length one.
#' @return A floored Date vector.
#' @export
#' @family creates
#' @examples
#' dtt_date_from_ints(
#'   year = 1991,
#'   month = 07,
#'   day = 23
#' )
#'
#' dtt_date_from_ints(
#'   year = c(1991, 1992, 1993),
#'   month = c(07, 07, 07),
#'   day = c(23, 24, 21)
#' )
#'
#' year_vals <- c(1991, 1992, 1993)
#' month_vals <- c(07, 07, 07)
#' day_vals <- c(23, 24, 21)
#' dtt_date_from_ints(year_vals, month_vals, day_vals)
#'
#' year_vals <- 2022
#' month_vals <- 1:12
#' day_vals <- 15
#' dtt_date_from_ints(year_vals, month_vals, day_vals)
#'
#' dtt_date_from_ints(year_vals, month_vals)
dtt_date_from_ints <- function(year = 1972L, month = 1L, day = 1L) {
  chk::chk_whole_numeric(year)
  chk::chk_range(year, range = c(0L, 9999L))
  chk::chk_whole_numeric(month)
  chk::chk_range(month, range = c(1L, 12L))
  chk::chk_whole_numeric(day)
  chk::chk_range(day, range = c(1L, 31L))
  chk::chk_compatible_lengths(year, month, day)

  date_string <- paste(year, month, day, sep = "-")
  na_positions <- grep("NA", date_string)
  date_string[na_positions] <- NA_character_

  dates <- dtt_date(date_string)
  dates
}
