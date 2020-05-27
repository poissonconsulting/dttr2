#' Get System Date
#'
#' @param tz A string of the time zone.
#' @return A floored Date scalar.
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
