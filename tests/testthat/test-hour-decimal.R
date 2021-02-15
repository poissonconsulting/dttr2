test_that("dtt_hour_decimal.Date", {
  expect_identical(dtt_hour_decimal(as.Date("2001-01-01")[-1]), numeric(0))
  expect_identical(dtt_hour_decimal(as.Date("2001-01-01")), 0)
  expect_identical(dtt_hour_decimal(NA_Date_), 0)
  expect_identical(dtt_hour_decimal(as.Date(c("2001-01-01", "1972-01-01"))), c(0, 0))
  expect_identical(dtt_hour_decimal(as.Date(c("2001-01-01", NA_Date_))), c(0, 0))
})

test_that("dtt_hour_decimal.POSIXct", {
  expect_identical(dtt_hour_decimal(Sys.time()[-1]), numeric(0))
  expect_identical(dtt_hour_decimal(as.POSIXct("2001-01-01", tz = "UTC")), 0)
  expect_identical(dtt_hour_decimal(NA_POSIXct_), NA_real_)
  expect_equal(dtt_hour_decimal(as.POSIXct("2001-01-01 02:03:31", tz = "UTC")), 2.05861111111111)
  expect_equal(
    dtt_hour_decimal(as.POSIXct(c("2001-01-01 05:04:31", "2001-01-02 00:01:33"), tz = "UTC")),
    c(5.07527777777778, 0.0258333333333333)
  )
  expect_equal(
    dtt_hour_decimal(as.POSIXct("2001-01-01 23:32:31", tz = "UTC")),
    23.5419444444444
  )
  expect_equal(
    dtt_hour_decimal(NA_POSIXct_),
    NA_real_
  )
  expect_equal(dtt_hour_decimal(as.POSIXct("2001-01-01 16:06:31", tz = "Etc/GMT+8")), 16.1086111111111)
})

test_that("dtt_hour_decimal.hms", {
  expect_identical(dtt_hour_decimal(hms::as_hms(1)[-1]), numeric(0))
  expect_identical(dtt_hour_decimal(NA_hms_), NA_real_)
  expect_identical(dtt_hour_decimal(hms::as_hms(3600)), 1)
  expect_equal(dtt_hour_decimal(hms::as_hms(1)), 0.000277777777777778)
  expect_equal(dtt_hour_decimal(hms::as_hms(-1)), 23.9997222222222)
  expect_equal(dtt_hour_decimal(hms::as_hms("20:30:32")), 20.5088888888889)
  expect_equal(dtt_hour_decimal(hms::as_hms(-3601)), 22.9997222222222)
  expect_identical(dtt_hour_decimal(c(hms::as_hms(3600), NA_hms_)), c(1, NA_integer_))
  expect_identical(dtt_hour_decimal(hms::as_hms("24:00:00")), 0)
})
