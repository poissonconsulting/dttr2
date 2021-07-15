#' Check Time
#'
#' Checks if scalar hms object using [vld_time()].
#'
#' @inheritParams chk::chk_flag
#' @return `NULL`, invisibly. Called for the side effect of throwing an error
#'   if the condition is not met.
#' @family check
#' @export
#' @examples
#' chk_time(hms::as_hms("10:00:10"))
#' try(chk_time(1))
chk_time <- function(x, x_name = NULL) {
  if (vld_time(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))

  abort_chk(x_name, " must be a time (non-missing hms::hms scalar)")
}
