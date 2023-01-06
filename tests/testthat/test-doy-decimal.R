test_that("doy_decimal.Date", {
  expect_identical(dtt_doy_decimal(NA_Date_[-1]), numeric(0))
  expect_identical(dtt_doy_decimal(NA_Date_), NA_real_)
  expect_identical(
    dtt_doy_decimal(as.Date(c("2001-01-01", "2001-12-31", NA))),
    c(1, 365, NA)
  )
})

test_that("doy_decimal.POSIXct", {
  expect_identical(dtt_doy_decimal(NA_POSIXct_[-1]), numeric(0))
  expect_identical(dtt_doy_decimal(NA_POSIXct_), NA_real_)
  expect_equal(
    dtt_doy_decimal(as.POSIXct(c("2001-01-01", "2001-12-31", NA))),
    c(1, 365, NA)
  )
  expect_equal(
    dtt_doy_decimal(
      as.POSIXct(
        c("2001-01-01 00:00:01", "2001-12-31 23:59:59", NA)
      )
    ),
    c(1.00001157407407, 365.999988425926, NA)
  )
})
