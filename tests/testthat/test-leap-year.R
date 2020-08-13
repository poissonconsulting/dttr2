test_that("leap_year", {
  expect_identical(dtt_leap_year(NA_Date_), NA)
  expect_identical(dtt_leap_year(as.Date("2000-10-01")), TRUE)
  expect_identical(dtt_leap_year(structure(numeric(0), class = "Date")), logical(0))
  expect_identical(dtt_leap_year(as.Date(c("2000-10-01", "1999-10-01"))), c(TRUE, FALSE))
  expect_identical(dtt_leap_year(as.POSIXct(c("2000-10-01", "1999-10-01"))), c(TRUE, FALSE))
})
