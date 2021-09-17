test_that("Date", {
  expect_identical(as.double(as.Date("1970-01-01") + 0.99), 0.99)
})

test_that("c", {
  expect_identical(as.double(as.Date("1970-01-01") + 0.99), 0.99)
  expect_equal(
    dtt_tz(c(as.POSIXct("2001-01-01 23:32:31", tz = "UTC"), NA_POSIXct_)), "UTC"
  )
})
