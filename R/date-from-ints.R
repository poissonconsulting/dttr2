#' Create dates from integers
#'
#' @param year 
#' @param month 
#' @param day 
#' @param tz 
#'
#' @return
#' @export
#'
#' @examples
dtt_date_from_ints <- function(year = 1970L , month = 1L, day = 1L) {
  
  chk::chk_whole_number(year)
  chk::chk_gte(year, 0) # ask Joe if there is a better range for this 
  chk::chk_whole_number(month)
  chk::chk_range(month, range = c(1L, 12L))
  chk::chk_whole_number(day)
  chk::chk_range(day, range = c(1L, 31L))
  
  
  
  
  
  
  
}