#' Validate Time
#'
#' Validates that an object is scalar [hms::hms] object
#' using
#' `inherits(x, class) && length(x) == 1L && !anyNA(x)`.
#'
#' @inheritParams chk::chk_flag
#' @return A flag indicating whether the condition was met.
#' @seealso [chk_time()]
#' @export
#' @examples
#' vld_time(1)
#' vld_time(hms::as_hms("10:12:59"))
vld_time <- function(x) {
  inherits(x, "hms") && length(x) == 1L && !anyNA(x)
}
