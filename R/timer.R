#' Use a dtt_timer
#'
#' @param seconds A count of the start time in seconds.
#' @param start A flag indicating whether to start the timer.
#' @param x A hms scalar.
#'
#' @export
#'
#' @examples
#' # create a new timer
#' t <- dtt_timer()
#'
#' # no time has elapsed because the timer has not started
#' dtt_elapsed(t)
#'
#' # start the timer
#' t <- dtt_start(t)
#'
#' # get the time elapsed
#' # time elapsed is increasing because the timer is still running
#' Sys.sleep(1)
#' dtt_elapsed(t)
#' Sys.sleep(1)
#' dtt_elapsed(t)
#'
#' # stop the timer
#' t <- dtt_stop(t)
#'
#' # time elapsed is now fixed
#' dtt_elapsed(t)
#' Sys.sleep(1)
#' dtt_elapsed(t)
#'
#' # reset the timer
#' t <- dtt_reset(t)
#' dtt_elapsed(t)
dtt_timer <- function(seconds = 0L, start = FALSE) {
  check_scalar(seconds, c(0L, as.integer(dtt_units_per_unit(unit = "years"))))
  check_flag(start)
 
  x <- hms::as_hms(seconds)
  if(start) x <- dtt_start(x)
  x
}

#' @describeIn dtt_timer Start Timer
#' @export
dtt_start <- function(x) {
  if(dtt_is_running(x)) {
    wrn("dtt_timer is already started")
    return(x)
  }
  attr(x, "start") <- as.integer(Sys.time())
  x
}

#' @describeIn dtt_timer Stop Timer
#' @export
dtt_stop <- function(x) {
  if(!dtt_is_running(x)) {
    wrn("dtt_timer is already stopped")
    return(x)
  }
  x <- dtt_elapsed(x)
  attr(x, "start") <- NULL
  x
}

#' @describeIn dtt_timer Elapsed Time
#' @export
dtt_elapsed <- function(x) {
  if(!dtt_is_running(x)) return(x)
  hms::as_hms(as.integer(x) + as.integer(Sys.time()) - attr(x, "start"))
}

#' @describeIn dtt_timer Reset Timer
#' @export
dtt_reset <- function(x, seconds = 0L, start = FALSE) {
  dtt_timer(seconds = seconds, start = start)
}

#' @describeIn dtt_timer Is Running
#' @export
dtt_is_running <- function(x) {
  check_scalar(x, hms::as_hms(c(0L, dtt_units_per_unit(unit = "years"))), named = NA)
  !is.null(attr(x, "start"))
}
