#' Is Date/Time
#'
#' Tests whether an object is a Date, POSIXct, or hms vector.
#'
#' @param x An object
#' @return A flag indicating whether x inherits from Date, POSIXct or hms.
#' @name is_date_time
NULL

#' @rdname is_date_time
#' @export
is.POSIXct <- function(x) inherits(x, "POSIXct")

#' @rdname is_date_time
#' @export
is_date_time <- function(x) inherits(x, "POSIXct")

#' @rdname is_date_time
#' @export
is.Date <- function(x) inherits(x, "Date")

#' @rdname is_date_time
#' @export
is_date <- function(x) inherits(x, "Date")

#' @rdname is_date_time
#' @export
is.hms <- function(x) inherits(x, "hms")

#' @rdname is_date_time
#' @export
is_time <- function(x) inherits(x, "hms")
