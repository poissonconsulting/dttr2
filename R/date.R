#' Date
#'
#' Coerces vectors to floored Date vectors.
#' 
#' @param x A vector.
#' @param ... Unused.
#'
#' @return A floored Date vector.
#' @export
#'
#' @examples
#' dtt_date(1L)
#' dtt_date(-1)
#' dtt_date("2000-01-01")
#' as.Date(as.POSIXct("2019-05-01", tz = "Etc/GMT-8"))
#' dtt_date(as.POSIXct("2019-05-01", tz = "Etc/GMT-8"))
#' dtt_date(hms::as.hms("23:59:59"))
#' dtt_date(hms::as.hms("24:00:00"))
dtt_date <- function(x, ...) {
  UseMethod("dtt_date")
}

#' @describeIn dtt_date Coerce integer vector to a floored Date vector
#' @export
dtt_date.integer <- function(x, ...) {
  check_unused(...)
  as.Date(x, origin = as.Date("1970-01-01"))
}

#' @describeIn dtt_date Coerce double vector to a floored Date vector
#' @export
dtt_date.double <- function(x, ...) {
  check_unused(...)
  dtt_date(as.integer(floor(x)))
}

#' @describeIn dtt_date Coerce character vector to a floored Date vector
#' @export
dtt_date.character <- function(x, ...) {
  check_unused(...)
  dtt_date(as.Date(x))
}

#' @describeIn dtt_date Coerce Date vector to a floored Date vector
#' @export
dtt_date.Date <- function(x, ...) {
  check_unused(...)
  dtt_floor(x)
}

#' @describeIn dtt_date Coerce POSIXct vector to a floored Date vector
#' @export
dtt_date.POSIXct <- function(x, ...) {
  check_unused(...)
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
