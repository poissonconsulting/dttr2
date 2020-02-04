#' Check Time Zone
#'
#' Checks an object's time zone as returned by `dtt_tz()`.
#'
#' @param x The object to check.
#' @param x_name A string of the name of the object.
#' @param error A flag indicating whether to throw an informative error or immediately generate an informative message if the check fails.
#' @param tz A string of the time zone to check that x's matches.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso [dtt_tz()]
#' @export
#'
#' @examples
#' check_tz(Sys.time(), "UTC", error = FALSE)
check_tz <- function(x, tz = dtt_tz(x),
                     x_name = substitute(x),
                     error = TRUE) {
  lifecycle::deprecate_soft("0.1.0", "dttr2::check_tz()",
    details = "Replace with `chk::chk_identical(dtt_tz(x), tz)`. To check whether a valid time zone use `chk::chk_tz(x)`."
  )
  x_name <- deparse(x_name)
  chk_string(tz)
  chk_flag(error)

  if (!identical(tz, dtt_tz(x))) {
    if (error) {
      err(x_name, "'s time zone must be '", tz, "' not ('", dtt_tz(x), "')")
    }
    wrn(x_name, "'s time zone must be '", tz, "' not ('", dtt_tz(x), "')")
  }
  invisible(x)
}
