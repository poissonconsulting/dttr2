#' Day of the Year
#'
#' @param x A Date or POSIXct vector.
#' @param ... Unused.
#'
#' @return A integer vector between 1 and 366 of the day of the year.
#' @export
#'
#' @examples
#' dtt_doy(Sys.Date())
dtt_doy <- function(x, ...) {
  UseMethod("dtt_doy")
}

#' @export
dtt_doy.Date <- function(x, ...) {
  check_unused(...)
  as.integer(format(x, "%j"))
}

#' @export
dtt_doy.POSIXct <- function(x, ...) {
  check_unused(...)
  dtt_doy(dtt_date(x))
}

#' Day of the Year to Date
#'
#' @param x An integer vector of the Day of the Year.
#' @param year An integer scalar or vector of the year.
#'
#' @return A Date vector.
#' @export
#'
#' @examples
#' dtt_doy_to_date(3L)
dtt_doy_to_date <- function(x, year = 1972L) {
  check_vector(x, c(1L, 366L, NA))
  check_vector(year, c(-3000L, 3000L), length = c(1L, 1L, length(x)))

  if(!length(x)) return(dtt_date(character(0)))

  dtt_date(paste0(year - 1, "-12-31")) + x
}
