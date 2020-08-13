test_that("year_decimal Date", {
  expect_identical(dtt_year_decimal(NA_Date_), NA_real_)
  expect_identical(dtt_year_decimal(structure(numeric(0), class = "Date")), numeric(0))
  expect_identical(dtt_year_decimal(dtt_date("2000-01-01")), 2000 + 0.5/366)
  expect_identical(dtt_year_decimal(dtt_date("1999-01-01")), 1999 + 0.5/365)
  expect_identical(dtt_year_decimal(dtt_date("1999-12-31")), 1999 + 364.5/365)
})
