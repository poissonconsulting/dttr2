context("check")

test_that("check_tz", {
  x <- check_tz(as.POSIXct("1970-01-01", tz = "GMT"))
  expect_error(check_tz(x, "UTC"), "x's time zone must be 'UTC' not [(]'GMT'[)]")
})
