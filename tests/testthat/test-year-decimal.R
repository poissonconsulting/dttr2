test_that("year_decimal Date", {
  expect_identical(dtt_year_decimal(NA_Date_), NA_real_)
  expect_identical(dtt_year_decimal(structure(numeric(0), class = "Date")), numeric(0))
  expect_identical(dtt_year_decimal(dtt_date("2000-01-01")), 2000)
  expect_identical(dtt_year_decimal(dtt_date("1999-01-01")), 1999)
  expect_identical(dtt_year_decimal(dtt_date("1999-12-31")), 1999 + 364 / 365)
  expect_identical(dtt_year_decimal(dtt_date("2000-12-31")), 2000 + 365 / 366)
})

test_that("dtt_year.POSIXct", {
  expect_identical(dtt_year_decimal(Sys.time()[-1]), numeric(0))
  expect_equal(dtt_year_decimal(as.POSIXct("2001-02-01", tz = "UTC")), 2001.08493150685)
  expect_identical(dtt_year_decimal(NA_POSIXct_), NA_real_)
  expect_equal(dtt_year_decimal(as.POSIXct("2003-03-01 02:03:31", tz = "UTC")), 2003.16187883688)
  expect_equal(
    dtt_year_decimal(as.POSIXct(c("2004-04-01 05:06:31", "2005-06-05 00:01:33"), tz = "UTC")),
    c(2004.24921546119, 2005.42466048326)
  )
  expect_equal(
    dtt_year_decimal(as.POSIXct(c("2008-07-01 23:32:31", NA), tz = "UTC")),
    c(2008.49994785342, NA)
  )
  expect_equal(dtt_year_decimal(as.POSIXct("2009-08-12 16:06:31", tz = "Etc/GMT+8")), 2009.61279778666)
})
