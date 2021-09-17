#' Get System Date Time
#'
#' @inheritParams params
#'
#' @return A floored POSIXct scalar.
#' @family sys
#' @export
#'
#' @examples
#' \dontrun{
#' dtt_set_default_tz("UTC")
#' dtt_sys_date_time()
#' dtt_set_default_tz("Etc/GMT+8")
#' dtt_sys_date_time()
#' dtt_sys_date_time(tz = "UTC")
#' }
dtt_sys_date_time <- function(tz = dtt_default_tz()) {
  dtt_adjust_tz(Sys.time(), tz = tz)
}
