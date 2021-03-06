test_that("POSIXct", {
  expect_identical(as.double(hms::as_hms(0)), 0)
  expect_identical(as.double(hms::as_hms(0.1)), 0.1)
  expect_identical(as.double(hms::as_hms(0.99)), 0.99)
  expect_identical(as.double(hms::as_hms(1.99)), 1.99)
  expect_identical(as.double(hms::as_hms(-0.1)), -0.1)
  expect_identical(as.double(hms::as_hms(-0.99)), -0.99)
  expect_identical(as.double(hms::as_hms(-1.99)), -1.99)

  expect_identical(format(hms::as_hms(0)), "00:00:00")
  expect_identical(format(hms::as_hms(0.1)), "00:00:00.1")
  expect_identical(format(hms::as_hms(0.99)), "00:00:00.99")
  expect_identical(format(hms::as_hms(1)), "00:00:01")
  expect_identical(format(hms::as_hms(1.99)), "00:00:01.99")
  expect_identical(format(hms::as_hms(-0.1)), "-00:00:00.1")
  expect_identical(format(hms::as_hms(-0.99)), "-00:00:00.99")
  expect_identical(format(hms::as_hms(-1)), "-00:00:01")
  expect_identical(format(hms::as_hms(-1.99)), "-00:00:01.99")
  expect_identical(format(hms::as_hms(-1.99 + 1)), "-00:00:00.99")
  expect_identical(format(hms::as_hms(-1.99 + 2)), "00:00:00.01")
  expect_identical(format(hms::as_hms(-1.99 + 3)), "00:00:01.01")
})
