test_that("vld_time", {
  expect_true(vld_time(hms::as_hms("19:03:14")))
  expect_true(vld_time(hms::as_hms("19:03:14")))
  expect_true(vld_time(hms::as_hms(1)))
  expect_false(vld_time(1))
  expect_false(vld_time(hms::hms(1)[-1]))
  expect_false(vld_time(hms::hms(NA)))
  expect_false(vld_time(hms::hms(c(1, 1))))
})
