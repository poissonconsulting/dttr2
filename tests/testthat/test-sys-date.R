test_that("sys-time", {
  expect_is(dtt_sys_date(), "Date")
  expect_true(dtt_sys_date("Etc/GMT+12") < dtt_sys_date("Etc/GMT-12"))
})
