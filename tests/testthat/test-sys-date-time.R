test_that("sys-time", {
  expect_true(chk::vld_date_time(dtt_sys_date_time()))
  expect_identical(dtt_tz(dtt_sys_date_time("Etc/GMT+12")), "Etc/GMT+12")
})
