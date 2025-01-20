#' Convert Excel times to times.
#'
#' Converts Excel times encoded as a fraction of a day to hms class.
#'
#' @inheritParams params
#' @param x A vector of numbers to convert.
#'
#' @return A floored hms vector.
#' @family floor
#' @export
#'
#' @examples
#' dtt_excel_to_time(0.5)
#' dtt_excel_to_time(0.25)
#' dtt_excel_to_time(0.75)
dtt_excel_to_time <- function(x, ...) {
  chk::chk_numeric(x)
  chk_unused(...)
  
  excel_time <- x * 24
  hour <- floor(excel_time)
  minute <- excel_time %% 1 
  minute <- minute * 60
  second <- minute %% 1
  second <- second * 60
  minute <- floor(minute)
  second <- round(second)
  
  dtt_time_from_ints(hour, minute, second)
}
