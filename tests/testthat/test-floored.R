context("floored")

test_that("floored", {
  expect_true(dtt_floored(as.Date("2002-02-02"), "days"))
  expect_false(dtt_floored(as.Date("2002-02-02"), "months"))
  expect_false(dtt_floored(as.Date("2002-01-02"), "months"))
  expect_true(dtt_floored(as.Date("2002-02-01"), "months"))
  expect_true(dtt_floored(hms::as_hms("01:02:00"), "seconds"))
  expect_true(dtt_floored(hms::as_hms("01:20:00"), "minutes"))
  expect_false(dtt_floored(hms::as_hms("01:00:10"), "minutes"))
  expect_true(dtt_floored(as.POSIXct("2000-02-02", tz = "Etc/GMT+9"), "seconds"))
})
