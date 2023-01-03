test_that("create dates default values", {
  dates <- dtt_date_from_ints()
  expect_identical(dates, as.Date(c("1970-01-01")))
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
    regexp = "`year` must be greater than or equal to 0"
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

### Ask Joe about the behaviour of the uneven lengthed vectors.
test_that("values recycled when lengths of vectors do not match", {
  year <- c(1990, 1991)
  month <- c(1L, 2L, 3L)
  day <- c(1L, 5L, 7L, 16L, 23L)
  dates <- dtt_date_from_ints(
    year = year,
    month = month,
    day = day
  )
  dates

  expect_identical(
    dates,
    as.Date(
      c("1990-01-01", "1991-02-05", "1990-03-07", "1991-01-16", "1990-02-23")
    )
  )
})
