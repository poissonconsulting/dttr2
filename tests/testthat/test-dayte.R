test_that("dayte.Date", {
  expect_identical(dtt_dayte(NA_Date_[-1]), NA_Date_[-1])
  expect_identical(dtt_dayte(NA_Date_), NA_Date_)
  expect_identical(dtt_dayte(as.Date("2000-01-01")), as.Date("1972-01-01"))
  expect_identical(dtt_dayte(as.Date(c("2000-01-01", NA))), as.Date(c("1972-01-01", NA)))
  expect_identical(
    dtt_dayte(as.Date(c("2000-01-01", "1969-12-31"))),
    as.Date(c("1972-01-01", "1972-12-31"))
  )
})

test_that("dayte.Date with start and leap year", {
  more_dates <- c("1998-02-27", "1999-02-28", "2000-02-29", "2003-03-01", "2004-03-02")
  more_dates <- as.Date(more_dates)

  expect_identical(
    dtt_dayte(more_dates),
    as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02"))
  )

  expect_identical(
    dtt_dayte(more_dates, start = as.Date("2000-02-27")),
    as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02"))
  )
  expect_identical(
    dtt_dayte(more_dates, start = as.Date("2000-02-28")),
    as.Date(c("1973-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02"))
  )
  expect_identical(
    dtt_dayte(more_dates, start = as.Date("2000-02-29")),
    as.Date(c("1973-02-27", "1973-02-28", "1972-02-29", "1972-03-01", "1972-03-02"))
  )
  expect_identical(
    dtt_dayte(more_dates, start = 3L),
    as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1971-03-01", "1971-03-02"))
  )
  expect_identical(
    dtt_dayte(more_dates, start = as.Date("2000-03-02")),
    as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1971-03-02"))
  )
  expect_identical(
    dtt_dayte(more_dates, start = as.Date("2000-03-03")),
    as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02"))
  )
})

test_that("dayte.POSIXct", {
  expect_identical(dtt_dayte(NA_POSIXct_[-1]), NA_Date_[-1])
  expect_identical(dtt_dayte(NA_POSIXct_), NA_Date_)
  expect_identical(
    dtt_dayte(as.POSIXct("2000-01-01")),
    as.Date("1972-01-01")
  )
  expect_identical(
    dtt_dayte(as.POSIXct(c("2000-01-01", NA))),
    as.Date(c("1972-01-01", NA))
  )
  expect_identical(
    dtt_dayte(as.POSIXct(c("2000-01-01", "1969-12-31"))),
    as.Date(c("1972-01-01", "1972-12-31"))
  )
  expect_identical(
    dtt_dayte(as.POSIXct(c("1969-12-31 23:59:59", NA))),
    as.Date(c("1972-12-31", NA))
  )
})
