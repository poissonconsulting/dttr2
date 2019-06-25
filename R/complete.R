#' Complete
#' 
#' Completes date/time vector.
#'
#' @param x A date/time vector.
#' @param from A date/time scalar of the start.
#' @param to A date/time vector of the end.
#' @param units A string of the time units.
#' @param unique A flag specifying whether to only return unique values.
#' @param sort A flag specifying whether to sort the vector.
#' @param ... Unused.
#' @return The completed date/time vector.
#' @export
#'
#' @examples
#' dtt_complete(as.Date(c("2001-01-01", "2001-01-03", "2001-01-01")))
dtt_complete <- function(x, ...) {
  UseMethod("dtt_complete")
}

#' @describeIn dtt_complete Complete a Date sequence vector
#' @export
dtt_complete.Date <- function(x, from = min(x), to = max(x), units = "days", 
                              unique = TRUE, sort = TRUE, ...) {
  check_vector(x, Sys.Date(), length = TRUE)
  check_scalar(from, Sys.Date(), named = NA)
  check_scalar(to, Sys.Date(), named = NA)
  check_scalar(units, .units_Date)
  check_flag(unique)
  check_flag(sort)
  check_unused(...)
  
  x <- dtt_floor(x, units = units)
  from <- dtt_floor(from, units = units)
  to <- dtt_floor(to, units = units)
  
  if(from > to) err("from must not be greater than to")
  if(from > min(x) || to < max(x)) err("from and to must span x")
  
  seq <- dtt_seq(from, to, units = units)
  seq <- setdiff(seq, x)
  if(unique) x <- unique(x)
  x <- c(x, seq)
  if(sort) x <- sort(x)
  x
}

#' @describeIn dtt_complete Complete a POSIXct sequence vector
#' @export
dtt_complete.POSIXct <- function(x, from = min(x), to = max(x), units = "seconds", 
                                 unique = TRUE, sort = TRUE, ...) {
  check_vector(x, Sys.time(), length = TRUE)
  
  check_scalar(from, Sys.time(), named = NA)
  check_scalar(to, Sys.time(), named = NA)
  check_scalar(units, .units_POSIXct)
  check_flag(unique)
  check_flag(sort)
  check_unused(...)
  
  tz <- dtt_tz(x)
  check_tz(from, tz = tz)
  check_tz(to, tz = tz)
  
  x <- dtt_floor(x, units = units)
  from <- dtt_floor(from, units = units)
  to <- dtt_floor(to, units = units)
  
  if(from > to) err("from must not be greater than to")
  if(from > min(x) || to < max(x)) err("from and to must span x")
  
  seq <- try(dtt_seq(from, to, units = units), silent = FALSE)
  if(inherits(seq, "try-error")) 
    err("attempting to generate more than 2^32 POSIXct values")
  seq <- setdiff(seq, x)
  if(unique) x <- unique(x)
  x <- c(x, seq)
  if(sort) x <- sort(x)
  x
}

#' @describeIn dtt_complete Complete a hms sequence vector
#' @export
dtt_complete.hms <- function(x, from = min(x), to = max(x), units = "seconds", 
                             unique = TRUE, sort = TRUE, ...) {
  check_vector(x, hms::as.hms(1), length = TRUE)
  
  check_scalar(from, hms::as.hms(1), named = NA)
  check_scalar(to, hms::as.hms(1), named = NA)
  check_scalar(units, .units_hms)
  check_flag(unique)
  check_flag(sort)
  check_unused(...)

  x <- dtt_floor(x, units = units)
  from <- dtt_floor(from, units = units)
  to <- dtt_floor(to, units = units)
  
  if(from > to) err("from must not be greater than to")
  if(from > min(x) || to < max(x)) err("from and to must span x")
  
  seq <- try(dtt_seq(from, to, units = units), silent = FALSE)
  if(inherits(seq, "try-error")) 
    err("attempting to generate more than 2^32 hms values")
  seq <- setdiff(seq, x)
  if(unique) x <- unique(x)
  x <- c(x, seq)
  if(sort) x <- sort(x)
  dtt_time(x)
}
