test_that("decade.Date", {
  expect_identical(dtt_decade(NA_Date_[-1]), integer(0))
  expect_identical(dtt_decade(NA_Date_), NA_integer_)
  expect_identical(dtt_decade(as.Date("2000-01-01")), 2000L)
  expect_identical(dtt_decade(as.Date("2009-12-31")), 2000L)
  expect_identical(dtt_decade(as.Date("2010-01-01")), 2010L)
  expect_identical(dtt_decade(as.Date(c("2000-01-01", NA))), c(2000L, NA_integer_))
  expect_identical(dtt_decade(as.Date(c("2000-01-01", NA))), c(2000L, NA_integer_))
  expect_identical(
    dtt_decade(as.Date(c("2001-01-01", "2015-12-13"))),
    c(2000L, 2010L)
  )
  bce <- as.Date("0000-01-01")
  expect_identical(dtt_decade(bce), 0L)
  expect_identical(dtt_decade(bce - 1L), -10L)
})
