test_that("chk_time", {
  expect_null(chk_time(hms::as_hms("19:03:14")))
  expect_invisible(chk_time(hms::as_hms("19:03:14")))
  expect_invisible(chk_time(hms::as_hms(1)))
  expect_error(chk_time(1), class = "chk_error")
})
