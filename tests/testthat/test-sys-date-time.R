test_that("sys-time", {
  expect_true(chk::vld_date_time(dtt_sys_date_time()))
  print(dtt_sys_date_time("Etc/GMT+12"))
  print(dtt_sys_date_time("Etc/GMT-12"))
  expect_warning(expect_true(dtt_sys_date_time("Etc/GMT+12") < dtt_sys_date_time("Etc/GMT-12")))
})
