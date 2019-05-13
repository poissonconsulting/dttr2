#' Missing POSIXct
#' 
#' A missing POSIXct object
#' @export
NA_POSIXct_ <- set_attr(set_class(NA_real_, c("POSIXct", "POSIXt")), "tzone", "UTC")

#' Missing Date
#' 
#' A missing Date object
#' @export
NA_Date_ <- set_class(NA_real_, "Date")

#' Missing hms
#' 
#' A missing hms object
#' @export
NA_hms_ <- set_class(as.difftime(NA_real_, units = "secs"), c("hms", "difftime"))