test_that("dtt_month_decimal.Date", {
  expect_identical(dtt_month_decimal(as.Date("2001-01-01")[-1]), numeric(0))
  expect_identical(dtt_month_decimal(as.Date("2001-01-01")), 1)
  expect_identical(dtt_month_decimal(NA_Date_), NA_real_)
  expect_identical(
    dtt_month_decimal(as.Date(c("2001-01-01", "1972-02-01"))),
    c(1, 2)
  )
  expect_equal(
    dtt_month_decimal(as.Date(c("2001-04-03", NA_Date_))),
    c(4.06666666666667, NA)
  )
})

test_that("dtt_month_decimal.POSIXct", {
  expect_identical(dtt_month_decimal(Sys.time()[-1]), numeric(0))
  expect_identical(dtt_month_decimal(as.POSIXct("2001-02-01", tz = "UTC")), 2)
  expect_identical(dtt_month_decimal(NA_POSIXct_), NA_real_)
  expect_identical(
    dtt_month_decimal(as.POSIXct("2001-03-01 02:03:31", tz = "UTC")),
    3.00276695041816
  )
  expect_equal(
    dtt_month_decimal(
      as.POSIXct(c("2001-04-01 05:06:31", "2001-06-05 00:01:33"), tz = "UTC")
    ),
    c(4.00709529320988, 6.13336921296296)
  )
  expect_equal(
    dtt_month_decimal(as.POSIXct(c("2001-07-01 23:32:31", NA), tz = "UTC")),
    c(7.03164239844683, NA)
  )
  expect_equal(
    dtt_month_decimal(as.POSIXct("2001-08-12 16:06:31", tz = "Etc/GMT+8")),
    8.37649006869773
  )
})
