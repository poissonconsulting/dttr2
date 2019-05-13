#' Check Time Zone
#' 
#' Checks an object's time zone as returned by \code{dtt_tz()}.
#' 
#' @inheritParams checkr::check_sorted
#' @param tz A string of the time zone to check that x's matches.
#' @inheritParams dtt_tz
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{dtt_tz}}
#' @export
#'
#' @examples
#' check_tz(Sys.time(), "UTC", error = FALSE)
check_tz <- function(x, tz = dtt_tz(x),
                     x_name = substitute(x),
                     error = TRUE) {
  x_name <- chk_deparse(x_name)
  check_string(tz)
  check_flag(error)
  
  if (!identical(tz, dtt_tz(x))) {
    chk_fail(x_name, "'s time zone must be '", tz, "' not ('", dtt_tz(x),"')", 
             error = error)
  }
  invisible(x)
}
