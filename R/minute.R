#' Get and Set Minute Values
#'
#' Gets and sets minute values for date/time vectors.
#'
#' @param x A date/time vector.
#' @param value A integer vector of the minute value(s).
#' @param ... Unused.
#' @return An integer vector (or the modified date/time vector).
#' @export
#'
#' @examples
#' x <- as.POSIXct("1990-01-02 23:40:51")
#' dtt_minute(x)
#' dtt_minute(x) <- 27L
#' x
#'
#' x <- hms::as_hms("23:40:51")
#' dtt_minute(x)
#' dtt_minute(x) <- 27L
#' x
dtt_minute <- function(x, ...) {
  UseMethod("dtt_minute")
}

#' @rdname dtt_minute
#' @export
`dtt_minute<-` <- function(x, value) {
  UseMethod("dtt_minute<-")
}

#' @describeIn dtt_minute Get integer vector of minute values for a Date vector
#' @export
dtt_minute.Date <- function(x, ...) {
  chk_unused(...)
  rep(0L, length(x))
}

#' @describeIn dtt_minute Get integer vector of minute values for a POSIXct vector
#' @export
dtt_minute.POSIXct <- function(x, ...) {
  chk_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$min)
}

#' @describeIn dtt_minute Get integer vector of minute values for a hms vector
#' @export
dtt_minute.hms <- function(x, ...) {
  chk_unused(...)
  x <- dtt_time(x)
  x <- as.POSIXlt(x)
  as.integer(x$min)
}

#' @describeIn dtt_minute Set minute values for a POSIXct vector
#' @export
`dtt_minute<-.POSIXct` <- function(x, value) {
  chk_whole_numeric(value)
  chk_range(value, c(0L, 59L))
  chk_subset(length(value), c(1L, length(x)))

  if (!length(x)) {
    return(x)
  }
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$min <- value
  as.POSIXct(format(x), tz = tz)
}

#' @describeIn dtt_minute Set minute values for a hms vector
#' @export
`dtt_minute<-.hms` <- function(x, value) {
  chk_whole_numeric(value)
  chk_range(value, c(0L, 59L))
  chk_subset(length(value), c(1L, length(x)))

  if (!length(x)) {
    return(x)
  }
  x <- as.POSIXlt(x)
  x$min <- value
  dtt_time(x)
}
