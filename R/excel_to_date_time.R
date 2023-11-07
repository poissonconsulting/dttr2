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
dtt_excel_to_date_time <- function(x, modern = TRUE, tz = dtt_default_tz(), ...) {
  chk::chk_unused(...)
  chk::chk_flag(modern)
  chk::chk_numeric(x)
  chk::chk_string(tz)
  
  # get date portion
  date <- floor(x)
  date <- dtt_date(date, origin = origin)
  
  # get time portion
  hour <- x%%1
  hour <- hour * 24
  
  minute <- hour%%1
  minute <- minute * 60
  
  second <- minute%%1
  second <- second * 60
  
  hour <- floor(hour)
  minute <- floor(minute)
  second <- floor(second)
  
  time <- dtt_time_from_ints(hour, minute, second)
  # combine to be date time 
  
  dtt_date_time(paste(date, time), tz = tz)
}


# # step 1, date needs to be floored to get date time 
# 
# date <- floor(x)
# date <- dtt_date(date, origin = origin)
# 
# # step 2, get the decimal portion which is the time  so .1234 is always 2:57:27 am
# 
# hour <- x%%1
# hour <- hour * 24
# 
# minute <- hour%%1
# minute <- minute * 60
# 
# second <- minute%%1
# second <- second * 60
# 
# hour <- floor(hour)
# minute <- floor(minute)
# second <- floor(second)
# ## how does excel convert the time? as fractional of the day 
# 
# time <- dtt_time_from_ints(hour, minute, second)
# 
# # step 3, create date time and add time zone info 
# tz <- "UTC"
# dtt_date_time(paste(date, time), tz = tz)
# 
# 
# 
