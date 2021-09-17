#' Convert Feb 29 to Feb 28
#'
#' Converts Feb 29 to Feb 28th
#'
#' @param x A Date or POSIXct vector.
#'
#' @return The modified Date or POSIXct vector.
#' @family leap year
#' @export
#'
#' @examples
#' dtt_feb29_to_28(as.Date("2004-02-29"))
dtt_feb29_to_28 <- function(x) {
  if (!vld_s3_class(x, "Date") && !vld_s3_class(x, "POSIXct")) {
    chkor_vld(vld_s3_class(x, "Date"), vld_s3_class(x, "POSIXct"))
  }
  wch <- which(dtt_month(x) == 2L & dtt_day(x) == 29L)
  dtt_day(x[wch]) <- 28L
  x
}
