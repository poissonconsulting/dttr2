context("doy")

test_that("doy.Date", {
  expect_identical(dtt_doy(NA_Date_[-1]), integer(0))
  expect_identical(dtt_doy(NA_Date_), NA_integer_)
  expect_identical(
    dtt_doy(as.Date(c("2001-01-01", "2001-12-31", NA))),
    c(1L, 365L, NA)
  )
})

test_that("doy.POSIXct", {
  expect_identical(dtt_doy(NA_POSIXct_[-1]), integer(0))
  expect_identical(dtt_doy(NA_POSIXct_), NA_integer_)
  expect_identical(
    dtt_doy(as.POSIXct(c("2001-01-01", "2001-12-31", NA))),
    c(1L, 365L, NA)
  )
})

test_that("doy_to_date", {
  expect_identical(dtt_doy_to_date(numeric(0), 1), as.Date("2001-01-02")[-1])
  expect_identical(dtt_doy_to_date(0, 1), as.Date("0000-12-31"))
  expect_identical(dtt_doy_to_date(1:2, 2000L), as.Date(c("2000-01-01", "2000-01-02")))
  expect_identical(dtt_doy_to_date(1:2, 2002:2001), as.Date(c("2002-01-01", "2001-01-02")))
  expect_identical(dtt_doy_to_date(1:2, 2002:2001), as.Date(c("2002-01-01", "2001-01-02")))
  expect_identical(dtt_doy_to_date(c(NA, 2), 2002:2001), as.Date(c(NA, "2001-01-02")))

  expect_error(dtt_doy_to_date(0.33, 2000), "^`x` must be a whole numeric vector [(]integer vector or double equivalent[)][.]$", class = "chk_error")
})
