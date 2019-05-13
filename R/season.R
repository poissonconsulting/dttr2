#' Season
#'
#' Returns an ordered factor of the user specified seasons.
#' 
#' If the first month of the first season isn't January (1L), then
#' the last season is considered to wrap into the following year.
#'
#' @param x A Date or POSIXct vector
#' @param seasons A uniquely named integer vector of the first month of each season
#' or a uniquely named Date vector of the first dayte of each season.
#'
#' @return An ordered factor of the seasons.
#' @export
#' @examples
#' dates <- as.Date(c("2001-01-01", "2001-02-28", "2012-09-01", "2012-12-01"))
#' dtt_season(dates)
#' dtt_season(dates, season = c(Monsoon = 2L, `Dry Period` = 6L))
#' dtt_season(dates, season = c(First = dtt_date("1972-01-01"), Second = dtt_date("1972-06-01")))
dtt_season <- function (x, seasons = c(Spring = 3L, Summer = 6L,
                                       Autumn = 9L, Winter = 12L)) {
  checkor(check_vector(x, c(Sys.Date(), NA)),
          check_vector(x, c(Sys.time(), NA_POSIXct_)))
  checkor(
    check_vector(seasons, c(1L, 12L), length = TRUE,
                 unique = TRUE, sorted = TRUE), 
    check_vector(seasons, dtt_date(c("1972-01-01", "1972-12-31")), length = TRUE,
                 unique = TRUE, sorted = TRUE))
  
  check_names(seasons, unique = TRUE)
  
  if(is.integer(seasons)) {
    breaks <- paste("1972", seasons, "01", sep = "-")
    breaks <- dtt_date(breaks)
    names(breaks) <- names(seasons)
    seasons <- breaks
  }
  seasons <- dtt_floor(seasons)
  
  is_length <- length(x)
  if(!is_length) x <- as.Date("2000-01-01")
  
  if(seasons[1] != dtt_date(c("1972-01-01"))) {
    start <- dtt_date(c("1972-01-01"))
    names(start) <- names(seasons)[length(seasons)]
    seasons <- c(start, seasons)
  }
  
  breaks <- c(seasons, dtt_date("1973-12-31"))
  
  x <- dtt_dayte(x)
  x <- cut(x, breaks = breaks, include.lowest = TRUE, ordered_result = TRUE)
  
  levels(x) <- names(seasons)
  if(!is_length) x <- x[-1]
  x  
}
