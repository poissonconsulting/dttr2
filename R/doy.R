#' Day of the Year
#'
#' @inheritParams params
#' @param x A Date or POSIXct vector.
#'
#' @return A integer vector between 1 and 366 of the day of the year.
#' @family days
#' @seealso [dtt_doy_decimal()]
#' @export
#'
#' @examples
#' dtt_doy(Sys.Date())
dtt_doy <- function(x, ...) {
  UseMethod("dtt_doy")
}

#' @export
dtt_doy.Date <- function(x, ...) {
  chk_unused(...)
  as.integer(format(x, "%j"))
}

#' @export
dtt_doy.POSIXct <- function(x, ...) {
  chk_unused(...)
  dtt_doy(dtt_date(x))
}

#' Day of the Year to Date
#'
#' @param x An integer vector of the Day of the Year.
#' @param year An integer scalar or vector of the year.
#'
#' @return A Date vector.
#' @family days
#' @export
#'
#' @examples
#' dtt_doy_to_date(3)
dtt_doy_to_date <- function(x, year = 1972L) {
  chk::chk_whole_numeric(x)
  chk::chk_vector(x)
  chk::chk_whole_numeric(year)
  chk::chk_vector(year)
  chk::chk_subset(length(year), c(1L, length(x)))

  if (!length(x)) {
    return(dtt_date(character(0)))
  }

  dtt_date(paste0(year - 1, "-12-31")) + x
}
