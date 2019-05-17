#' Get and Set Year Values
#' 
#' Gets and sets year values for date/time vectors.
#'
#' @param x A date/time vector.
#' @param value A integer vector of the year value(s).
#' @param ... Unused.
#' @return An integer vector (or the modified date/time vector).
#' @export
#'
#' @examples
#' x <- as.Date("1990-01-02")
#' dtt_year(x)
#' dtt_year(x) <- 11L
#' x
#' 
#' x <- as.POSIXct("1990-01-02 23:40:51")
#' dtt_year(x)
#' dtt_year(x) <- 2022L
#' x
dtt_year <- function(x, ...) {
  UseMethod("dtt_year")
}

#' @rdname dtt_year
#' @export
`dtt_year<-` <- function(x, value) {
  UseMethod("dtt_year<-")
}

#' @describeIn dtt_year Get integer vector of year values for a Date vector
#' @export
dtt_year.Date <- function(x, ...) {
  check_unused(...)
  as.integer(format(x, "%Y"))
}

#' @describeIn dtt_year Get integer vector of year values for a POSIXct vector
#' @export
dtt_year.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$year + 1900L)
}

#' @describeIn dtt_year Set year values for a Date vector
#' @export
`dtt_year<-.Date` <- function(x, value) {
  check_vector(value, c(1L, 2999L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- format(x)
  if(identical(length(value), 1L)) return(dtt_date(sub_year(x, value)))
  dtt_date(mapply(FUN = sub_year, x, value))
}

#' @describeIn dtt_year Set year values for a POSIXct vector
#' @export
`dtt_year<-.POSIXct` <- function(x, value) {
  check_vector(value, c(1L, 2999L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$year <- value - 1900L
  as.POSIXct(format(x), tz = tz)
}
