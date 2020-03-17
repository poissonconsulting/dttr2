test_that("diff", {
  expect_equal(dtt_diff(as.Date(character(0)), as.Date("2001-01-01")), numeric(0))
  expect_equal(dtt_diff(NA_character_, as.Date("2001-01-01")), NA_real_)
  expect_equal(dtt_diff(as.Date(c("2001-01-02", "2000-12-31")), as.Date("2001-01-01"), "hours"),
               c(24, -24))
  expect_equal(dtt_diff(as.Date("2001-01-02"), as.Date("2001-01-01"), "weeks"), 1/7)
  expect_equal(dtt_diff(as.POSIXct("2001-01-02"), as.POSIXct("2001-01-01"), "weeks"), 1/7)
  expect_equal(dtt_diff(as.POSIXct("2001-01-01", tz = "Etc/GMT+8"), as.POSIXct("2001-01-01", tz = "Etc/GMT+9"), "hours"), -1)
  expect_equal(dtt_diff(as.POSIXct("2001-01-01 00:01:00", tz = "Etc/GMT+8"), as.POSIXct("2001-01-01 00:02:31", tz = "Etc/GMT+9"), "mins"), -61.5166666666667)
})