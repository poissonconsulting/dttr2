#' Parameters for dttr2 functions
#'
#' Descriptions of the parameters for the dttr2 functions.
#'
#' @keywords internal
#' @name params
#' @param x A date/time vector.
#' @param ... Unused.
#' @param units  A string of the time units. The possible values are "secs",
#' "minutes", "hours", "days" or "weeks".
#' @param unit A string of the time unit.
#' @param tz A string of the time zone.
#' @param n An integer of the number of units.
#' @param from A date/time scalar of the start.
#' @param to A date/time scalar of the end.
#' @param start An integer scalar of the starting month or a Date scalar of the starting date.
#' @param time A hms vector of the time.
#' @param date A Date vector of the date.
#' @param length_out An integer of the number of units from from.
#' @param wrap A flag specifying whether to wrap hms vectors from 23:59:59 to 00:00:00
#' @param abbr A flag specifying whether to abbreviate the week days.
#' @param as_difftime A flag specifying whether to return a difftime vector.
#' @param first A string of the name of first season or NULL in which case the first
#' season is that which includes Jan 1st.
#' @param y An object that can be coerced to a POSIXct using dtt_date_time().
#' @param full A flag specifying whether to return a character vector of the
#' study years (or an integer vector of the first year)
#' @param sort A flag specifying whether to sort the vector.
#' @param sorted A flag indicating whether the values must be sorted.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or
#' immediately generate an informative message if the check fails.
#' @param origin Origin date.
#' @param modern A flag specifying whether to use the modern or old Excel date system.
NULL
