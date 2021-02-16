test_that("aggregate.Date", {
  expect_identical(dtt_aggregate(NA_Date_[-1]), NA_Date_[-1])
  expect_identical(dtt_aggregate(NA_Date_), NA_Date_)
  expect_identical(dtt_aggregate(as.Date("1991-02-02")), as.Date("1991-02-02"))
  expect_identical(dtt_aggregate(as.Date("1991-02-02"), "months"), as.Date("1991-02-01"))
  expect_identical(dtt_aggregate(as.Date("1991-02-02"), "years"), as.Date("1991-01-01"))
  expect_identical(
    dtt_aggregate(as.Date(c("1991-02-02", "1991-03-03")), "years"),
    as.Date("1991-01-01")
  )
  expect_identical(
    dtt_aggregate(as.Date(c("1992-01-01", "1991-02-02", "1991-03-03")), "years"),
    as.Date(c("1992-01-01", "1991-01-01"))
  )
  expect_identical(
    dtt_aggregate(as.Date(c("1992-01-01", "1991-02-02", NA_Date_)), "years"),
    as.Date(c("1992-01-01", "1991-01-01", NA_Date_))
  )
  expect_identical(
    dtt_aggregate(as.Date(c(NA, "1992-01-01", "1991-02-02")), "years"),
    c(NA_Date_, as.Date(c("1992-01-01", "1991-01-01")))
  )
  expect_identical(
    dtt_aggregate(as.Date(c(NA, "1992-01-01", NA, "1991-02-02")), "years"),
    c(NA_Date_, as.Date(c("1992-01-01", "1991-01-01")))
  )
})

test_that("aggregate.Date", {
  expect_identical(dtt_aggregate(NA_Date_[-1]), NA_Date_[-1])
  expect_identical(dtt_aggregate(NA_Date_), NA_Date_)
  expect_identical(dtt_aggregate(as.Date("1991-02-02")), as.Date("1991-02-02"))
  expect_identical(dtt_aggregate(as.Date("1991-02-02"), "months"), as.Date("1991-02-01"))
  expect_identical(dtt_aggregate(as.Date("1991-02-02"), "years"), as.Date("1991-01-01"))
  expect_identical(
    dtt_aggregate(as.Date(c("1991-02-02", "1991-03-03")), "years"),
    as.Date("1991-01-01")
  )
  expect_identical(
    dtt_aggregate(as.Date(c("1992-01-01", "1991-02-02", "1991-03-03")), "years"),
    as.Date(c("1992-01-01", "1991-01-01"))
  )
  expect_identical(
    dtt_aggregate(as.Date(c("1992-01-01", "1991-02-02", NA_Date_)), "years"),
    as.Date(c("1992-01-01", "1991-01-01", NA_Date_))
  )
  expect_identical(
    dtt_aggregate(as.Date(c(NA, "1992-01-01", "1991-02-02")), "years"),
    c(NA_Date_, as.Date(c("1992-01-01", "1991-01-01")))
  )
  expect_identical(
    dtt_aggregate(as.Date(c(NA, "1992-01-01", NA, "1991-02-02")), "years"),
    c(NA_Date_, as.Date(c("1992-01-01", "1991-01-01")))
  )
})

test_that("aggregate.POSIXct", {
  expect_identical(dtt_aggregate(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_aggregate(NA_POSIXct_), NA_POSIXct_)
  expect_identical(
    dtt_aggregate(as.POSIXct("1969-01-01 23:59:59", tz = "UTC")),
    as.POSIXct("1969-01-01 23:59:59", tz = "UTC")
  )
  expect_identical(
    dtt_aggregate(as.POSIXct("1969-01-01 23:59:59", tz = "UTC"), "minutes"),
    as.POSIXct("1969-01-01 23:59:00", tz = "UTC")
  )
  expect_identical(
    dtt_aggregate(as.POSIXct("1969-01-01 23:59:59", tz = "UTC"), "hours"),
    as.POSIXct("1969-01-01 23:00:00", tz = "UTC")
  )
  expect_identical(
    dtt_aggregate(as.POSIXct("1969-01-01 23:59:59", tz = "UTC"), "days"),
    as.POSIXct("1969-01-01 00:00:00", tz = "UTC")
  )

  expect_identical(
    dtt_aggregate(hms::as_hms(c("02:12:59", "03:12:59")), "hours"),
    hms::as_hms(c("02:00:00", "03:00:00"))
  )
  expect_identical(
    dtt_aggregate(hms::as_hms(c("02:12:59", "02:14:16")), "hours"),
    hms::as_hms("02:00:00")
  )
  expect_identical(
    dtt_aggregate(hms::as_hms(c("02:12:59", NA, "02:14:16")), "hours"),
    hms::as_hms(c("02:00:00", NA))
  )
  expect_identical(
    dtt_aggregate(hms::as_hms(c(NA, "02:12:59", NA, "02:14:16")), "hours"),
    hms::as_hms(c(NA, "02:00:00"))
  )
})

test_that("aggregate.hms", {
  expect_identical(dtt_aggregate(NA_hms_[-1]), NA_hms_[-1])
  expect_identical(dtt_aggregate(NA_hms_), NA_hms_)
  expect_identical(dtt_aggregate(hms::as_hms("02:12:59")), hms::as_hms("02:12:59"))
  expect_identical(
    dtt_aggregate(hms::as_hms("02:12:59"), "minutes"),
    hms::as_hms("02:12:00")
  )
  expect_identical(
    dtt_aggregate(hms::as_hms("02:12:59"), "hours"),
    hms::as_hms("02:00:00")
  )
  expect_identical(
    dtt_aggregate(hms::as_hms(c("02:12:59", "03:12:59")), "hours"),
    hms::as_hms(c("02:00:00", "03:00:00"))
  )
  expect_identical(
    dtt_aggregate(hms::as_hms(c("02:12:59", "02:14:16")), "hours"),
    hms::as_hms("02:00:00")
  )
  expect_identical(
    dtt_aggregate(hms::as_hms(c("02:12:59", NA, "02:14:16")), "hours"),
    hms::as_hms(c("02:00:00", NA))
  )
  expect_identical(
    dtt_aggregate(hms::as_hms(c(NA, "02:12:59", NA, "02:14:16")), "hours"),
    hms::as_hms(c(NA, "02:00:00"))
  )
})
