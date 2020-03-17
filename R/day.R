#' Get and Set Day Values
#'
#' Gets and sets day values for date/time vectors.
#'
#' @param x A date/time vector.
#' @param value A integer vector of the day value(s).
#' @param ... Unused.
#' @return An integer vector (or the modified date/time vector).
#' @export
#'
#' @examples
#' x <- as.Date("1990-01-02")
#' dtt_day(x)
#' dtt_day(x) <- 27L
#' x
#'
#' x <- as.POSIXct("1990-01-02 23:40:51")
#' dtt_day(x)
#' dtt_day(x) <- 27L
#' x
dtt_day <- function(x, ...) {
  UseMethod("dtt_day")
}

#' @rdname dtt_day
#' @export
`dtt_day<-` <- function(x, value) {
  UseMethod("dtt_day<-")
}

#' @describeIn dtt_day Get integer vector of day values for a Date vector
#' @export
dtt_day.Date <- function(x, ...) {
  chk_unused(...)
  as.integer(format(x, "%d"))
}

#' @describeIn dtt_day Get integer vector of day values for a POSIXct vector
#' @export
dtt_day.POSIXct <- function(x, ...) {
  chk_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$mday)
}

#' @describeIn dtt_day Set day values for a Date vector
#' @export
`dtt_day<-.Date` <- function(x, value) {
  chk_whole_numeric(value)
  chk_range(value, c(0L, 31L))
  chk_subset(length(value), c(1L, length(x)))

  if (!length(x)) {
    return(x)
  }
  x <- format(x)
  if (identical(length(value), 1L)) {
    return(dtt_date(sub_day(x, value)))
  }
  dtt_date(mapply(sub_day, x, value))
}

#' @describeIn dtt_day Set day values for a POSIXct vector
#' @export
`dtt_day<-.POSIXct` <- function(x, value) {
  chk_whole_numeric(value)
  chk_range(value, c(0L, 31L))
  chk_subset(length(value), c(1L, length(x)))

  if (!length(x)) {
    return(x)
  }
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$mday <- value
  as.POSIXct(format(x), tz = tz)
}
