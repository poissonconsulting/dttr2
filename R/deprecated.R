#' @rdname dtt_second
#' @export
dtt_seconds <- function(x, ...) {
  .Deprecated("dtt_second")
  UseMethod("dtt_second")
}

#' @rdname dtt_second
#' @export
`dtt_seconds<-` <- function(x, value) {
  .Deprecated("dtt_second<-")
  UseMethod("dtt_second<-")
}

#' @rdname dtt_minute
#' @export
dtt_minutes <- function(x, ...) {
  .Deprecated("dtt_minute")
  UseMethod("dtt_minute")
}

#' @rdname dtt_minute
#' @export
`dtt_minutes<-` <- function(x, value) {
  .Deprecated("dtt_minute<-")
  UseMethod("dtt_minute<-")
}

#' Is Date Time
#'
#' @param x An R object.
#'
#' @return A flag indicating whether R is a POSIXct vector.
#' @export
dtt_is_date_time <- function(x) {
  .Deprecated("is.POSIXct")
  is.POSIXct(x)
}

#' Is Date
#'
#' @param x An R object.
#'
#' @return A flag indicating whether R is a Date vector.
#' @export
dtt_is_date <- function(x) {
  .Deprecated("is.Date")
  is.Date(x)
}

#' @rdname dtt_hour
#' @export
dtt_hours <- function(x, ...) {
  .Deprecated("dtt_hour")
  UseMethod("dtt_hour")
}

#' @rdname dtt_hour
#' @export
`dtt_hours<-` <- function(x, value) {
  .Deprecated("dtt_hour<-")
  UseMethod("dtt_hour<-")
}

#' @rdname dtt_day
#' @export
dtt_days <- function(x, ...) {
  .Deprecated("dtt_day")
  UseMethod("dtt_day")
}

#' @rdname dtt_day
#' @export
`dtt_days<-` <- function(x, value) {
  .Deprecated("dtt_day<-")
  UseMethod("dtt_day<-")
}

#' @rdname dtt_default_tz
#' @export
dtt_sys_tz <- function() {
  .Deprecated("dtt_default_tz")
  dtt_default_tz()
}

#' @rdname dtt_default_tz
#' @export
dtt_set_sys_tz <- function(tz = NULL) {
  .Deprecated("dtt_set_default_tz")
  dtt_set_default_tz(tz = tz)
}

#' @rdname dtt_default_tz
#' @export
dtt_reset_sys_tz <- function() {
  .Deprecated("dtt_reset_default_tz")
  dtt_reset_default_tz()
}

#' @rdname dtt_month
#' @export
dtt_months <- function(x, ...) {
  .Deprecated("dtt_month")
  UseMethod("dtt_month")
}

#' @rdname dtt_month
#' @export
`dtt_months<-` <- function(x, value) {
  .Deprecated("dtt_month<-")
  UseMethod("dtt_month<-")
}

#' @rdname dtt_year
#' @export
dtt_years <- function(x, ...) {
  .Deprecated("dtt_year")
  UseMethod("dtt_year")
}

#' @rdname dtt_year
#' @export
`dtt_years<-` <- function(x, value) {
  .Deprecated("dtt_year<-")
  UseMethod("dtt_year<-")
}

#' Dayte Time
#'
#' @param x A Date or POSIXct vector.
#' @param start An integer vector specifying the start month of the year or a Date vector of the start dayte.
#' @return A Date or POSIXct vector with the year for February 29th as 1972.
#' @export
dtt_daytt <- function(x, start = 1L) {
  .Deprecated("dtt_dayte or dtt_dayte_time")
  daytte(x, start = start)
}
