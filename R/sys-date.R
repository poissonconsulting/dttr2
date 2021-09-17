#' Get System Date
#'
#' @inheritParams params
#'
#' @return A floored Date scalar.
#' @family sys
#' @export
#'
#' @examples
#' \dontrun{
#' dtt_set_default_tz("Etc/GMT+12")
#' dtt_sys_date()
#' dtt_set_default_tz("Etc/GMT-12")
#' dtt_sys_date()
#' dtt_sys_date(tz = "Etc/GMT+12")
#' }
dtt_sys_date <- function(tz = dtt_default_tz()) {
  dtt_date(dtt_sys_date_time(tz = tz))
}
