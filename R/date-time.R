#' Date Time
#' 
#' Coerces vectors to floored POSIXct vectors.
#'
#' @param x A vector.
#' @param time A hms vector of the time.
#' @param date A Date vector of the date.
#' @param tz A string of the time zone.
#' @param ... Unused.
#'
#' @return A floored POSIXct vector.
#' @export
#'
#' @examples
#' dtt_date_time(1L)
#' dtt_date_time(-1)
#' dtt_date_time(1, tz = "Etc/GMT+8")
#' dtt_date_time(as.Date("2000-01-02"))
#' dtt_date_time(as.Date("2000-01-02"), time = hms::as.hms("04:05:06"))
dtt_date_time <- function(x, ...) {
  UseMethod("dtt_date_time")
}

#' @describeIn dtt_date_time Coerce integer vector to a floored POSIXct vector
#' @export
dtt_date_time.integer <- function(
  x, tz = dtt_default_tz(), ...) {
  check_unused(...)
  check_string(tz)
  as.POSIXct(x, tz = tz, origin = as.POSIXct("1970-01-01", tz = "GMT"))
}

#' @describeIn dtt_date_time Coerce double vector to a floored POSIXct vector
#' @export
dtt_date_time.double <- function(
  x, tz = dtt_default_tz(), ...) {
  check_unused(...)
  dtt_date_time(as.integer(floor(x)), tz = tz)
}

#' @describeIn dtt_date_time Coerce character vector to a floored POSIXct vector
#' @export
dtt_date_time.character <- function(x, tz = dtt_default_tz(), ...) {
  check_unused(...)
  check_string(tz)
  dtt_floor(as.POSIXct(x, tz = tz))
}

#' @describeIn dtt_date_time Coerce Date vector to a floored POSIXct vector
#' @export
dtt_date_time.Date <- function(x, time = hms::as.hms("00:00:00"), tz = dtt_default_tz(), ...) {
  check_unused(...)
  check_string(tz)
  check_vector(time, hms::as.hms("00:00:00"), length = c(1L, 1L, length(x)))
  
  if(!length(x)) return(dtt_date_time(integer(0), tz = tz))
  
  x <- dtt_date(x)
  time <- dtt_time(time)
  
  dtt_set_tz(dtt_adjust_tz(as.POSIXct(x), "UTC"), tz) + time
}

#' @describeIn dtt_date_time Coerce POSIXct vector to a floored POSIXct vector
#' @export
dtt_date_time.POSIXct <- function(x, tz = dtt_tz(x), ...) {
  check_unused(...)
  x <- dtt_adjust_tz(x, tz = tz)
  dtt_floor(x)
}

#' @describeIn dtt_date_time Coerce hms vector to a floored POSIXct vector
#' @export
dtt_date_time.hms <- function(
  x, date = dtt_date("1970-01-01"), tz = dtt_default_tz(), ...) {
  check_unused(...)
  check_vector(date, Sys.Date(), length = c(1L, 1L, length(x)))
  check_string(tz)
  
  if(!length(x)) return(dtt_date_time(integer(0), tz = tz))

  date <- dtt_date(date)
  x <- dtt_time(x)
  
  dtt_set_tz(dtt_adjust_tz(as.POSIXct(date), "UTC"), tz) + x
}
