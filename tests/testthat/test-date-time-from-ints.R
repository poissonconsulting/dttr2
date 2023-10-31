test_that("create datetime from default values", {
  datetime <- dtt_date_time_from_ints()
  expect_identical(
    datetime,
    as.POSIXct(c("1972-01-01 00:00:00"), tz = "UTC")
  )
})

test_that("test timezone is being set", {
  datetime <- dtt_date_time_from_ints(tz = "Etc/GMT+8")
  expect_identical(datetime, as.POSIXct("1972-01-01", tz = "Etc/GMT+8"))
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
    regexp = "`year` must be between 0 and 9999, not -1990"
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
    regexp = paste0(
      "... objects must be all zero length or the same length with some of ",
      "length of 1 but not lengths 2 and 3"
    )
  )
})

test_that("pass when lengths of vectors 1 or the same", {
  year <- c(1990, 1991, 1992)
  month <- c(1L, 6L, 12)
  day <- c(1L, 1L, 1L)
  hour <- c(0L)
  minute <- c(0)
  second <- c(0)
  datetime <- dtt_date_time_from_ints(
    year = year,
    month = month,
    day = day,
    hour = hour,
    minute = minute,
    second = second
  )
  expect_identical(
    datetime,
    as.POSIXct(
      c(
        "1990-01-01 00:00:00 UTC", "1991-06-01 00:00:00 UTC",
        "1992-12-01 00:00:00 UTC"
      ),
      tz = "UTC"
    )
  )
})

test_that("handles missing values by returning NA for that value", {
  year <- c(1990, NA_real_, 2010, 2022)
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
        "1990-01-01 00:00:00", NA, "2010-08-16 14:45:47", "2022-12-31 23:59:59"
      ),
      tz = "UTC"
    )
  )
})

test_that("handles missing values when first value is missing", {
  year <- c(1990, NA_real_, 2010, 2022)
  month <- c(NA_integer_, 5L, 8L, 12L)
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
      c(NA, NA, "2010-08-16 14:45:47", "2022-12-31 23:59:59"),
      tz = "UTC"
    )
  )
})

test_that("outputs NA when all values missing instead of erroring", {
  year <- NA_real_
  month <- NA_real_
  day <- NA_real_
  hour <- NA_real_
  minute <- NA_real_
  second <- NA_real_

  datetimes <- dtt_date_time_from_ints(
    year = year,
    month = month,
    day = day,
    hour = hour,
    minute = minute,
    second = second
  )

  expect_true(is.na(datetimes))
})
