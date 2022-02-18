#' Convert Excel dates to dates.
#'
#' Converts Excel dates encoded as serial numbers to date class.
#' 
#' Defaults to the modern Excel date encoding system. Excel for Mac 2008 and 
#' earlier Mac versions of Excel use a different date system. If the date 
#' 2016-01-01 is represented by 42370, it's the modern system. 
#' If it's 40908, it's the old system.
#'
#' @inheritParams params
#' @param x A vector of numbers to convert.
#' @param modern A flag specifying whether to use the modern or old Excel date system.
#'
#' @return A floored Date vector.
#' @family floor
#' @export
#'
#' @examples
#' dtt_excel_to_date(42370)
#' dtt_excel_to_date(40908, modern = FALSE)
dtt_excel_to_date <- function(x, modern = TRUE, ...) {
  chk_unused(...)
  chk_flag(modern)
  chk_numeric(x)
  origin <- if(modern) as.Date("1899-12-30") else as.Date("1904-01-01")
  dtt_date(x, origin = origin)
}

