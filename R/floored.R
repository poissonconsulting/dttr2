#' Test Floored
#'
#' Test whether a date time vector is floored.
#'
#' @inheritParams params
#' @param x A Date, POSIXct or hms vector.
#'
#' @return A flag indicating whether floored.
#' @family floor
#' @export
#'
#' @examples
#' dtt_floored(as.Date("2002-02-01"))
dtt_floored <- function(x, ...) {
  UseMethod("dtt_floored")
}

#' @describeIn dtt_floored Test if Date vector is floored
#' @export
dtt_floored.Date <- function(x, units = "days", ...) {
  isTRUE(all.equal(dtt_floor(x, units), x))
}

#' @describeIn dtt_floored Test if POSIXct vector is floored
#' @export
dtt_floored.POSIXct <- function(x, units = "seconds", ...) {
  isTRUE(all.equal(dtt_floor(x, units), x))
}

#' @describeIn dtt_floored Test if hms vector is floored
#' @export
dtt_floored.hms <- function(x, units = "seconds", ...) {
  isTRUE(all.equal(dtt_floor(x, units), x))
}
