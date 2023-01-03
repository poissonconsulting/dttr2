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

### Ask Joe about what the best expected output of this should be
test_that("values recycled when lengths of vectors do not match", {
  hour <- c(0L, 2L)
  minute <- c(25L, 10L, 17L, 23L)
  second <- c(16L, 30L)

  times <- dtt_time_from_ints(
    hour = hour,
    minute = minute,
    second = second
  )

  expect_identical(
    times,
    as_hms(c("00:25:16", "02:10:30", "00:17:16", "02:23:30"))
  )
})
