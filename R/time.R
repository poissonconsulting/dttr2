#' Floor Time
#'
#' Coerces vectors to floored (and wrapped) hms vectors.
#'
#' @inheritParams params
#' @param x A vector.
#' @param value A time vector.
#'
#' @return A floored hms vector.
#' @family floor
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

#' @rdname dtt_time
#' @export
`dtt_time<-` <- function(x, value) {
  UseMethod("dtt_time<-")
}

#' @describeIn dtt_time Coerce integer vector to a floored hms vector
#' @export
dtt_time.integer <- function(x, ...) {
  chk_unused(...)
  dtt_wrap(as_hms(x))
}

#' @describeIn dtt_time Coerce double vector to a floored hms vector
#' @export
dtt_time.double <- function(x, ...) {
  chk_unused(...)
  dtt_time(as.integer(floor(x)))
}

#' @describeIn dtt_time Coerce character vector to a floored hms vector
#' @export
dtt_time.character <- function(x, ...) {
  chk_unused(...)
  dtt_time(as_hms(x))
}

#' @describeIn dtt_time Coerce Date vector to a floored hms vector
#' @export
dtt_time.Date <- function(x, ...) {
  chk_unused(...)
  dtt_time(rep(0L, length(x)))
}

#' @describeIn dtt_time Coerce hms vector to a floored hms vector
#' @export
dtt_time.hms <- function(x, ...) {
  chk_unused(...)
  dtt_wrap(dtt_floor(x))
}

#' @describeIn dtt_time Coerce POSIXct vector to a floored hms vector
#' @export
dtt_time.POSIXct <- function(x, ...) {
  chk_unused(...)
  x <- hms::hms(dtt_second(x), dtt_minute(x), dtt_hour(x))
  dtt_time(x)
}

#' @describeIn dtt_time Coerce POSIXlt vector to a floored hms vector
#' @export
dtt_time.POSIXlt <- function(x, ...) {
  chk_unused(...)
  x <- data.frame(seconds = x$sec, minutes = x$min, hours = x$hour)
  do.call("hms", x)
}

#' @describeIn dtt_time Set time values for a Date vector
#' @export
`dtt_time<-.Date` <- function(x, value) {
  x <- dtt_date_time(x)
  dtt_time(x) <- value
  x
}

#' @describeIn dtt_time Set time values for a POSIXct vector
#' @export
`dtt_time<-.POSIXct` <- function(x, value) {
  chk_s3_class(value, "hms")
  chk_subset(length(value), c(1L, length(x)))

  if (!length(x)) {
    return(x)
  }
  value <- dtt_time(value)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$hour <- dtt_hour(value)
  x$min <- dtt_minute(value)
  x$sec <- dtt_second(value)
  as.POSIXct(format(x), tz = tz)
}
