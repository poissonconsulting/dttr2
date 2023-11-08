test_that("serial date times are converted to R date times using modern", {
  expect_equal(
    dtt_excel_to_date_time(45324.1234, tz = "UTC"),
    as.POSIXct("2024-02-02 02:57:42", tz = "UTC")
  )

  expect_equal(
    dtt_excel_to_date_time(45324.12323, tz = "UTC"),
    as.POSIXct("2024-02-02 02:57:27", tz = "UTC")
  )

  expect_equal(
    dtt_excel_to_date_time(45324.12323, tz = "PST8PDT"),
    as.POSIXct("2024-02-02 02:57:27", tz = "PST8PDT")
  )

  expect_equal(
    dtt_excel_to_date_time(1000.1145, tz = "UTC"),
    as.POSIXct("1902-09-26 02:44:53", tz = "UTC")
  )

  expect_equal(
    dtt_excel_to_date_time(43397.84578, tz = "UTC"),
    as.POSIXct("2018-10-24 20:17:55", tz = "UTC")
  )
})

test_that("multiple values can be passed", {
  expect_equal(
    dtt_excel_to_date_time(c(1000.1145, 43397.84578), tz = "UTC"),
    as.POSIXct(c("1902-09-26 02:44:53", "2018-10-24 20:17:55"), tz = "UTC")
  )
})

test_that("serial date times are converted to R date times not modern", {
  expect_equal(
    dtt_excel_to_date_time(45324.1234, tz = "UTC", modern = FALSE),
    as.POSIXct("2028-02-03 02:57:42", tz = "UTC")
  )

  expect_equal(
    dtt_excel_to_date_time(45324.12323, tz = "UTC", modern = FALSE),
    as.POSIXct("2028-02-03 02:57:27", tz = "UTC")
  )

  expect_equal(
    dtt_excel_to_date_time(45324.12323, tz = "PST8PDT", modern = FALSE),
    as.POSIXct("2028-02-03 02:57:27", tz = "PST8PDT")
  )

  expect_equal(
    dtt_excel_to_date_time(1000.1145, tz = "UTC", modern = FALSE),
    as.POSIXct("1906-09-27 02:44:53", tz = "UTC")
  )

  expect_equal(
    dtt_excel_to_date_time(43397.84578, tz = "UTC", modern = FALSE),
    as.POSIXct("2022-10-25 20:17:55", tz = "UTC")
  )
})

test_that("handles empty values", {
  expect_equal(
    dtt_excel_to_date_time(numeric(0L)),
    as.POSIXct(character(0L), tz = "UTC")
  )
})

test_that("handles NA values", {
  expect_equal(
    dtt_excel_to_date_time(NA_real_),
    as.POSIXct(NA_integer_, tz = "UTC", origin = "1900-01-01")
  )
  expect_equal(
    dtt_excel_to_date_time(NA_integer_),
    as.POSIXct(NA_integer_, tz = "UTC", origin = "1900-01-01")
  )
  expect_equal(
    dtt_excel_to_date_time(c(NA_real_, 1000.1145)),
    as.POSIXct(c(NA_integer_, "1902-09-26 02:44:52"), tz = "UTC")
  )
})

test_that("date times before 1901-12-14 fail due to integer overflow", {
  expect_warning(
    output <- dtt_excel_to_date_time(1.67458),
    regexp = "NAs introduced by coercion to integer range"
  )

  expect_equal(
    output,
    as.POSIXct(NA, "UTC", origin = "1900-01-01"),
    ignore_attr = TRUE
  )

  expect_warning(
    output <- dtt_excel_to_date_time(0.67458),
    regexp = "NAs introduced by coercion to integer range"
  )

  expect_equal(
    output,
    as.POSIXct(NA, "UTC", origin = "1900-01-01"),
    ignore_attr = TRUE
  )
})

test_that("errors with bad inputs", {
  expect_error(
    dtt_excel_to_date_time("dates"),
    regexp = "`x` must be numeric."
  )

  expect_error(
    dtt_excel_to_date_time(2000, 2),
    regexp = "`tz` must be a string \\(non-missing character scalar\\)."
  )

  expect_error(
    dtt_excel_to_date_time(2000, "UTC", 2),
    regexp = "`modern` must be a flag \\(TRUE or FALSE\\)"
  )

  expect_error(
    dtt_excel_to_date_time(2000, "UTC", "yes"),
    regexp = "`modern` must be a flag \\(TRUE or FALSE\\)"
  )

  expect_error(
    dtt_excel_to_date_time(2000, "UTC", TRUE, "hi"),
    regexp = "`...` must be unused."
  )
})
