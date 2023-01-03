test_that("subtract_years.Date", {
  expect_identical(dtt_subtract_years(NA_Date_[-1]), NA_Date_[-1])
  expect_identical(dtt_subtract_years(NA_Date_), NA_Date_)
  expect_identical(
    dtt_subtract_years(as.Date("2000-01-01"), 0L),
    as.Date("2000-01-01")
  )
  expect_identical(
    dtt_subtract_years(as.Date("2000-01-01"), 2L),
    as.Date("1998-01-01")
  )
  expect_identical(
    dtt_subtract_years(as.Date(c("2000-01-01", "2002-01-01")), 2L),
    as.Date(c("1998-01-01", "2000-01-01"))
  )

  expect_identical(
    dtt_subtract_years(as.Date(c("2000-01-01", "2002-01-01")), 2:3),
    as.Date(c("1998-01-01", "1999-01-01"))
  )

  expect_identical(
    dtt_subtract_years(c(as.Date("2002-01-01"), NA), 3L),
    c(as.Date("1999-01-01"), NA)
  )
  expect_identical(
    dtt_subtract_years(c(as.Date("2002-01-01"), NA), -3L),
    c(as.Date("2005-01-01"), NA)
  )
})

test_that("subtract_years.POSIXct", {
  expect_identical(dtt_subtract_years(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_subtract_years(NA_POSIXct_), NA_POSIXct_)
  expect_identical(
    dtt_subtract_years(as.POSIXct("2000-01-01", tz = "UTC"), 0L),
    as.POSIXct("2000-01-01", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_years(as.POSIXct("2000-01-01", tz = "UTC"), 2L),
    as.POSIXct("1998-01-01", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_years(
      as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"),
      2L
    ),
    as.POSIXct(c("1998-01-01", "2000-01-01"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_years(
      as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"),
      2:3
    ),
    as.POSIXct(c("1998-01-01", "1999-01-01"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_years(c(as.POSIXct("2002-01-01", tz = "UTC"), NA), 3L),
    c(as.POSIXct("1999-01-01", tz = "UTC"), NA)
  )
  expect_identical(
    dtt_subtract_years(c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"), NA), -3L),
    c(as.POSIXct("2005-01-01", tz = "Etc/GMT+8"), NA)
  )
})

test_that("subtract_months.Date", {
  expect_identical(dtt_subtract_months(NA_Date_[-1]), NA_Date_[-1])
  expect_identical(dtt_subtract_months(NA_Date_), NA_Date_)
  expect_identical(
    dtt_subtract_months(as.Date("2000-01-01"), 0L),
    as.Date("2000-01-01")
  )
  expect_identical(
    dtt_subtract_months(as.Date("2000-01-01"), 2L),
    as.Date("1999-11-01")
  )
  expect_identical(
    dtt_subtract_months(as.Date(c("2000-01-01", "2002-01-01")), 2L),
    as.Date(c("1999-11-01", "2001-11-01"))
  )

  expect_identical(
    dtt_subtract_months(as.Date(c("2000-01-01", "2002-01-01")), 2:3),
    as.Date(c("1999-11-01", "2001-10-01"))
  )

  expect_identical(
    dtt_subtract_months(c(as.Date("2002-01-01"), NA), 3L),
    c(as.Date("2001-10-01"), NA)
  )
  expect_identical(
    dtt_subtract_months(c(as.Date("2002-01-01"), NA), -3L),
    c(as.Date("2002-04-01"), NA)
  )
})

test_that("subtract_months.POSIXct", {
  expect_identical(dtt_subtract_months(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_subtract_months(NA_POSIXct_), NA_POSIXct_)
  expect_identical(
    dtt_subtract_months(as.POSIXct("2000-01-01", tz = "UTC"), 0L),
    as.POSIXct("2000-01-01", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_months(as.POSIXct("2000-01-01", tz = "UTC"), 2L),
    as.POSIXct("1999-11-01", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_months(
      as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"),
      2L
    ),
    as.POSIXct(c("1999-11-01", "2001-11-01"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_months(
      as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"),
      2:3
    ),
    as.POSIXct(c("1999-11-01", "2001-10-01"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_months(c(as.POSIXct("2002-01-01", tz = "UTC"), NA), 3L),
    c(as.POSIXct("2001-10-01", tz = "UTC"), NA)
  )
  expect_identical(
    dtt_subtract_months(c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"), NA), -3L),
    c(as.POSIXct("2002-04-01", tz = "Etc/GMT+8"), NA)
  )
})

test_that("subtract_days.Date", {
  expect_identical(dtt_subtract_days(NA_Date_[-1]), NA_Date_[-1])
  expect_identical(dtt_subtract_days(NA_Date_), NA_Date_)
  expect_identical(
    dtt_subtract_days(as.Date("2000-01-01"), 0L),
    as.Date("2000-01-01")
  )
  expect_identical(
    dtt_subtract_days(as.Date("2000-01-01"), 2L),
    as.Date("1999-12-30")
  )
  expect_identical(
    dtt_subtract_days(as.Date(c("2000-01-01", "2002-01-02")), 2L),
    as.Date(c("1999-12-30", "2001-12-31"))
  )

  expect_identical(
    dtt_subtract_days(as.Date(c("2000-01-01", "2002-01-02")), 2:3),
    as.Date(c("1999-12-30", "2001-12-30"))
  )

  expect_identical(
    dtt_subtract_days(c(as.Date("2002-01-01"), NA), 3L),
    c(as.Date("2001-12-29"), NA)
  )
  expect_identical(
    dtt_subtract_days(c(as.Date("2002-01-01"), NA), -3L),
    c(as.Date("2002-01-04"), NA)
  )
})

test_that("subtract_days.POSIXct", {
  expect_identical(dtt_subtract_days(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_subtract_days(NA_POSIXct_), NA_POSIXct_)
  expect_identical(
    dtt_subtract_days(as.POSIXct("2000-01-01", tz = "UTC"), 0L),
    as.POSIXct("2000-01-01", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_days(as.POSIXct("2000-01-01", tz = "UTC"), 2L),
    as.POSIXct("1999-12-30", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_days(
      as.POSIXct(c("2000-01-01", "2002-01-02"), tz = "UTC"),
      2L
    ),
    as.POSIXct(c("1999-12-30", "2001-12-31"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_days(
      as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"),
      2:3
    ),
    as.POSIXct(c("1999-12-30", "2001-12-29"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_days(c(as.POSIXct("2002-01-01", tz = "UTC"), NA), 3L),
    c(as.POSIXct("2001-12-29", tz = "UTC"), NA)
  )
  expect_identical(
    dtt_subtract_days(c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"), NA), -3L),
    c(as.POSIXct("2002-01-04", tz = "Etc/GMT+8"), NA)
  )
})

test_that("subtract_hours.POSIXct", {
  expect_identical(dtt_subtract_hours(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_subtract_hours(NA_POSIXct_), NA_POSIXct_)
  expect_identical(
    dtt_subtract_hours(as.POSIXct("2000-01-01", tz = "UTC"), 0L),
    as.POSIXct("2000-01-01", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_hours(as.POSIXct("2000-01-01", tz = "UTC"), 2L),
    as.POSIXct("1999-12-31 22:00:00", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_hours(
      as.POSIXct(c("2000-01-01", "2002-01-02"), tz = "UTC"),
      2L
    ),
    as.POSIXct(c("1999-12-31 22:00:00", "2002-01-01 22:00:00"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_hours(
      as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"),
      2:3
    ),
    as.POSIXct(c("1999-12-31 22:00:00", "2001-12-31 21:00:00"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_hours(c(as.POSIXct("2002-01-01", tz = "UTC"), NA), 3L),
    c(as.POSIXct("2001-12-31 21:00:00", tz = "UTC"), NA)
  )
  expect_identical(
    dtt_subtract_hours(c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"), NA), -3L),
    c(as.POSIXct("2002-01-01 03:00:00", tz = "Etc/GMT+8"), NA)
  )
})

test_that("subtract_hours.hms", {
  expect_identical(dtt_subtract_hours(NA_hms_[-1]), NA_hms_[-1])
  expect_identical(dtt_subtract_hours(NA_hms_), NA_hms_)
  expect_identical(
    dtt_subtract_hours(hms::as_hms("00:00:00"), 0L),
    hms::as_hms("00:00:00")
  )
  expect_identical(
    dtt_subtract_hours(hms::as_hms("00:00:00"), 2L),
    hms::as_hms("22:00:00")
  )
  expect_identical(
    dtt_subtract_hours(hms::as_hms(c("00:00:00", "00:00:00")), 2L),
    hms::as_hms(c("22:00:00", "22:00:00"))
  )

  expect_identical(
    dtt_subtract_hours(hms::as_hms(c("00:00:00", "00:00:00")), 2:3),
    hms::as_hms(c("22:00:00", "21:00:00"))
  )

  expect_identical(
    dtt_subtract_hours(c(hms::as_hms("00:00:00"), NA), 2:3),
    c(hms::as_hms("22:00:00"), NA)
  )

  expect_identical(
    dtt_subtract_hours(c(hms::as_hms("00:00:00"), NA), 3L),
    c(hms::as_hms("21:00:00"), NA)
  )

  expect_identical(
    dtt_subtract_hours(c(hms::as_hms("00:00:00"), NA), -3L),
    c(hms::as_hms("03:00:00"), NA)
  )
})

test_that("subtract_minutes.POSIXct", {
  expect_identical(dtt_subtract_minutes(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_subtract_minutes(NA_POSIXct_), NA_POSIXct_)
  expect_identical(
    dtt_subtract_minutes(as.POSIXct("2000-01-01", tz = "UTC"), 0L),
    as.POSIXct("2000-01-01", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_minutes(as.POSIXct("2000-01-01", tz = "UTC"), 2L),
    as.POSIXct("1999-12-31 23:58:00", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_minutes(
      as.POSIXct(c("2000-01-01", "2002-01-02"), tz = "UTC"),
      2L
    ),
    as.POSIXct(c("1999-12-31 23:58:00", "2002-01-01 23:58:00"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_minutes(
      as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"),
      2:3
    ),
    as.POSIXct(c("1999-12-31 23:58:00", "2001-12-31 23:57:00"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_minutes(c(as.POSIXct("2002-01-01", tz = "UTC"), NA), 3L),
    c(as.POSIXct("2001-12-31 23:57:00", tz = "UTC"), NA)
  )
  expect_identical(
    dtt_subtract_minutes(
      c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"), NA),
      -3L
    ),
    c(as.POSIXct("2002-01-01 00:03:00", tz = "Etc/GMT+8"), NA)
  )
})

test_that("subtract_minutes.hms", {
  expect_identical(dtt_subtract_minutes(NA_hms_[-1]), NA_hms_[-1])
  expect_identical(dtt_subtract_minutes(NA_hms_), NA_hms_)
  expect_identical(
    dtt_subtract_minutes(hms::as_hms("00:00:00"), 0L),
    hms::as_hms("00:00:00")
  )
  expect_identical(
    dtt_subtract_minutes(hms::as_hms("00:00:00"), 2L),
    hms::as_hms("23:58:00")
  )
  expect_identical(
    dtt_subtract_minutes(hms::as_hms(c("00:00:00", "00:00:00")), 2L),
    hms::as_hms(c("23:58:00", "23:58:00"))
  )

  expect_identical(
    dtt_subtract_minutes(hms::as_hms(c("00:00:00", "00:00:00")), 2:3),
    hms::as_hms(c("23:58:00", "23:57:00"))
  )

  expect_identical(
    dtt_subtract_minutes(c(hms::as_hms("00:00:00"), NA), 2:3),
    c(hms::as_hms("23:58:00"), NA)
  )

  expect_identical(
    dtt_subtract_minutes(c(hms::as_hms("00:00:00"), NA), 3L),
    c(hms::as_hms("23:57:00"), NA)
  )

  expect_identical(
    dtt_subtract_minutes(c(hms::as_hms("00:00:00"), NA), -3L),
    c(hms::as_hms("00:03:00"), NA)
  )
})

test_that("subtract_seconds.POSIXct", {
  expect_identical(dtt_subtract_seconds(NA_POSIXct_[-1]), NA_POSIXct_[-1])
  expect_identical(dtt_subtract_seconds(NA_POSIXct_), NA_POSIXct_)
  expect_identical(
    dtt_subtract_seconds(as.POSIXct("2000-01-01", tz = "UTC"), 0L),
    as.POSIXct("2000-01-01", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_seconds(as.POSIXct("2000-01-01", tz = "UTC"), 2L),
    as.POSIXct("1999-12-31 23:59:58", tz = "UTC")
  )
  expect_identical(
    dtt_subtract_seconds(
      as.POSIXct(c("2000-01-01", "2002-01-02"), tz = "UTC"),
      2L
    ),
    as.POSIXct(c("1999-12-31 23:59:58", "2002-01-01 23:59:58"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_seconds(
      as.POSIXct(c("2000-01-01", "2002-01-01"), tz = "UTC"),
      2:3
    ),
    as.POSIXct(c("1999-12-31 23:59:58", "2001-12-31 23:59:57"), tz = "UTC")
  )

  expect_identical(
    dtt_subtract_seconds(c(as.POSIXct("2002-01-01", tz = "UTC"), NA), 3L),
    c(as.POSIXct("2001-12-31 23:59:57", tz = "UTC"), NA)
  )
  expect_identical(
    dtt_subtract_seconds(
      c(as.POSIXct("2002-01-01", tz = "Etc/GMT+8"), NA),
      -3L
    ),
    c(as.POSIXct("2002-01-01 00:00:03", tz = "Etc/GMT+8"), NA)
  )
})

test_that("subtract_seconds.hms", {
  expect_identical(dtt_subtract_seconds(NA_hms_[-1]), NA_hms_[-1])
  expect_identical(dtt_subtract_seconds(NA_hms_), NA_hms_)
  expect_identical(
    dtt_subtract_seconds(hms::as_hms("00:00:00"), 0L),
    hms::as_hms("00:00:00")
  )
  expect_identical(
    dtt_subtract_seconds(hms::as_hms("00:00:00"), 2L),
    hms::as_hms("23:59:58")
  )
  expect_identical(
    dtt_subtract_seconds(hms::as_hms(c("00:00:00", "00:00:00")), 2L),
    hms::as_hms(c("23:59:58", "23:59:58"))
  )

  expect_identical(
    dtt_subtract_seconds(hms::as_hms(c("00:00:00", "00:00:00")), 2:3),
    hms::as_hms(c("23:59:58", "23:59:57"))
  )

  expect_identical(
    dtt_subtract_seconds(c(hms::as_hms("00:00:00"), NA), 2:3),
    c(hms::as_hms("23:59:58"), NA)
  )

  expect_identical(
    dtt_subtract_seconds(c(hms::as_hms("00:00:00"), NA), 3L),
    c(hms::as_hms("23:59:57"), NA)
  )

  expect_identical(
    dtt_subtract_seconds(c(hms::as_hms("00:00:00"), NA), -3L),
    c(hms::as_hms("00:00:03"), NA)
  )
})
