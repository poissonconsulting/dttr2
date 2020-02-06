#' @export
universals::numericise

#' @inherit universals::numericise
#' @details Unlike the other functions in the package 
#' for handling date time objects, `numericise()` does not floor times.
#' @return A double numeric atomic vector object.
#' @export
#' @examples
#' numericise(hms::as_hms("00:01:03"))
numericise.hms <- function(x, ...) {
  x <- unclass(x)
  as.numeric(x)
}
