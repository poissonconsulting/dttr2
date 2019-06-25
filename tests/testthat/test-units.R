context("units")

test_that("units.Date", {
  expect_identical(dtt_units(NA_Date_), "days")
  expect_identical(dtt_units(NA_Date_[-1]), "days")
  expect_identical(dtt_units(as.Date("2000-01-01")), "years")
  expect_identical(dtt_units(as.Date("2000-02-01")), "months")
  expect_identical(dtt_units(as.Date("2000-02-03")), "days")
})

test_that("units.POSIXct", {
  expect_identical(dtt_units(NA_POSIXct_), "seconds")
  expect_identical(dtt_units(NA_POSIXct_[-1]), "seconds")
  expect_identical(dtt_units(as.POSIXct("2000-01-01")), "years")
  expect_identical(dtt_units(as.POSIXct("2000-02-01")), "months")
  expect_identical(dtt_units(as.POSIXct("2000-02-03")), "days")
  expect_identical(dtt_units(as.POSIXct("2000-01-01 01:00:00")), "hours")
  expect_identical(dtt_units(as.POSIXct("2000-02-01 00:01:00")), "minutes")
  expect_identical(dtt_units(as.POSIXct("2000-02-03 00:00:01")), "seconds")
})

test_that("units.hms", {
  expect_identical(dtt_units(NA_hms_), "seconds")
  expect_identical(dtt_units(NA_hms_[-1]), "seconds")
  expect_identical(dtt_units(hms::as.hms("01:00:00")), "hours")
  expect_identical(dtt_units(hms::as.hms("00:01:00")), "minutes")
  expect_identical(dtt_units(hms::as.hms("00:00:01")), "seconds")
})
