test_that("dtt_day_decimal.Date", {
  expect_identical(dtt_day_decimal(as.Date("2001-01-01")[-1]), numeric(0))
  expect_identical(dtt_day_decimal(as.Date("2001-01-01")), 1)
  expect_identical(dtt_day_decimal(NA_Date_), NA_real_)
  expect_identical(dtt_day_decimal(as.Date(c("2001-01-01", "1972-01-02"))), c(1, 2))
  expect_identical(dtt_day_decimal(as.Date(c("2001-01-03", NA_Date_))), c(3, NA))
})

test_that("dtt_day_decimal.POSIXct", {
  expect_identical(dtt_day_decimal(Sys.time()[-1]), numeric(0))
  expect_identical(dtt_day_decimal(as.POSIXct("2001-01-02", tz = "UTC")), 2)
  expect_identical(dtt_day_decimal(NA_POSIXct_), NA_real_)
  expect_equal(dtt_day_decimal(as.POSIXct("2001-01-03 02:03:31", tz = "UTC")), 3.08577546296296)
  expect_equal(
    dtt_day_decimal(as.POSIXct(c("2001-01-04 05:04:31", "2001-01-05 00:01:33"), tz = "UTC")),
    c(4.21146990740741, 5.00107638888889)
  )
  expect_equal(
    dtt_day_decimal(as.POSIXct("2001-01-01 23:32:31", tz = "UTC")),
    1.98091435185185
  )
  expect_equal(dtt_day_decimal(as.POSIXct("2001-01-12 16:06:31", tz = "Etc/GMT+8")), 12.6711921296296)
})
