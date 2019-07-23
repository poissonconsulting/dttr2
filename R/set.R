#' @rdname dtt_second
#' @export
dtt_set_second <- function(x, value) {
  dtt_second(x) <- value
  x
}

#' @rdname dtt_minute
#' @export
dtt_set_minute <- function(x, value) {
  dtt_minute(x) <- value
  x
}

#' @rdname dtt_hour
#' @export
dtt_set_hour <- function(x, value) {
  dtt_hour(x) <- value
  x
}

#' @rdname dtt_day
#' @export
dtt_set_day <- function(x, value) {
  dtt_day(x) <- value
  x
}

#' @rdname dtt_month
#' @export
dtt_set_month <- function(x, value) {
  dtt_month(x) <- value
  x
}

#' @rdname dtt_year
#' @export
dtt_set_year <- function(x, value) {
  dtt_year(x) <- value
  x
}
