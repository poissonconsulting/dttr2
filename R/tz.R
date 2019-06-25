#' Get, Set or Reset Default Time Zone
#'
#' @param tz A string of the time zone.
#'
#' @return A string of the current or old time zone.
#' @export
#'
#' @examples
#' \dontrun{
#' dtt_default_tz()
#' old <- dtt_set_default_tz("Etc/GMT+8")
#' dtt_default_tz()
#' dtt_reset_default_tz()
#' dtt_default_tz()
#' dtt_set_default_tz(old)
#' dtt_default_tz()
#' }
dtt_default_tz <- function() {
  getOption("dtt.default_tz", Sys.timezone())
}

#' @describeIn dtt_default_tz Set Default Time Zone
#' @export
dtt_set_default_tz <- function(tz = NULL) {
  checkor(check_null(tz), check_string(tz))
  default_tz <- options(dtt.default_tz = tz)$dtt.default_tz
  if(is.null(default_tz)) default_tz <- Sys.timezone()
  invisible(default_tz)
}

#' @describeIn dtt_default_tz Reset Default Time Zone
#' @export
dtt_reset_default_tz <- function() {
  dtt_set_default_tz()
}

#' Get, Set or Adjust Time Zone
#' 
#' Gets, sets or  the time zone for a date time vector.
#' @param x A date time vector.
#' @param ... Unused.
#'
#' @return A string of the time zone.
#' @export
#'
#' @examples
#' dtt_tz(as.POSIXct("1970-01-01", tz = "Etc/GMT+8"))
dtt_tz <- function(x, ...) {
  UseMethod("dtt_tz")
}

#' @describeIn dtt_tz Get the time zone for a POSIXct vector.
#' @export
dtt_tz.POSIXct <- function(x, ...) {
  check_unused(...)
  tz <- attr(x, "tzone")
  if(is.null(tz) || identical(tz, "")) return(Sys.timezone()) 
  tz
}

#' Set Time Zone
#' 
#' Sets the time zone for a date time vector without adjusting the clock time.
#' Equivalent to \code{lubridate::force_tz()}.
#'
#' @param x A date time vector.
#' @param tz A string of the new time zone.
#' @param ... Unused.
#'
#' @return The date time vector with the new time zone.
#' @seealso \code{\link{dtt_adjust_tz}()}
#' @export
#'
#' @examples
#' dtt_set_tz(as.POSIXct("1970-01-01", tz = "Etc/GMT+8"), tz = "UTC")
dtt_set_tz <- function(x, tz = dtt_default_tz(), ...) {
  UseMethod("dtt_set_tz")
}

#' @describeIn dtt_set_tz Set the time zone for a POSIXct vector
#' @export
dtt_set_tz.POSIXct <- function(x, tz = dtt_default_tz(), ...) {
  check_string(tz)
  check_unused(...)
  if(dtt_tz(x) == tz) return(x)
  dtt_date_time(format(x, tz = dtt_tz(x)), tz = tz)
}

#' Adjust Time Zone
#' 
#' Adjusts the time zone so that clock (but not the actual) time is altered
#' for a date time vector.
#' Equivalent to \code{lubridate::with_tz()}.
#'
#' @param x A POSIXct vector.
#' @param tz A string of the time zone.
#' @param ... Unused
#' @return The date time vector with the new time zone and time.
#' @seealso \code{\link{dtt_set_tz}()}
#' @export
#'
#' @examples
#' dtt_adjust_tz(as.POSIXct("1970-01-01", tz = "Etc/GMT+8"), tz = "UTC")
dtt_adjust_tz <- function(x, tz = dtt_default_tz(), ...) {
  UseMethod("dtt_adjust_tz")
}

#' @describeIn dtt_adjust_tz Adjust the time zone for a POSIXct vector
#' @export
dtt_adjust_tz.POSIXct <- function(x, tz = dtt_default_tz(), ...) {
  check_string(tz)
  check_unused(...)
  attr(x, "tzone") <- tz
  x
}
