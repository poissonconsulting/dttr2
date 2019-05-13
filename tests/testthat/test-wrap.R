context("wrap")

test_that("wrap.hms", {
  expect_identical(dtt_wrap(NA_hms_[-1]), NA_hms_[-1])
  expect_identical(dtt_wrap(NA_hms_), NA_hms_)
  expect_identical(dtt_wrap(hms::as_hms("00:00:00")), hms::as_hms("00:00:00"))
  expect_identical(dtt_wrap(hms::as_hms("23:59:59")), hms::as_hms("23:59:59"))
  expect_identical(dtt_wrap(hms::as_hms("24:00:00")), hms::as_hms("00:00:00"))
  expect_identical(dtt_wrap(hms::as_hms(-2)), hms::as_hms("23:59:58"))
})
