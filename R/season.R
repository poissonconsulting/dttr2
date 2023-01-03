#' Season
#'
#' Returns a factor of the user specified seasons.
#'
#' If the first month of the first season isn't January (1L), then the last
#' season is considered to wrap into the following year.
#'
#' @inheritParams params
#' @param x A Date or POSIXct vector
#' @param start A uniquely named integer vector of the first month of each
#'   season or a uniquely named Date vector of the first date of each season.
#'
#' @return A factor of the seasons.
#' @export
#' @examples
#' dates <- as.Date(c("2001-01-01", "2001-02-28", "2012-09-01", "2012-12-01"))
#' dtt_season(dates)
#' dtt_season(dates, start = c(Monsoon = 2L, `Dry Period` = 6L))
#' dtt_season(
#'   dates,
#'   start = c(First = dtt_date("2000-01-01"), Second = dtt_date("2000-06-01"))
#' )
dtt_season <- function(x, start = c(
                         Spring = 3L, Summer = 6L,
                         Autumn = 9L, Winter = 12L
                       ), first = NULL) {
  if (!vld_s3_class(x, "Date") && !vld_s3_class(x, "POSIXct")) {
    chkor_vld(vld_s3_class(x, "Date"), vld_s3_class(x, "POSIXct"))
  }

  if (!vld_whole_numeric(start) && !vld_s3_class(start, "Date")) {
    chkor_vld(vld_whole_numeric(start), vld_s3_class(start, "Date"))
  }

  if (is.numeric(start)) chk_range(start, c(1L, 12L))
  chk_not_any_na(start)
  chk_not_empty(start)
  chk_unique(start)

  chk_named(start)
  chk_unique(names(start))
  if (!is.null(first)) {
    chk_string(first)
    chk_subset(first, names(start))
  }

  if (is.integer(start)) {
    breaks <- dtt_date(paste("1972", start, "01", sep = "-"))
    names(breaks) <- names(start)
    start <- breaks
  } else {
    names <- names(start)
    start <- dtt_dayte(start)
    names(start) <- names
  }

  start <- dtt_floor(start)
  start <- sort(start)

  chk_unique(start)

  is_length <- length(x)
  if (!is_length) x <- as.Date("2000-01-01")

  if (start[1] != dtt_date(c("1972-01-01"))) {
    first2 <- dtt_date("1972-01-01")
    names(first2) <- names(start)[length(start)]
    start <- c(first2, start)
  }

  breaks <- c(start, dtt_date("1973-12-31"))

  x <- dtt_dayte(x)
  x <- cut(x, breaks = breaks, include.lowest = TRUE)

  levels(x) <- names(start)
  if (!is.null(first)) {
    first <- which(levels(x) == first)
    if (first != 1L) {
      values <- as.character(x)
      levels <- levels(x)
      levels <- c(levels[first:length(levels)], levels[1:(first - 1)])
      x <- factor(values, levels = levels)
    }
  }

  if (!is_length) x <- x[-1]
  x
}
