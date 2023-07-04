test_that("create dates default values", {
  dates <- dtt_date_from_ints()
  expect_identical(dates, as.Date(c("1972-01-01")))
})

test_that("create dates from vector of values", {
  year <- c(1990L, 1991L, 2010L, 2022L)
  month <- c(1L, 5L, 8L, 12L)
  day <- c(1L, 10L, 16L, 31L)
  dates <- dtt_date_from_ints(
    year = year,
    month = month,
    day = day
  )
  expect_identical(
    dates,
    as.Date(c("1990-01-01", "1991-05-10", "2010-08-16", "2022-12-31"))
  )
})

test_that("create dates from dataframe of values", {
  dates_raw <- data.frame(
    year = c(1990L, 1991L, 2010L, 2022L),
    month = c(1L, 5L, 8L, 12L),
    day = c(1L, 10L, 16L, 31L)
  )

  dates <- dtt_date_from_ints(
    year = dates_raw$year,
    month = dates_raw$month,
    day = dates_raw$day
  )
  expect_identical(
    dates,
    as.Date(c("1990-01-01", "1991-05-10", "2010-08-16", "2022-12-31"))
  )
})

test_that("error when non whole number passed", {
  expect_error(
    dtt_date_from_ints(month = 10.2),
    regexp = "`month` must be a whole numeric vector"
  )
})

test_that("error when string passed passed", {
  expect_error(
    dtt_date_from_ints(year = "1900"),
    regexp = "`year` must be a whole numeric vector"
  )
})

test_that("error when negative year passed", {
  expect_error(
    dtt_date_from_ints(year = -1900),
    regexp = "`year` must be between 0 and 9999, not -1900"
  )
})

test_that("error when month out of range passed", {
  expect_error(
    dtt_date_from_ints(month = 0),
    regexp = "`month` must be between 1 and 12"
  )
})

test_that("error when day out of range passed", {
  expect_error(
    dtt_date_from_ints(day = 32),
    regexp = "`day` must be between 1 and 31"
  )
})

test_that("error's when lengths of vectors do not match", {
  year <- c(1990, 1991)
  month <- c(1L, 2L, 3L)
  day <- c(1L, 5L, 7L, 16L, 23L)
  expect_error(
    dtt_date_from_ints(year = year, month = month, day = day),
    regexp = paste0(
      "... objects must be all zero length or the same length with some of ",
      "length of 1 but not lengths 2, 3 and 5"
    )
  )
})

test_that("pass when lengths of vectors 1 or the same", {
  year <- c(1990, 1991, 1992)
  month <- c(1L, 2L, 3L)
  day <- c(1L)
  date <- dtt_date_from_ints(year = year, month = month, day = day)
  expect_identical(
    date,
    as.Date(
      c("1990-01-01", "1991-02-01", "1992-03-01")
    )
  )
})

test_that("missing value is first in vector and still creates dates", {
  year <- c(1990, 1991, 1992)
  month <- c(NA_integer_, 2L, 3L)
  day <- c(1L, 1L, 2L)
  date <- dtt_date_from_ints(year = year, month = month, day = day)
  expect_identical(
    date,
    as.Date(
      c(NA, "1991-02-01", "1992-03-02")
    )
  )
})

test_that("missing value returned when all missing", {
  year <- NA_integer_
  month <- NA_integer_
  day <- NA_integer_
  date <- dtt_date_from_ints(year = year, month = month, day = day)
  expect_identical(
    date,
    as.Date(
      c(NA)
    )
  )
})
