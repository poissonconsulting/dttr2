#' Get System Time
#'
#' @param tz A string of the time zone.
#' @return A floored hms scalar.
#' @export
#'
#' @examples
#' \dontrun{
#' dtt_sys_time()
#' }
dtt_sys_time <- function(tz = dtt_default_tz()) {
  dtt_time(dtt_sys_date_time(tz = tz))
}
