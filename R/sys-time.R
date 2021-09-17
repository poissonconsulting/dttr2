#' Get System Time
#'
#' @inheritParams params
#'
#' @return A floored hms scalar.
#' @family sys
#' @export
#'
#' @examples
#' \dontrun{
#' dtt_sys_time()
#' }
dtt_sys_time <- function(tz = dtt_default_tz()) {
  dtt_time(dtt_sys_date_time(tz = tz))
}
