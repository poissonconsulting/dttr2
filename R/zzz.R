.onLoad <- function(libname, pkgname) {
  op <- options()
  op.devtools <- list(
    dtt.default_tz = "UTC"
  )
  toset <- !(names(op.devtools) %in% names(op))
  if(any(toset)) options(op.devtools[toset])

  invisible()
}
