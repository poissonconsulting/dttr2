#' Study Year
#'
#' @inheritParams params
#' @param x A Date or POSIXct vector.
#' @param start An integer vector of the starting month or a Date vector of the
#'   starting date.
#'
#' @return A character vector of the study year or an integer vector of the
#'   first year.
#' @export
#'
#' @examples
#' dtt_study_year(
#'   as.Date(c("2000-03-31", "2000-04-01", "2001-04-01")),
#'   start = 4L
#' )
#' dtt_study_year(
#'   as.Date(c("2000-03-31", "2000-04-01", "2001-04-01")),
#'   start = 4L,
#'   full = FALSE
#' )
dtt_study_year <- function(x, start = 1L, full = TRUE) {
  if (!vld_s3_class(x, "Date") && !vld_s3_class(x, "POSIXct")) {
    chkor_vld(vld_s3_class(x, "Date"), vld_s3_class(x, "POSIXct"))
  }

  if (!vld_date(start) && !vld_whole_number(start)) {
    chkor_vld(vld_date(start), vld_whole_number(start))
  }

  if (vld_whole_number(start)) {
    chk_range(start, c(1L, 12L))
  }

  chk_flag(full)

  if (!length(x)) {
    if (!full) {
      return(integer(0))
    }
    return(character(0))
  }
  if (is.integer(start)) {
    start <- dtt_date(paste("1972", start, "01", sep = "-"))
  } else {
    start <- dtt_dayte(start)
  }

  year <- dtt_year(x)
  start <- dtt_floor(start)
  if (identical(start, dtt_date("1972-01-01"))) {
    if (!full) {
      return(year)
    }
    return(paste(year, year, sep = "-"))
  }
  start <- rep(start, length(year))
  start <- try(dtt_set_year(start, year), silent = TRUE)
  if (inherits(start, "try-error")) {
    err("argument start must be a valid date for each year")
  }
  date_in_start <- dtt_date(x) >= start
  year[!date_in_start] <- year[!date_in_start] - 1L
  if (!full) {
    return(year)
  }
  paste(year, year + 1L, sep = "-")
}
