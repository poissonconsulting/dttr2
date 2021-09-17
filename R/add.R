#' Add Time Units
#'
#' Add time units to a date time vector.
#'
#' @inheritParams params
#'
#' @return The modified date time vector.
#' @seealso [dtt_subtract_units()]
#' @family add
#' @export
#'
#' @examples
#' dtt_add_units(as.Date("1999-12-31"), "days")
dtt_add_units <- function(x, units, n = 1L) {
  chk_string(units)
  chk_subset(units, c("seconds", "minutes", "hours", "days", "months", "years"))

  switch(units,
    years = dtt_add_years(x, n),
    months = dtt_add_months(x, n),
    days = dtt_add_days(x, n),
    hours = dtt_add_hours(x, n),
    minutes = dtt_add_minutes(x, n),
    seconds = dtt_add_seconds(x, n)
  )
}

#' @rdname dtt_add_units
#' @export
dtt_add_years <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_years")
}

#' @rdname dtt_add_units
#' @export
dtt_add_months <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_months")
}

#' @rdname dtt_add_units
#' @export
dtt_add_days <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_days")
}

#' @rdname dtt_add_units
#' @export
dtt_add_hours <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_hours")
}

#' @rdname dtt_add_units
#' @export
dtt_add_minutes <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_minutes")
}

#' @rdname dtt_add_units
#' @export
dtt_add_seconds <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_seconds")
}

#' @export
dtt_add_years.default <- function(x, n = 1L, ...) {
  chk_whole_numeric(n)
  chk_subset(length(n), c(1L, length(x)))
  chk_unused(...)

  if (!length(x)) {
    return(x)
  }
  is_na <- is.na(x)
  if (all(is_na)) {
    return(x)
  }
  x[is_na] <- x[!is_na][1]
  
  dtt_year(x) <- dtt_year(x) + n

  is.na(x[is_na]) <- TRUE
  dtt_floor(x)
}

#' @export
dtt_add_months.default <- function(x, n = 1L, ...) {
  chk_whole_numeric(n)
  chk_subset(length(n), c(1L, length(x)))
  chk_unused(...)

  if (!length(x)) {
    return(x)
  }
  is_na <- is.na(x)
  if (all(is_na)) {
    return(x)
  }
  x[is_na] <- x[!is_na][1]

  months <- dtt_month(x) + n

  years <- months %/% 12L
  months <- months %% 12L

  wh <- which(months == 0L)
  months[wh] <- 12L
  years[wh] <- years[wh] - 1L

  dtt_month(x) <- months
  x <- dtt_add_years(x, years)
  is.na(x[is_na]) <- TRUE
  x
}

#' @export
dtt_add_days.default <- function(x, n = 1L, ...) {
  chk_whole_numeric(n)
  chk_subset(length(n), c(1L, length(x)))
  chk_unused(...)

  dtt_add_hours(x, n * 24L)
}

#' @export
dtt_add_days.Date <- function(x, n = 1L, ...) {
  chk_whole_numeric(n)
  chk_subset(length(n), c(1L, length(x)))
  chk_unused(...)

  dtt_floor(x) + n
}

#' @export
dtt_add_hours.default <- function(x, n = 1L, ...) {
  chk_whole_numeric(n)
  chk_subset(length(n), c(1L, length(x)))
  chk_unused(...)

  dtt_add_minutes(x, n * 60L)
}

#' @export
dtt_add_minutes.default <- function(x, n = 1L, ...) {
  chk_whole_numeric(n)
  chk_subset(length(n), c(1L, length(x)))
  chk_unused(...)

  dtt_add_seconds(x, n * 60L)
}

#' @export
dtt_add_seconds.POSIXct <- function(x, n = 1L, ...) {
  chk_whole_numeric(n)
  chk_subset(length(n), c(1L, length(x)))
  chk_unused(...)

  dtt_floor(x) + n
}

#' @export
dtt_add_seconds.hms <- function(x, n = 1L, ...) {
  chk_whole_numeric(n)
  chk_subset(length(n), c(1L, length(x)))
  chk_unused(...)
  dtt_time(unclass(x) + n)
}
