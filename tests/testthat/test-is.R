context("is")

test_that("is false", {
  expect_false(is.POSIXct(1))
  expect_false(is.Date(1))
  expect_false(is.hms(1))
})


test_that("is true", {
  expect_true(is.POSIXct(as.POSIXct("2001-01-01", tz = "UTC")))
  expect_true(is.Date(as.Date("2000-01-01")))
  expect_true(is.hms(hms::as_hms("00:00:01")))
})
