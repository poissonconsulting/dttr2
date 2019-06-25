context("wrap")

test_that("wrap.hms", {
  expect_identical(dtt_wrap(NA_hms_[-1]), NA_hms_[-1])
  expect_identical(dtt_wrap(NA_hms_), NA_hms_)
  expect_identical(dtt_wrap(hms::as.hms("00:00:00")), hms::as.hms("00:00:00"))
  expect_identical(dtt_wrap(hms::as.hms("23:59:59")), hms::as.hms("23:59:59"))
  expect_identical(dtt_wrap(hms::as.hms("24:00:00")), hms::as.hms("00:00:00"))
  expect_identical(dtt_wrap(hms::as.hms(-2)), hms::as.hms("23:59:58"))
})
