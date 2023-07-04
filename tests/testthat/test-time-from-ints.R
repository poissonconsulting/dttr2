test_that("create time from default values", {
  time <- dtt_time_from_ints()
  expect_identical(
    time,
    as_hms(c("00:00:00"))
  )
})

test_that("create time from vector of values", {
  hour <- c(0, 10, 14, 23)
  minute <- c(0, 25, 45, 59)
  second <- c(0, 24, 47, 59)

  times <- dtt_time_from_ints(
    hour = hour,
    minute = minute,
    second = second
  )
  expect_identical(
    times,
    as_hms(
      c("00:00:00", "10:25:24", "14:45:47", "23:59:59")
    )
  )
})

test_that("create datetime from dataframe of values", {
  raw_times <- data.frame(
    hour = c(0, 10, 14, 23),
    minute = c(0, 25, 45, 59),
    second = c(0, 24, 47, 59)
  )

  times <- dtt_time_from_ints(
    hour = raw_times$hour,
    minute = raw_times$minute,
    second = raw_times$second
  )
  expect_identical(
    times,
    as_hms(c("00:00:00", "10:25:24", "14:45:47", "23:59:59"))
  )
})

test_that("error when non whole number passed", {
  expect_error(
    dtt_time_from_ints(hour = 11.5),
    regexp = "`hour` must be a whole numeric vector"
  )
})

test_that("error when string passed", {
  expect_error(
    dtt_time_from_ints(minute = "10"),
    regexp = "`minute` must be a whole numeric vector"
  )
})

test_that("error when hour is out of range", {
  expect_error(
    dtt_time_from_ints(hour = 25),
    regexp = "`hour` must be between 0 and 23"
  )
})

test_that("error when minute is out of range", {
  expect_error(
    dtt_time_from_ints(minute = 65),
    regexp = "`minute` must be between 0 and 59"
  )
})

test_that("error when second is out of range", {
  expect_error(
    dtt_time_from_ints(second = 75),
    regexp = "`second` must be between 0 and 59"
  )
})

test_that("error's when lengths of vectors do not match", {
  hour <- c(0L, 2L, 5L)
  minute <- c(25L, 10L, 17L, 23L)
  second <- c(16L, 30L)

  expect_error(
    dtt_time_from_ints(hour = hour, minute = minute, second = second),
    regexp = paste0(
      "... objects must be all zero length or the same length with some of ",
      "length of 1 but not lengths 2, 3 and 4\\."
    )
  )
})

test_that("pass when lengths of vectors 1 or the same", {
  hour <- c(0L, 2L, 4L)
  minute <- 25L
  second <- c(16L, 30L, 45L)
  time <- dtt_time_from_ints(hour = hour, minute = minute, second = second)
  expect_identical(
    time,
    as_hms(c("00:25:16", "02:25:30", "04:25:45"))
  )
})

test_that("handles missing value by returning NA for that value", {
  hour <- c(0, 10, 14, 23)
  minute <- c(0, 25, 45, 59)
  second <- c(0, NA_real_, 47, 59)
  time <- dtt_time_from_ints(hour = hour, minute = minute, second = second)
  expect_identical(
    time,
    as_hms(c("00:00:00", NA, "14:45:47", "23:59:59"))
  )
})

test_that("handles missing value as first value", {
  hour <- c(0, 10, 14, 23)
  minute <- c(NA_real_, 25, 45, 59)
  second <- c(0, NA_real_, 47, 59)
  time <- dtt_time_from_ints(hour = hour, minute = minute, second = second)
  expect_identical(
    time,
    as_hms(c(NA, NA, "14:45:47", "23:59:59"))
  )
})

test_that("outputs NA when only NA passed", {
  hour <- NA_integer_
  minute <- NA_integer_
  second <- NA_integer_
  time <- dtt_time_from_ints(hour = hour, minute = minute, second = second)
  expect_identical(
    time,
    as_hms(c(NA))
  )
})
