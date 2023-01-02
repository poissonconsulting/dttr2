#' Create dates from integers
#'
#' @param year An integer of the year. The default value is 1970.
#' @param month An integer of the month between 1 and 12. The default value is
#'   the 1st month.
#' @param day An integer of the day between 1 and 31. The default value is the
#'   1st day.
#'
#' @return A floored Date vector. 
#' @export
#'
#' @examples
#' dtt_date_from_ints(
#'  year = 1991,
#'  month = 07,
#'  day = 23
#' )
#' 
#' dtt_date_from_ints(
#'  year = c(1991, 1992, 1993),
#'  month = c(07, 07, 07),
#'  day = c(23, 24, 21)
#' )
dtt_date_from_ints <- function(year = 1970L , month = 1L, day = 1L) {
  
  chk::chk_whole_numeric(year)
  chk::chk_gte(year, 0) # ask Joe if there is a better range for this 
  chk::chk_whole_numeric(month)
  chk::chk_range(month, range = c(1L, 12L))
  chk::chk_whole_numeric(day)
  chk::chk_range(day, range = c(1L, 31L))
  
  dates <- dtt_date(paste(year, month, day, sep = "-"))
  dates
}
