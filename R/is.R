#' Is Date/Time
#' 
#' Tests whether an object is a Date, POSIXct, or hms vector.
#' 
#' @param x An object
#' @return A flag indicating whether x inherits from Date, POSIXct or hms.
#' @name is.datetime
NULL

#' @rdname is.datetime
#' @export
is.POSIXct <- function(x) inherits(x, "POSIXct")

#' @rdname is.datetime
#' @export
is.Date <- function(x) inherits(x, "Date")

#' @rdname is.datetime
#' @export
is.hms <- function(x) inherits(x, "hms")
