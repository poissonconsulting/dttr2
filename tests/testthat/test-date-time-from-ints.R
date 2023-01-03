test_that("create datetime from default values", {
  datetime <- dtt_date_time_from_ints()
  expect_identical(
    datetime,
    as.POSIXct(c("1970-01-01 00:00:00"), tz = "UTC")
  )
})

test_that("test timezone is being set", {
  datetime <- dtt_date_time_from_ints(tz = "Etc/GMT+8")
  expect_identical(datetime, as.POSIXct("1970-01-01", tz = "Etc/GMT+8"))
})

test_that("create datetime from vector of values", {
  year <- c(1990, 1991, 2010, 2022)
  month <- c(1L, 5L, 8L, 12L)
  day <- c(1L, 10L, 16L, 31L)
  hour <- c(0, 10, 14, 23)
  minute <- c(0, 25, 45, 59)
  second <- c(0, 24, 47, 59)

  datetimes <- dtt_date_time_from_ints(
    year = year,
    month = month,
    day = day,
    hour = hour,
    minute = minute,
    second = second
  )
  expect_identical(
    datetimes,
    as.POSIXct(
      c(
        "1990-01-01 00:00:00", "1991-05-10 10:25:24", "2010-08-16 14:45:47",
        "2022-12-31 23:59:59"
      ),
      tz = "UTC"
    )
  )
})

test_that("create datetime from dataframe of values", {
  raw_datetimes <- data.frame(
    year = c(1990, 1991, 2010, 2022),
    month = c(1L, 5L, 8L, 12L),
    day = c(1L, 10L, 16L, 31L),
    hour = c(0, 10, 14, 23),
    minute = c(0, 25, 45, 59),
    second = c(0, 24, 47, 59)
  )

  datetimes <- dtt_date_time_from_ints(
    year = raw_datetimes$year,
    month = raw_datetimes$month,
    day = raw_datetimes$day,
    hour = raw_datetimes$hour,
    minute = raw_datetimes$minute,
    second = raw_datetimes$second
  )
  expect_identical(
    datetimes,
    as.POSIXct(
      c(
        "1990-01-01 00:00:00", "1991-05-10 10:25:24", "2010-08-16 14:45:47",
        "2022-12-31 23:59:59"
      ),
      tz = "UTC"
    )
  )
})

test_that("error when non whole number passed", {
  expect_error(
    dtt_date_time_from_ints(month = 11.5),
    regexp = "`month` must be a whole numeric vector"
  )
})

test_that("error when string passed", {
  expect_error(
    dtt_date_time_from_ints(day = "15"),
    regexp = "`day` must be a whole numeric vector"
  )
})

test_that("error when negatie year passed", {
  expect_error(
    dtt_date_time_from_ints(year = -1990),
    regexp = "`year` must be greater than or equal to 0"
  )
})

test_that("error when month out of range", {
  expect_error(
    dtt_date_time_from_ints(month = 13),
    regexp = "`month` must be between 1 and 12"
  )
})

test_that("error when day is out of range", {
  expect_error(
    dtt_date_time_from_ints(day = 0),
    regexp = "`day` must be between 1 and 31"
  )
})

test_that("error when hour is out of range", {
  expect_error(
    dtt_date_time_from_ints(hour = 24),
    regexp = "`hour` must be between 0 and 23"
  )
})

test_that("error when minute is out of range", {
  expect_error(
    dtt_date_time_from_ints(minute = 60),
    regexp = "`minute` must be between 0 and 59"
  )
})

test_that("error when second is out of range", {
  expect_error(
    dtt_date_time_from_ints(second = 90),
    regexp = "`second` must be between 0 and 59"
  )
})

test_that("error's when lengths of vectors do not match", {
  year <- c(1990, 1991)
  month <- c(1L, 2L, 3L)
  day <- c(1L, 5L)
  hour <- c(0L, 2L)
  minute <- c(0, 2L)
  second <- c(0, 2L)
  expect_error(
    dtt_date_time_from_ints(
      year = year,
      month = month,
      day = day,
      hour = hour,
      minute = minute,
      second = second
    ),
    regexp = "`length\\(time\\)` must match 1 or 3, not 2"
  )
})
