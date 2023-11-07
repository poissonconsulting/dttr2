#' Convert Excel date times to date times.
#'
#' Converts Excel serial date times to date time class.
#'
#' @param x 
#' @param modern 
#' @param ... 
#' @param tz 
#'
#' @return
#' @export
#'
#' @examples
dtt_excel_to_date_time <- function(x, tz = dtt_default_tz(), modern = TRUE, ...) {
  chk::chk_unused(...)
  chk::chk_flag(modern)
  chk::chk_numeric(x)
  chk::chk_string(tz)
  
  if (length(x) == 0) {
    return(dtt_date_time(integer(0)))
  } 
  
  # get date portion
  date <- floor(x)
  origin <- if (modern) as.Date("1899-12-30") else as.Date("1904-01-01")
  date <- dtt_date(date, origin = origin)
  
  # get time portion
  hour <- x%%1
  hour <- hour * 24
  
  minute <- hour%%1
  minute <- minute * 60
  
  second <- minute%%1
  second <- second * 60
  
  hour <- as.integer(floor(hour))
  minute <- as.integer(floor(minute))
  second <- as.integer(floor(second))
  
  time <- dtt_time_from_ints(hour, minute, second)
  # combine to be date time 
  date_times <- paste(date, time)
  date_times <- replace(date_times, date_times == "NA NA", NA_character_)

  dtt_date_time(date_times, tz = tz)
}
