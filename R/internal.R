set_class <- function(x, class) {
  class(x) <- class
  x
}

set_attr <- function(x, attr, value) {
  attr(x, attr) <- value
  x
}

err <- function(...) stop(..., call. = FALSE, domain = NA)

units2by <- function(x) {
  x <- sub("ond", "", x)
  x <- sub("ute", "", x)
  x
}

sub_year <- function(x, value) {
  sub("^(\\d{1,4})(-\\d{1,2}-\\d{1,2})$", paste0(value, "\\2"), x)
}

sub_month <- function(x, value) {
  sub("^(\\d{1,4}-)(\\d{1,2})(-\\d{1,2})$", paste0("\\1", value, "\\3"), x)
}

sub_day <- function(x, value) {
  sub("^(\\d{1,4}-\\d{1,2}-)(\\d{1,2})$", paste0("\\1", value), x)
}

# Base R's `as.POSIXct.character()` guesses a single format for the whole vector
# (the first of `tryFormats` that parses every element). `as.character()` drops
# the "00:00:00" time from midnight POSIXct values, so a single date-only value
# mixed in with date-times forces the whole vector to be parsed with a date-only
# format, silently discarding the time component from every element (see #66).
#
# Parse with the date-time formats first (forcing each explicitly so date-only
# values become NA rather than dictating the format) and only fall back to the
# date-only formats (i.e. midnight) for the values that did not parse. The
# formats mirror the default `tryFormats` of `as.POSIXct.character()`.
parse_date_time_character <- function(x, tz) {
  formats <- c(
    "%Y-%m-%d %H:%M:%OS",
    "%Y/%m/%d %H:%M:%OS",
    "%Y-%m-%d %H:%M",
    "%Y/%m/%d %H:%M",
    "%Y-%m-%d",
    "%Y/%m/%d"
  )

  out <- as.POSIXct(rep(NA_character_, length(x)), tz = tz)
  unparsed <- !is.na(x)
  for (format in formats) {
    if (!any(unparsed)) {
      break
    }
    i <- which(unparsed)
    parsed <- as.POSIXct(x[i], tz = tz, format = format)
    ok <- !is.na(parsed)
    out[i[ok]] <- parsed[ok]
    unparsed[i[ok]] <- FALSE
  }

  # Defer to base R for anything still unparsed so that genuinely malformed
  # input raises the usual "not in a standard unambiguous format" error.
  if (any(unparsed)) {
    i <- which(unparsed)
    out[i] <- as.POSIXct(x[i], tz = tz)
  }
  out
}

#' @exportS3Method NULL
max.hms <- function(..., na.rm = FALSE) {
  dots <- list(...)
  dots <- c(unlist(lapply(dots, unclass)))
  dots <- dtt_time(dots)
  max <- max(as.integer(dots), na.rm = na.rm)
  dtt_time(max)
}

#' @exportS3Method NULL
min.hms <- function(..., na.rm = FALSE) {
  dots <- list(...)
  dots <- c(unlist(lapply(dots, unclass)))
  dots <- dtt_time(dots)
  min <- min(as.integer(dots), na.rm = na.rm)
  dtt_time(min)
}

#' @exportS3Method NULL
unique.hms <- function(x, incomparables = FALSE, ...) {
  chk_unused(...)
  x <- dtt_floor(x)
  x[!duplicated(as.integer(x), incomparables = incomparables)]
}

daytte <- function(x, start) {
  if (!vld_date(start) && !vld_whole_number(start)) {
    chkor_vld(vld_date(start), vld_whole_number(start))
  }

  if (vld_whole_number(start)) {
    chk_range(start, c(1L, 12L))
  }

  if (!length(x)) {
    return(x)
  }

  dtt_year(x) <- 1972L

  if (is.integer(start)) {
    start <- dtt_date(paste("1972", start, "01", sep = "-"))
  } else {
    dtt_year(start) <- 1972L
  }

  if (all(dtt_date(start) == as.Date("1972-01-01"))) {
    return(x)
  }

  start_in_leap <- start <= as.Date("1972-02-29")
  date_in_start <- dtt_date(x) >= start
  dtt_year(x[!start_in_leap & date_in_start]) <- 1971L
  dtt_year(x[start_in_leap & !date_in_start]) <- 1973L
  x
}

seconds_per_unit <- function(units = "seconds") {
  chk_string(units)
  chk_subset(units, c("seconds", "minutes", "hours", "days", "months", "years"))

  if (units == "seconds") {
    return(1L)
  }
  x <- 60L
  if (units == "minutes") {
    return(as.integer(x))
  }
  x <- x * 60L
  if (units == "hours") {
    return(as.integer(x))
  }
  x <- x * 24L
  if (units == "days") {
    return(as.integer(x))
  }
  x <- x * 30.41667
  if (units == "months") {
    return(as.integer(x))
  }
  x <- x * 12
  x
}
