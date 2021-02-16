test_that("floor.Date", {
  expect_identical(dtt_floor(NA_Date_[-1]), NA_Date_[-1])
  expect_identical(dtt_floor(NA_Date_), NA_Date_)
  expect_identical(as.double(dtt_floor(as.Date("1970-01-01") + 0.99)), 0)
  expect_identical(dtt_floor(as.Date("1991-02-02")), as.Date("1991-02-02"))
  expect_identical(dtt_floor(as.Date("1991-02-02"), "months"), as.Date("1991-02-01"))
  expect_identical(dtt_floor(as.Date("1991-02-02"), "years"), as.Date("1991-01-01"))
  expect_identical(
    dtt_floor(as.Date(c("1991-02-02", "1991-03-03")), "years"),
    as.Date(c("1991-01-01", "1991-01-01"))
  )
  expect_identical(
    dtt_floor(as.Date(c("1992-01-01", "1991-02-02", "1991-03-03")), "years"),
    as.Date(c("1992-01-01", "1991-01-01", "1991-01-01"))
  )
  expect_identical(
    dtt_floor(as.Date(c("1992-01-01", "1991-02-02", NA_Date_)), "years"),
    as.Date(c("1992-01-01", "1991-01-01", NA_Date_))
  )
  expect_identical(
    dtt_floor(as.Date(c(NA, "1992-01-01", "1991-02-02")), "years"),
    c(NA_Date_, as.Date(c("1992-01-01", "1991-01-01")))
  )
  expect_identical(
    dtt_floor(as.Date(c(NA, "1992-01-01", NA, "1991-02-02")), "years"),
    as.Date(c(NA, "1992-01-01", NA, "1991-01-01"))
  )
})

test_that("floor.POSXIct", {
  expect_identical(dtt_floor(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_floor(NA_POSIXct_), NA_POSIXct_)

  expect_identical(as.double(dtt_floor(as.POSIXct(1.99, origin = as.POSIXct("1970-01-01", tz = "GMT"), tz = "GMT"))), 1)
  expect_identical(as.double(dtt_floor(as.POSIXct(-1.99, origin = as.POSIXct("1970-01-01", tz = "GMT"), tz = "GMT"))), -2)

  expect_identical(
    dtt_floor(as.POSIXct("1969-01-01 23:59:59", tz = "UTC")),
    as.POSIXct("1969-01-01 23:59:59", tz = "UTC")
  )
  expect_identical(
    dtt_floor(as.POSIXct("1969-01-01 23:59:59", tz = "UTC"), "minutes"),
    as.POSIXct("1969-01-01 23:59:00", tz = "UTC")
  )
  expect_identical(
    dtt_floor(as.POSIXct("1969-01-01 23:59:59", tz = "UTC"), "hours"),
    as.POSIXct("1969-01-01 23:00:00", tz = "UTC")
  )
  expect_identical(
    dtt_floor(as.POSIXct(c("1969-01-01 23:59:59", "1969-01-01 01:02:03"), tz = "UTC"), "hours"),
    as.POSIXct(c("1969-01-01 23:00:00", "1969-01-01 01:00:00"), tz = "UTC")
  )
  expect_identical(
    dtt_floor(as.POSIXct(c("1969-01-01 23:59:59", NA), tz = "UTC"), "hours"),
    as.POSIXct(c("1969-01-01 23:00:00", NA), tz = "UTC")
  )
  expect_identical(
    dtt_floor(as.POSIXct(c("1969-12-12 23:59:59", NA), tz = "UTC"), "years"),
    as.POSIXct(c("1969-01-01 00:00:00", NA), tz = "UTC")
  )
})

test_that("floor.hms", {
  expect_identical(dtt_floor(NA_hms_[-1]), NA_hms_[-1])
  expect_identical(dtt_floor(NA_hms_), NA_hms_)
  expect_identical(as.double(dtt_floor(hms::as_hms(1.99))), 1)
  expect_identical(dtt_floor(hms::as_hms(-1.99)), hms::as_hms("23:59:58"))
  expect_identical(as.double(dtt_floor(hms::as_hms(-1.99))), 86398)

  expect_identical(dtt_floor(hms::as_hms("23:59:59")), hms::as_hms("23:59:59"))
  expect_identical(dtt_floor(hms::as_hms("23:59:59"), "minutes"), hms::as_hms("23:59:00"))
  expect_identical(dtt_floor(hms::as_hms("23:59:59"), "hours"), hms::as_hms("23:00:00"))
  expect_identical(
    dtt_floor(hms::as_hms(c("23:59:59", "01:02:03")), "hours"),
    hms::as_hms(c("23:00:00", "01:00:00"))
  )
  expect_identical(
    dtt_floor(hms::as_hms(c("23:59:59", NA)), "hours"),
    hms::as_hms(c("23:00:00", NA))
  )
})
