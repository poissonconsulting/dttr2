test_that("sys-time", {
  expect_is(dtt_sys_date_time(), "POSIXct")
  expect_warning(expect_true(dtt_sys_date_time("Etc/GMT+12") < dtt_sys_date_time("Etc/GMT-12")))
})
