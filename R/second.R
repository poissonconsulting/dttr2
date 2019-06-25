#' Get and Set Second Values
#' 
#' Gets and sets second values for date/time vectors.
#'
#' @param x A date/time vector.
#' @param value A integer vector of the second value(s).
#' @param ... Unused.
#' @return An integer vector (or the modified date/time vector).
#' @export
#'
#' @examples
#' x <- as.POSIXct("1990-01-02 23:40:51")
#' dtt_second(x)
#' dtt_second(x) <- 27L
#' x
#' 
#' x <- hms::as.hms("23:40:51")
#' dtt_second(x)
#' dtt_second(x) <- 27L
#' x
dtt_second <- function(x, ...) {
  UseMethod("dtt_second")
}

#' @rdname dtt_second
#' @export
`dtt_second<-` <- function(x, value) {
  UseMethod("dtt_second<-")
}

#' @describeIn dtt_second Get integer vector of second values for a Date vector
#' @export
dtt_second.Date <- function(x, ...) {
  check_unused(...)
  rep(0L, length(x))
}

#' @describeIn dtt_second Get integer vector of second values for a POSIXct vector
#' @export
dtt_second.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$sec)
}

#' @describeIn dtt_second Get integer vector of second values for a time vector
#' @export
dtt_second.hms <- function(x, ...) {
  check_unused(...)
  x <- dtt_time(x)
  x <- as.POSIXlt(x)
  as.integer(x$sec)
}

#' @describeIn dtt_second Set second values for a POSIXct vector
#' @export
`dtt_second<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 59L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$sec <- value
  as.POSIXct(format(x), tz = tz)
}

#' @describeIn dtt_second Set second values for a hms vector
#' @export
`dtt_second<-.hms` <- function(x, value) {
  check_vector(value, c(0L, 59L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- as.POSIXlt(x)
  x$sec <- value
  dtt_time(x)
}
