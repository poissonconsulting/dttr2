#' Sequence
#'
#' Creates a date/time sequence vector.
#' from and to are first floored and then a sequence is created by units.
#' If length_out is defined then that number of units are added to from.
#'
#' @param from A date/time scalar of the start.
#' @param to A date/time scalar of the end.
#' @param units A string of the time units.
#' @param length_out An integer of the number of units from from.
#' @param wrap A flag specifying whether to wrap hms vectors from 23:59:59 to 00:00:00
#' @param ... Unused
#' @return The date/time vector.
#' @export
#'
#' @examples
#' dtt_seq(as.Date("2001-01-01"), as.Date("2001-01-05"))
dtt_seq <- function(from, to, units, length_out = NULL, ...) {
  UseMethod("dtt_seq")
}

#' @describeIn dtt_seq Create a Date sequence vector
#' @export
dtt_seq.Date <- function(from, to = from, units = "days", length_out = NULL, ...) {
  chk_date(from)
  chk_string(units)
  chk_subset(units, c("days", "months", "years"))
  if (!is.null(length_out)) chk_whole_number(length_out)
  chk_unused(...)

  from <- dtt_floor(from, units = units)

  if (!is.null(length_out)) {
    if (length_out == 0L) {
      return(from[-1])
    }
    if (length_out < 0) {
      to <- dtt_subtract_units(from, n = length_out * -1L - 1L, units = units)
    } else {
      to <- dtt_add_units(from, n = length_out - 1L, units = units)
    }
  }
  chk_date(to)
  to <- dtt_floor(to, units = units)
  if (from == to) {
    return(from)
  }

  ascending <- from < to
  if (!ascending) {
    to2 <- to
    to <- from
    from <- to2
  }

  seq <- seq(from, to, by = units2by(units))
  seq <- dtt_aggregate(seq, units = units)
  if (!ascending) seq <- rev(seq)
  seq
}

#' @describeIn dtt_seq Create a POSIXct sequence vector
#' @export
dtt_seq.POSIXct <- function(from, to = from, units = "seconds", length_out = NULL, ...) {
  chk_datetime(from)
  chk_string(units)
  chk_subset(units, c("seconds", "minutes", "hours", "days", "months", "years"))
  if (!is.null(length_out)) chk_whole_number(length_out)
  chk_unused(...)

  from <- dtt_floor(from, units = units)

  tz <- dtt_tz(from)
  if (!is.null(length_out)) {
    if (length_out == 0L) {
      return(from[-1])
    }
    if (length_out < 0) {
      to <- dtt_subtract_units(from, n = length_out * -1L - 1L, units = units)
    } else {
      to <- dtt_add_units(from, n = length_out - 1L, units = units)
    }
  }
  chk_datetime(to)
  chk_identical(dtt_tz(to), tz)
  to <- dtt_floor(to, units = units)
  if (from == to) {
    return(from)
  }

  ascending <- from < to
  if (!ascending) {
    to2 <- to
    to <- from
    from <- to2
  }

  seq <- seq(from, to, by = units2by(units), tz = tz)
  seq <- dtt_aggregate(seq, units = units)
  if (!ascending) seq <- rev(seq)
  seq
}


#' @describeIn dtt_seq Create a hms sequence vector
#' @export
dtt_seq.hms <- function(from, to = from, units = "seconds", length_out = NULL,
                        wrap = TRUE, ...) {
  chk_time(from)
  chk_string(units)
  chk_subset(units, c("seconds", "minutes", "hours"))
  if (!is.null(length_out)) chk_whole_number(length_out)
  chk_flag(wrap)
  chk_unused(...)

  from <- dtt_floor(from, units = units)

  if (!is.null(length_out)) {
    if (length_out == 0L) {
      return(from[-1])
    }
    if (length_out > dtt_units_per_unit(units)) {
      err("length_out of units must not exceed 24 hours")
    }

    if (length_out < 0) {
      to <- dtt_subtract_units(from, n = length_out * -1L - 1L, units = units)
    } else {
      to <- dtt_add_units(from, n = length_out - 1L, units = units)
    }
  }
  chk_time(to)
  to <- dtt_floor(to, units = units)
  if (from == to) {
    return(from)
  }

  ascending <- from < to
  if (!ascending) {
    if (!wrap) {
      to2 <- to
      to <- from
      from <- to2
    } else {
      to <- to + dtt_units_per_unit("seconds", "days")
    }
  }

  seq <- seq(as.integer(from), as.integer(to), by = dtt_units_per_unit("seconds", units))
  return(dtt_time(seq))
}
