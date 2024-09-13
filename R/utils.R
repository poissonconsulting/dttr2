#' @exportS3Method base::c
c.POSIXct <- function(..., recursive = FALSE) {
  dots <- list(...)
  .POSIXct(c(unlist(lapply(dots, unclass))), tz = dtt_tz(dots[[1]]))
}

#' @exportS3Method base::c
c.hms <- function(..., recursive = FALSE) {
  dots <- list(...)
  hms::as_hms(c(unlist(lapply(dots, unclass))))
}
