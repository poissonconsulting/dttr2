context("Date")

test_that("Date", {
  expect_identical(as.double(as.Date("1970-01-01") + 0.99), 0.99)
})
