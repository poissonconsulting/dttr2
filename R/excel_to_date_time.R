#' Convert Excel date times to date times.
#'
#' Converts Excel serial date times to date time class.
#'
#' @inheritParams params
#' @param x A vector of numbers to convert.
#'
#' @details Defaults to the modern Excel date encoding system. Excel for Mac
#'   2008 and earlier Mac versions of Excel use a different date system. If the
#'   date 2016-01-01 is represented by 42370, it's the modern system. If it's
#'   40908, it's the old system.
#'
#' @return A floored POSIXct vector.
#' @export
#'
#' @examples
#' dtt_excel_to_date_time(42370.1234)
#' dtt_excel_to_date_time(c(1000.1145, 43397.84578))
#' dtt_excel_to_date_time(45324.1234, tz = "UTC")
#' dtt_excel_to_date_time(42370.1234, modern = FALSE)
dtt_excel_to_date_time <- function(x, tz = dtt_default_tz(),
                                   modern = TRUE, ...) {
  chk::chk_numeric(x)
  chk::chk_string(tz)
  chk::chk_flag(modern)
  chk::chk_unused(...)

  if (length(x) == 0) {
    return(dtt_date_time(integer(0)))
  }

  # get date portion
  date <- floor(x)
  origin <- if (modern) as.Date("1899-12-30") else as.Date("1904-01-01")
  date <- dtt_date(date, origin = origin)

  # get time portion
  hour <- x %% 1
  hour <- hour * 24

  minute <- hour %% 1
  minute <- minute * 60

  second <- minute %% 1
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
