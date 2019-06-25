#' Floor
#' 
#' Floors a date/time vector
#'
#' @param x A date/time vector.
#' @param units A string of the units to floor by.
#' @param ... Unused.
#' @return The floored date/time vector.
#' @export
#'
#' @examples
#' dtt_floor(hms::as.hms("23:59:59"), "hours")
dtt_floor <- function(x, units, ...) {
  UseMethod("dtt_floor")
}

#' @describeIn dtt_floor Floor a Date vector
#' @export
dtt_floor.Date <- function(x, units = "days", ...) {
  check_scalar(units, c("days", "months", "years"))
  check_unused(...)
  
  if(!length(x)) return(x)

  if(units == "days") {
    x <- unclass(x)
    x <- floor(x)
    class(x) <- "Date"
    return(x)
  }
  dtt_day(x) <- 1L
  if(identical(units, "months")) return(x)
  dtt_month(x) <- 1L
  x
}

#' @describeIn dtt_floor Floor a POSIXct vector
#' @export
dtt_floor.POSIXct <- function(x, units = "seconds", ...) {
  check_scalar(units, .units_POSIXct)
  check_unused(...)
  
  if(!length(x)) return(x)
  
  if(identical(units, "seconds")) {
    tz <- dtt_tz(x)
    x <- unclass(x)
    x <- floor(x)
    return(dtt_date_time(x, tz = tz))
  }
  dtt_second(x) <- 0L
  if(identical(units, "minutes")) return(x)
  dtt_minute(x) <- 0L
  if(identical(units, "hours")) return(x)
  dtt_hour(x) <- 0L
  if(identical(units, "days")) return(x)
  dtt_day(x) <- 1L
  if(identical(units, "months")) return(x)
  dtt_month(x) <- 1L
  x
}

#' @describeIn dtt_floor Floor a hms vector
#' @export
dtt_floor.hms <- function(x, units = "seconds", ...) {
  check_scalar(units, c("seconds", "minutes", "hours"))
  check_unused(...)
  
  if(!length(x)) return(x)
  
  if(identical(units, "seconds")) {
    x <- unclass(x)
    x <- floor(x)
    return(dtt_time(x))
  }
  dtt_second(x) <- 0L
  if(identical(units, "minutes")) return(x)
  dtt_minute(x) <- 0L
  x
}
