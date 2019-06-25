#' Time
#'
#' Coerces vectors to floored (and wrapped) hms vectors.
#' 
#' @param x A vector.
#' @param ... Unused.
#'
#' @return A floored hms vector.
#' @export
#' @examples 
#' dtt_time(1L)
#' dtt_time(1.999)
#' dtt_time(-0.001)
#' dtt_time(Sys.Date())
#' dtt_time(as.POSIXct("2001-01-01 02:30:40"))
#' dtt_time(as.POSIXct("2001-01-01 02:30:40", tz = "Etc/GMT-8"))
dtt_time <- function(x, ...) {
  UseMethod("dtt_time")
}

#' @describeIn dtt_time Coerce integer vector to a floored hms vector
#' @export
dtt_time.integer <- function(x, ...) {
  check_unused(...)
  dtt_wrap(as.hms(x))
}

#' @describeIn dtt_time Coerce double vector to a floored hms vector
#' @export
dtt_time.double <- function(x, ...) {
  check_unused(...)
  dtt_time(as.integer(floor(x)))
}

#' @describeIn dtt_time Coerce character vector to a floored hms vector
#' @export
dtt_time.character <- function(x, ...) {
  check_unused(...)
  dtt_time(as.hms(x))
}

#' @describeIn dtt_time Coerce Date vector to a floored hms vector
#' @export
dtt_time.Date <- function(x, ...) {
  check_unused(...)
  dtt_time(rep(0L, length(x)))
}

#' @describeIn dtt_time Coerce hms vector to a floored hms vector
#' @export
dtt_time.hms <- function(x, ...) {
  check_unused(...)
  dtt_wrap(dtt_floor(x))
}

#' @describeIn dtt_time Coerce POSIXct vector to a floored hms vector
#' @export
dtt_time.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- hms::hms(dtt_second(x), dtt_minute(x), dtt_hour(x))
  dtt_time(x)
}

#' @describeIn dtt_time Coerce POSIXlt vector to a floored hms vector
#' @export
dtt_time.POSIXlt <- function(x, ...) {
  check_unused(...)
  x <- data.frame(seconds = x$sec, minutes = x$min, hours = x$hour)
  do.call("hms", x)
}
