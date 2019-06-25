context("add")

test_that("add_years.Date", {
  expect_identical(dtt_add_years(NA_Date_[-1]), NA_Date_[-1])
  expect_identical(dtt_add_years(NA_Date_), NA_Date_)
  expect_identical(dtt_add_years(as.Date("2000-01-01"), 0L), as.Date("2000-01-01"))
  expect_identical(dtt_add_years(as.Date("2000-01-01"), 2L), as.Date("2002-01-01"))
  expect_identical(dtt_add_years(as.Date(c("2000-01-01", "2002-01-01")), 2L), 
                   as.Date(c("2002-01-01", "2004-01-01")))

  expect_identical(dtt_add_years(as.Date(c("2000-01-01", "2002-01-01")), 2:3), 
                   as.Date(c("2002-01-01", "2005-01-01")))

  expect_identical(dtt_add_years(c(as.Date("2002-01-01"),NA), 3L), 
                   c(as.Date("2005-01-01"), NA))
  expect_identical(dtt_add_years(c(as.Date("2002-01-01"),NA), -3L), 
                   c(as.Date("1999-01-01"), NA))
})

test_that("add_years.POSIXct", {
  expect_identical(dtt_add_years(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_add_years(NA_POSIXct_), NA_POSIXct_)
  expect_identical(dtt_add_years(as.POSIXct("2000-01-01", tz = "UTC"), 0L), 
                   as.POSIXct("2000-01-01", tz = "UTC"))
  expect_identical(dtt_add_years(as.POSIXct("2000-01-01", tz = "UTC"), 2L), 
                   as.POSIXct("2002-01-01", tz = "UTC"))
  expect_identical(dtt_add_years(as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"), 2L), 
                   as.POSIXct(c("2002-01-01", "2004-01-01"), tz = "UTC"))

  expect_identical(dtt_add_years(as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"), 2:3), 
                   as.POSIXct(c("2002-01-01", "2005-01-01"), tz = "UTC"))

  expect_identical(dtt_add_years(c(as.POSIXct("2002-01-01", tz = "UTC"),NA), 3L), 
                   c(as.POSIXct("2005-01-01", tz = "UTC"), NA))
  expect_identical(dtt_add_years(c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"),NA), -3L), 
                   c(as.POSIXct("1999-01-01", tz = "Etc/GMT+8"), NA))
})

test_that("add_months.Date", {
  expect_identical(dtt_add_months(NA_Date_[-1]), NA_Date_[-1])
  expect_identical(dtt_add_months(NA_Date_), NA_Date_)
  expect_identical(dtt_add_months(as.Date("2000-01-01"), 0L), as.Date("2000-01-01"))
  expect_identical(dtt_add_months(as.Date("2000-01-01"), 2L), as.Date("2000-03-01"))
  expect_identical(dtt_add_months(as.Date(c("2000-01-01", "2002-01-01")), 2L), 
                   as.Date(c("2000-03-01", "2002-03-01")))

  expect_identical(dtt_add_months(as.Date(c("2000-01-01", "2002-01-01")), 2:3), 
                   as.Date(c("2000-03-01", "2002-04-01")))

  expect_identical(dtt_add_months(c(as.Date("2002-01-01"),NA), 3L), 
                   c(as.Date("2002-04-01"), NA))
  expect_identical(dtt_add_months(c(as.Date("2002-01-01"),NA), -3L), 
                   c(as.Date("2001-10-01"), NA))
})

test_that("add_months.POSIXct", {
  expect_identical(dtt_add_months(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_add_months(NA_POSIXct_), NA_POSIXct_)
  expect_identical(dtt_add_months(as.POSIXct("2000-01-01", tz = "UTC"), 0L), 
                   as.POSIXct("2000-01-01", tz = "UTC"))
  expect_identical(dtt_add_months(as.POSIXct("2000-01-01", tz = "UTC"), 2L), 
                   as.POSIXct("2000-03-01", tz = "UTC"))
  expect_identical(dtt_add_months(as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"), 2L), 
                   as.POSIXct(c("2000-03-01", "2002-03-01"), tz = "UTC"))

  expect_identical(dtt_add_months(as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"), 2:3), 
                   as.POSIXct(c("2000-03-01", "2002-04-01"), tz = "UTC"))

  expect_identical(dtt_add_months(c(as.POSIXct("2002-01-01", tz = "UTC"),NA), 3L), 
                   c(as.POSIXct("2002-04-01", tz = "UTC"), NA))
  expect_identical(dtt_add_months(c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"),NA), -3L), 
                   c(as.POSIXct("2001-10-01", tz = "Etc/GMT+8"), NA))
})

test_that("add_days.Date", {
  expect_identical(dtt_add_days(NA_Date_[-1]), NA_Date_[-1])
  expect_identical(dtt_add_days(NA_Date_), NA_Date_)
  expect_identical(dtt_add_days(as.Date("2000-01-01"), 0L), as.Date("2000-01-01"))
  expect_identical(dtt_add_days(as.Date("2000-01-01"), 2L), as.Date("2000-01-03"))
  expect_identical(dtt_add_days(as.Date(c("2000-01-01", "2002-01-02")), 2L), 
                   as.Date(c("2000-01-03", "2002-01-04")))

  expect_identical(dtt_add_days(as.Date(c("2000-01-01", "2002-01-02")), 2:3), 
                   as.Date(c("2000-01-03", "2002-01-05")))

  expect_identical(dtt_add_days(c(as.Date("2002-01-01"),NA), 3L), 
                   c(as.Date("2002-01-04"), NA))
  expect_identical(dtt_add_days(c(as.Date("2002-01-01"),NA), -3L), 
                   c(as.Date("2001-12-29"), NA))
})

test_that("add_days.POSIXct", {
  expect_identical(dtt_add_days(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_add_days(NA_POSIXct_), NA_POSIXct_)
  expect_identical(dtt_add_days(as.POSIXct("2000-01-01", tz = "UTC"), 0L), 
                   as.POSIXct("2000-01-01", tz = "UTC"))
  expect_identical(dtt_add_days(as.POSIXct("2000-01-01", tz = "UTC"), 2L), 
                   as.POSIXct("2000-01-03", tz = "UTC"))
  expect_identical(dtt_add_days(as.POSIXct(c("2000-01-01", "2002-01-02"), tz = "UTC"), 2L), 
                   as.POSIXct(c("2000-01-03", "2002-01-04"), tz = "UTC"))

  expect_identical(dtt_add_days(as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"), 2:3), 
                   as.POSIXct(c("2000-01-03", "2002-01-04"), tz = "UTC"))

  expect_identical(dtt_add_days(c(as.POSIXct("2002-01-01", tz = "UTC"),NA), 3L), 
                   c(as.POSIXct("2002-01-04", tz = "UTC"), NA))
  expect_identical(dtt_add_days(c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"),NA), -3L), 
                   c(as.POSIXct("2001-12-29", tz = "Etc/GMT+8"), NA))
})

test_that("add_hours.POSIXct", {
  expect_identical(dtt_add_hours(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_add_hours(NA_POSIXct_), NA_POSIXct_)
  expect_identical(dtt_add_hours(as.POSIXct("2000-01-01", tz = "UTC"), 0L), 
                   as.POSIXct("2000-01-01", tz = "UTC"))
  expect_identical(dtt_add_hours(as.POSIXct("2000-01-01", tz = "UTC"), 2L), 
                   as.POSIXct("2000-01-01 02:00:00", tz = "UTC"))
  expect_identical(dtt_add_hours(as.POSIXct(c("2000-01-01", "2002-01-02"), tz = "UTC"), 2L), 
                   as.POSIXct(c("2000-01-01 02:00:00", "2002-01-02 02:00:00"), tz = "UTC"))

  expect_identical(dtt_add_hours(as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"), 2:3), 
                   as.POSIXct(c("2000-01-01 02:00:00", "2002-01-01 03:00:00"), tz = "UTC"))

  expect_identical(dtt_add_hours(c(as.POSIXct("2002-01-01", tz = "UTC"),NA), 3L), 
                   c(as.POSIXct("2002-01-01 03:00:00", tz = "UTC"), NA))
  expect_identical(dtt_add_hours(c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"),NA), -3L), 
                   c(as.POSIXct("2001-12-31 21:00:00", tz = "Etc/GMT+8"), NA))
})

test_that("add_hours.hms", {
  expect_identical(dtt_add_hours(NA_hms_[-1]), NA_hms_[-1])
  expect_identical(dtt_add_hours(NA_hms_), NA_hms_)
  expect_identical(dtt_add_hours(hms::as.hms("00:00:00"), 0L), 
                   hms::as.hms("00:00:00"))
  expect_identical(dtt_add_hours(hms::as.hms("00:00:00"), 2L), 
                   hms::as.hms("02:00:00"))
  expect_identical(dtt_add_hours(hms::as.hms(c("00:00:00", "00:00:00")), 2L), 
                   hms::as.hms(c("02:00:00", "02:00:00")))

  expect_identical(dtt_add_hours(hms::as.hms(c("00:00:00", "00:00:00")), 2:3), 
                   hms::as.hms(c("02:00:00", "03:00:00")))

  expect_identical(dtt_add_hours(c(hms::as.hms("00:00:00"), NA), 2:3), 
                   c(hms::as.hms("02:00:00"), NA))
  
  expect_identical(dtt_add_hours(c(hms::as.hms("00:00:00"), NA), 3L), 
                   c(hms::as.hms("03:00:00"), NA))
  
  expect_identical(dtt_add_hours(c(hms::as.hms("00:00:00"), NA), -3L), 
                   c(hms::as.hms("21:00:00"), NA))
})

test_that("add_minutes.POSIXct", {
  expect_identical(dtt_add_minutes(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_add_minutes(NA_POSIXct_), NA_POSIXct_)
  expect_identical(dtt_add_minutes(as.POSIXct("2000-01-01", tz = "UTC"), 0L), 
                   as.POSIXct("2000-01-01", tz = "UTC"))
  expect_identical(dtt_add_minutes(as.POSIXct("2000-01-01", tz = "UTC"), 2L), 
                   as.POSIXct("2000-01-01 00:02:00", tz = "UTC"))
  expect_identical(dtt_add_minutes(as.POSIXct(c("2000-01-01", "2002-01-02"), tz = "UTC"), 2L), 
                   as.POSIXct(c("2000-01-01 00:02:00", "2002-01-02 00:02:00"), tz = "UTC"))

  expect_identical(dtt_add_minutes(as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"), 2:3), 
                   as.POSIXct(c("2000-01-01 00:02:00", "2002-01-01 00:03:00"), tz = "UTC"))

  expect_identical(dtt_add_minutes(c(as.POSIXct("2002-01-01", tz = "UTC"),NA), 3L), 
                   c(as.POSIXct("2002-01-01 00:03:00", tz = "UTC"), NA))
  expect_identical(dtt_add_minutes(c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"),NA), -3L), 
                   c(as.POSIXct("2001-12-31 23:57:00", tz = "Etc/GMT+8"), NA))
})

test_that("add_minutes.hms", {
  expect_identical(dtt_add_minutes(NA_hms_[-1]), NA_hms_[-1])
  expect_identical(dtt_add_minutes(NA_hms_), NA_hms_)
  expect_identical(dtt_add_minutes(hms::as.hms("00:00:00"), 0L), 
                   hms::as.hms("00:00:00"))
  expect_identical(dtt_add_minutes(hms::as.hms("00:00:00"), 2L), 
                   hms::as.hms("00:02:00"))
  expect_identical(dtt_add_minutes(hms::as.hms(c("00:00:00", "00:00:00")), 2L), 
                   hms::as.hms(c("00:02:00", "00:02:00")))

  expect_identical(dtt_add_minutes(hms::as.hms(c("00:00:00", "00:00:00")), 2:3), 
                   hms::as.hms(c("00:02:00", "00:03:00")))

  expect_identical(dtt_add_minutes(c(hms::as.hms("00:00:00"), NA), 2:3), 
                   c(hms::as.hms("00:02:00"), NA))
  
  expect_identical(dtt_add_minutes(c(hms::as.hms("00:00:00"), NA), 3L), 
                   c(hms::as.hms("00:03:00"), NA))
  
  expect_identical(dtt_add_minutes(c(hms::as.hms("00:00:00"), NA), -3L), 
                   c(hms::as.hms("23:57:00"), NA))
})

test_that("add_seconds.POSIXct", {
  expect_identical(dtt_add_seconds(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_add_seconds(NA_POSIXct_), NA_POSIXct_)
  expect_identical(dtt_add_seconds(as.POSIXct("2000-01-01", tz = "UTC"), 0L), 
                   as.POSIXct("2000-01-01", tz = "UTC"))
  expect_identical(dtt_add_seconds(as.POSIXct("2000-01-01", tz = "UTC"), 2L), 
                   as.POSIXct("2000-01-01 00:00:02", tz = "UTC"))
  expect_identical(dtt_add_seconds(as.POSIXct(c("2000-01-01", "2002-01-02"), tz = "UTC"), 2L), 
                   as.POSIXct(c("2000-01-01 00:00:02", "2002-01-02 00:00:02"), tz = "UTC"))

  expect_identical(dtt_add_seconds(as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"), 2:3), 
                   as.POSIXct(c("2000-01-01 00:00:02", "2002-01-01 00:00:03"), tz = "UTC"))

  expect_identical(dtt_add_seconds(c(as.POSIXct("2002-01-01", tz = "UTC"),NA), 3L), 
                   c(as.POSIXct("2002-01-01 00:00:03", tz = "UTC"), NA))
  expect_identical(dtt_add_seconds(c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"),NA), -3L), 
                   c(as.POSIXct("2001-12-31 23:59:57", tz = "Etc/GMT+8"), NA))
})

test_that("add_seconds.hms", {
  expect_identical(dtt_add_seconds(NA_hms_[-1]), NA_hms_[-1])
  expect_identical(dtt_add_seconds(NA_hms_), NA_hms_)
  expect_identical(dtt_add_seconds(hms::as.hms("00:00:00"), 0L), 
                   hms::as.hms("00:00:00"))
  expect_identical(dtt_add_seconds(hms::as.hms("00:00:00"), 2L), 
                   hms::as.hms("00:00:02"))
  expect_identical(dtt_add_seconds(hms::as.hms(c("00:00:00", "00:00:00")), 2L), 
                   hms::as.hms(c("00:00:02", "00:00:02")))

  expect_identical(dtt_add_seconds(hms::as.hms(c("00:00:00", "00:00:00")), 2:3), 
                   hms::as.hms(c("00:00:02", "00:00:03")))

  expect_identical(dtt_add_seconds(c(hms::as.hms("00:00:00"), NA), 2:3), 
                   c(hms::as.hms("00:00:02"), NA))
  
  expect_identical(dtt_add_seconds(c(hms::as.hms("00:00:00"), NA), 3L), 
                   c(hms::as.hms("00:00:03"), NA))
  
  expect_identical(dtt_add_seconds(c(hms::as.hms("00:00:00"), NA), -3L), 
                   c(hms::as.hms("23:59:57"), NA))
})
