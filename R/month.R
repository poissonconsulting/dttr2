#' Get and Set Month Values
#'
#' Gets and sets month values for date/time vectors.
#'
#' @param x A date/time vector.
#' @param value A integer vector of the month value(s).
#' @param ... Unused.
#' @return An integer vector (or the modified date/time vector).
#' @export
#'
#' @examples
#' x <- as.Date("1990-01-02")
#' dtt_month(x)
#' dtt_month(x) <- 11L
#' x
#'
#' x <- as.POSIXct("1990-01-02 23:40:51")
#' dtt_month(x)
#' dtt_month(x) <- 11L
#' x
dtt_month <- function(x, ...) {
  UseMethod("dtt_month")
}

#' @rdname dtt_month
#' @export
`dtt_month<-` <- function(x, value) {
  UseMethod("dtt_month<-")
}

#' @describeIn dtt_month Get integer vector of month values for a Date vector
#' @export
dtt_month.Date <- function(x, ...) {
  chk_unused(...)
  as.integer(format(x, "%m"))
}

#' @describeIn dtt_month Get integer vector of month values for a POSIXct vector
#' @export
dtt_month.POSIXct <- function(x, ...) {
  chk_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$mon + 1L)
}

#' @describeIn dtt_month Set month values for a Date vector
#' @export
`dtt_month<-.Date` <- function(x, value) {
  chk_whole_numeric(value)
  chk_range(value, c(1L, 12L))
  chk_subset(length(value), c(1L, length(value)))

  if (!length(x)) {
    return(x)
  }
  x <- format(x)
  if (identical(length(value), 1L)) {
    return(dtt_date(sub_month(x, value)))
  }
  dtt_date(mapply(sub_month, x, value))
}

#' @describeIn dtt_month Set month values for a POSIXct vector
#' @export
`dtt_month<-.POSIXct` <- function(x, value) {
  chk_whole_numeric(value)
  chk_range(value, c(1L, 12L))
  chk_subset(length(value), c(1L, length(value)))

  if (!length(x)) {
    return(x)
  }
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$mon <- value - 1L
  as.POSIXct(format(x), tz = tz)
}
