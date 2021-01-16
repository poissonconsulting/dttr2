test_that("days_in_year", {
  expect_identical(dtt_days_in_year(NA_Date_), NA_integer_)
  expect_identical(dtt_days_in_year(as.Date("2000-10-01")[-1]), integer(0))
  expect_identical(dtt_days_in_year(as.Date("2000-10-01")), 366L)
  expect_identical(dtt_days_in_year(as.Date("2001-10-01")), 365L)
  expect_identical(dtt_days_in_year(as.Date(c("2001-10-01", NA, "2004-12-31"))), c(365L, NA, 366L))
  expect_identical(dtt_days_in_year(as.POSIXct(c("2001-10-01", NA, "2004-12-31"), tz = "UTC")), c(365L, NA, 366L))
})
