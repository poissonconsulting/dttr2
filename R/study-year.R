#' Study Year
#'
#' @param x A Date or POSIXct vector.
#' @param start An integer scalar of the starting month or a Date scalar of the starting dayte.
#' @return A character vector of the study year.
#' @export
#'
#' @examples
#' dtt_study_year(as.Date(c("2000-03-31", "2000-04-01", "2001-04-01")), start = 4L)
dtt_study_year <- function(x, start = 1L) {
  checkor(check_vector(x, Sys.Date()),
          check_vector(x, Sys.time()))
  
  checkor(check_vector(start, c(1L, 12L), length = 1L),
          check_vector(start, as.Date(c("1972-01-01", "1972-12-31")), length = 1L))
  if(!length(x)) return(character(0))
  
  if(is.integer(start)) start <- dtt_date(paste("1972", start, "01", sep = "-"))
  year <- dtt_year(x)
  start <- dtt_floor(start)
  if(identical(start, dtt_date("1972-01-01")))
    return(paste(year, year, sep = "-"))
  
  start <- rep(start, length(year))
  start <- try(dtt_set_year(start, year), silent = TRUE)
  if(inherits(start, "try-error"))
    err("argument start must be a valid date for each year")
  date_in_start <- dtt_date(x) >= start
  year[!date_in_start] <- year[!date_in_start] - 1L
  paste(year, year + 1L, sep = "-")
}