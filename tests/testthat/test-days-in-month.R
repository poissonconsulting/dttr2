test_that("days_in_month", {
  expect_identical(dtt_days_in_month(NA_Date_), NA_integer_)
  expect_identical(dtt_days_in_month(as.Date("2000-10-01")[-1]), integer(0))
  expect_identical(dtt_days_in_month(as.Date("2000-10-01")), 31L)
  expect_identical(dtt_days_in_month(as.Date("2001-09-01")), 30L)
  expect_identical(
    dtt_days_in_month(
      as.Date(c("2001-02-01", NA, "2004-02-03"))
    ),
    c(28L, NA, 29L)
  )
  expect_identical(
    dtt_days_in_month(
      as.POSIXct(c("2001-02-01", NA, "2004-02-03"), tz = "UTC")
    ),
    c(28L, NA, 29L)
  )
})
