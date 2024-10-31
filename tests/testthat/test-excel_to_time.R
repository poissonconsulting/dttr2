test_that("fraction of a day times are converted to R times", {
  expect_equal(
    dtt_excel_to_time(0.5),
    dtt_time_from_ints(12L, 0L, 0L)
  )
  
  expect_equal(
    dtt_excel_to_time(0.11871527777777778),
    dtt_time_from_ints(2L, 50L, 57L)
  )
  
  expect_equal(
    dtt_excel_to_time(0.9894656),
    dtt_time_from_ints(23L, 44L, 50L)
  )
})

test_that("multiple values can be passed", {
  expect_equal(
    dtt_excel_to_time(c(0.25, 0.5, 0.75)),
    c(dtt_time_from_ints(6L, 0L, 0L), dtt_time_from_ints(12L, 0L, 0L), dtt_time_from_ints(18L, 0L, 0L))
  )
})

test_that("handles empty values", {
  expect_equal(
    dtt_excel_to_time(numeric(0L)),
    hms()
  )
})

test_that("handles NA values", {
  expect_equal(
    dtt_excel_to_time(NA_real_),
    dtt_time_from_ints(NA_real_, NA_real_, NA_real_)
  )
})

test_that("errors with bad inputs", {
  expect_error(
    dtt_excel_to_date_time("dates"),
    regexp = "`x` must be numeric."
  )
  
  expect_error(
    dtt_excel_to_time(0.5, "hi"),
    regexp = "`...` must be unused."
  )
})
