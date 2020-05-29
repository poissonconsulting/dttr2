test_that("sys-time", {
  expect_true(chk::vld_date(dtt_sys_date()))
  expect_true(dtt_sys_date("Etc/GMT+12") < dtt_sys_date("Etc/GMT-12"))
})
