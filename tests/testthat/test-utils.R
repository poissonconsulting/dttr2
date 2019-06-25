context("utils")

test_that("units_per_unit", {
  expect_identical(dtt_units_per_unit(), 86400)
  expect_identical(dtt_units_per_unit("hours"), 24)
  expect_identical(dtt_units_per_unit("minutes", "seconds"), 1/60)
  expect_equal(dtt_units_per_unit("days", "months"), 30.41667, tolerance = 1e-06)
})

test_that("adjust_units", {
  expect_identical(dtt_adjust_units(1), 1)
  expect_identical(dtt_adjust_units(1, "minutes"), 60)
  expect_identical(dtt_adjust_units(1, to = "minutes"), 1/60)
})

test_that("NA", {
  expect_true(is.na(NA_POSIXct_))
  expect_true(is.POSIXct(NA_POSIXct_))
  expect_false(is.Date(NA_POSIXct_))
  expect_true(is.na(NA_Date_))
  expect_true(is.Date(NA_Date_))
  expect_false(is.POSIXct(NA_Date_))
  expect_true(is.na(NA_hms_))
  expect_false(is.Date(NA_hms_))
  expect_false(is.POSIXct(NA_hms_))
})

test_that("c.POSIXct", {
  expect_equal(c(as.POSIXct("2001-01-01")), as.POSIXct("2001-01-01"))
})

test_that("c.hms", {
  expect_identical(c(hms::as.hms("00:00:00")), hms::as.hms("00:00:00"))
})
