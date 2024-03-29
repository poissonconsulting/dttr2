#' Floor Date
#'
#' Coerces vectors to floored Date vectors.
#'
#' @inheritParams params
#' @param x A vector.
#' @param value A date vector.
#' @param origin Origin date.
#'
#' @return A floored Date vector.
#' @family floor
#' @export
#'
#' @examples
#' dtt_date(1L)
#' dtt_date(-1)
#' dtt_date("2000-01-01")
#' as.Date(as.POSIXct("2019-05-01", tz = "Etc/GMT-8"))
#' dtt_date(as.POSIXct("2019-05-01", tz = "Etc/GMT-8"))
#' dtt_date(hms::as_hms("23:59:59"))
#' dtt_date(hms::as_hms("24:00:00"))
dtt_date <- function(x, ...) {
  UseMethod("dtt_date")
}

#' @rdname dtt_date
#' @export
`dtt_date<-` <- function(x, value) {
  UseMethod("dtt_date<-")
}

#' @describeIn dtt_date Coerce integer vector to a floored Date vector
#' @export
dtt_date.integer <- function(x, origin = as.Date("1970-01-01"), ...) {
  chk_unused(...)
  as.Date(x, origin = origin)
}

#' @describeIn dtt_date Coerce double vector to a floored Date vector
#' @export
dtt_date.double <- function(x, origin = as.Date("1970-01-01"), ...) {
  chk_unused(...)
  dtt_date(as.integer(floor(x)), origin = origin)
}

#' @describeIn dtt_date Coerce character vector to a floored Date vector
#' @export
dtt_date.character <- function(x, ...) {
  chk_unused(...)
  dtt_date(as.Date(x))
}

#' @describeIn dtt_date Coerce Date vector to a floored Date vector
#' @export
dtt_date.Date <- function(x, ...) {
  chk_unused(...)
  dtt_floor(x)
}

#' @describeIn dtt_date Coerce POSIXct vector to a floored Date vector
#' @export
dtt_date.POSIXct <- function(x, ...) {
  chk_unused(...)
  as.Date(format(x, "%Y-%m-%d"))
}

#' @describeIn dtt_date Coerce hms vector to a floored Date vector
#' @export
dtt_date.hms <- function(x, ...) {
  x <- unclass(x)
  attributes(x) <- NULL
  x <- as.Date("1970-01-01") + unclass(x) / dtt_units_per_unit()
  dtt_floor(x)
}

#' @describeIn dtt_date Set date values for a Date vector
#' @export
`dtt_date<-.Date` <- function(x, value) {
  chk_s3_class(value, "Date")
  chk_subset(length(value), c(1L, length(x)))

  if (!length(x)) {
    return(x)
  }
  value <- dtt_date(value)
  if (identical(length(value), 1L)) {
    return(rep(value, length(x)))
  }
  return(value)
}

#' @describeIn dtt_date Set date values for a POSIXct vector
#' @export
`dtt_date<-.POSIXct` <- function(x, value) {
  chk_s3_class(value, "Date")
  chk_subset(length(value), c(1L, length(x)))

  if (!length(x)) {
    return(x)
  }
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$year <- dtt_year(value) - 1900L
  x$mon <- dtt_month(value) - 1L
  x$mday <- dtt_day(value)
  as.POSIXct(format(x), tz = tz)
}
