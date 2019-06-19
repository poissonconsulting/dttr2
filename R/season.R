#' Season
#'
#' Returns an ordered factor of the user specified seasons.
#' 
#' If the first month of the first season isn't January (1L), then
#' the last season is considered to wrap into the following year.
#'
#' @param x A Date or POSIXct vector
#' @param start A uniquely named integer vector of the first month of each season
#' or a uniquely named Date vector of the first date of each season.
#'
#' @return An ordered factor of the seasons.
#' @export
#' @examples
#' dates <- as.Date(c("2001-01-01", "2001-02-28", "2012-09-01", "2012-12-01"))
#' dtt_season(dates)
#' dtt_season(dates, start = c(Monsoon = 2L, `Dry Period` = 6L))
#' dtt_season(dates, start = c(First = dtt_date("2000-01-01"), Second = dtt_date("2000-06-01")))
dtt_season <- function (x, start = c(Spring = 3L, Summer = 6L,
                                     Autumn = 9L, Winter = 12L)) {
  checkor(check_vector(x, c(Sys.Date(), NA)),
          check_vector(x, c(Sys.time(), NA_POSIXct_)))
  checkor(
    check_vector(start, c(1L, 12L), length = TRUE,
                 unique = TRUE), 
    check_vector(start, Sys.Date(), length = TRUE,
                 unique = TRUE))
  
  check_names(start, unique = TRUE)
  
  if(is.integer(start)) {
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

  if(anyDuplicated(unname(start))) err("The values in start must be unique.")
  
  is_length <- length(x)
  if(!is_length) x <- as.Date("2000-01-01")
  
  if(start[1] != dtt_date(c("1972-01-01"))) {
    first <- dtt_date("1972-01-01")
    names(first) <- names(start)[length(start)]
    start <- c(first, start)
  }
  
  breaks <- c(start, dtt_date("1973-12-31"))
  
  x <- dtt_dayte(x)
  x <- cut(x, breaks = breaks, include.lowest = TRUE, ordered_result = TRUE)
  
  levels(x) <- names(start)
  if(!is_length) x <- x[-1]
  x  
}
