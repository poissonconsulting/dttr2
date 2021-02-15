test_that("dtt_minute_decimal_decimal.Date", {
  expect_identical(dtt_minute_decimal(as.Date("2001-01-01")[-1]), numeric(0))
  expect_identical(dtt_minute_decimal(as.Date("2001-01-01")), 0)
  expect_identical(dtt_minute_decimal(NA_Date_), 0)
  expect_identical(dtt_minute_decimal(as.Date(c("2001-01-01", "1972-01-01"))), c(0, 0))
  expect_identical(dtt_minute_decimal(as.Date(c("2001-01-01", NA_Date_))), c(0, 0))
})

test_that("dtt_minute_decimal.POSIXct", {
  expect_identical(dtt_minute_decimal(Sys.time()[-1]), numeric(0))
  expect_identical(dtt_minute_decimal(as.POSIXct("2001-01-01", tz = "UTC")), 0)
  expect_identical(dtt_minute_decimal(NA_POSIXct_), NA_real_)
  expect_equal(dtt_minute_decimal(as.POSIXct("2001-01-01 00:03:31", tz = "UTC")), 3.51666666666667)
  expect_equal(
    dtt_minute_decimal(as.POSIXct(c("2001-01-01 00:04:31", "2001-01-02 00:01:33"), tz = "UTC")),
    c(4.51666666666667, 1.55)
  )
  expect_equal(
    dtt_minute_decimal(c(as.POSIXct("2001-01-01 00:32:31", tz = "UTC"), NA_POSIXct_)),
    c(32.5166666666667, NA)
  )
  expect_equal(dtt_minute_decimal(as.POSIXct("2001-01-01 00:06:31", tz = "Etc/GMT+8")), 6.51666666666667)
})

test_that("dtt_minute_decimal.hms", {
  expect_identical(dtt_minute_decimal(hms::as_hms(1)[-1]), numeric(0))
  expect_identical(dtt_minute_decimal(NA_hms_), NA_real_)
  expect_identical(dtt_minute_decimal(hms::as_hms(60)), 1)
  expect_identical(dtt_minute_decimal(hms::as_hms(0)), 0)
  expect_equal(dtt_minute_decimal(hms::as_hms(1)), 0.0166666666666667)
  expect_equal(dtt_minute_decimal(hms::as_hms(-1)), 59.9833333333333)
  expect_equal(dtt_minute_decimal(hms::as_hms("20:30:32")), 30.5333333333333)
  expect_equal(dtt_minute_decimal(hms::as_hms(-63)), 58.95)
  expect_identical(dtt_minute_decimal(c(hms::as_hms(60), NA_hms_)), c(1, NA_real_))
  expect_identical(dtt_minute_decimal(hms::as_hms("24:00:00")), 0)
})
