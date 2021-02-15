test_that("complete.Date", {
  expect_error(dtt_complete(NA_Date_[-1]), class = "chk_error")
  expect_error(dtt_complete(NA_Date_), class = "chk_error")
  expect_identical(
    dtt_complete(as.Date("2001-01-02")),
    as.Date("2001-01-02")
  )
  expect_identical(
    dtt_complete(as.Date(c("2001-01-02", "2001-01-01"))),
    as.Date(c("2001-01-01", "2001-01-02"))
  )
  expect_identical(
    dtt_complete(as.Date(c("2001-01-02", "2001-01-01")), sort = FALSE),
    as.Date(c("2001-01-02", "2001-01-01"))
  )
  expect_identical(
    dtt_complete(as.Date(c("2001-01-03", "2001-01-01"))),
    as.Date(c("2001-01-01", "2001-01-02", "2001-01-03"))
  )
  expect_identical(
    dtt_complete(as.Date(c("2001-01-03", "2001-01-01")), sort = FALSE),
    as.Date(c("2001-01-03", "2001-01-01", "2001-01-02"))
  )

  expect_identical(
    dtt_complete(as.Date(c("2001-01-03", "2001-01-01", "2001-01-03")), sort = FALSE),
    as.Date(c("2001-01-03", "2001-01-01", "2001-01-02"))
  )
  expect_identical(
    dtt_complete(as.Date(c("2001-01-03", "2001-01-01", "2001-01-03")), sort = FALSE, unique = FALSE),
    as.Date(c("2001-01-03", "2001-01-01", "2001-01-03", "2001-01-02"))
  )

  expect_identical(
    dtt_complete(as.Date(c("2001-01-03", "2001-01-01", "2001-01-03")), unique = FALSE),
    as.Date(c("2001-01-01", "2001-01-02", "2001-01-03", "2001-01-03"))
  )

  expect_identical(
    dtt_complete(as.Date(c("2001-01-03", "2001-01-01")), units = "months"),
    as.Date("2001-01-01")
  )
})

test_that("complete.POSIXct", {
  expect_error(dtt_complete(NA_POSIXct_[-1]), class = "chk_error")
  expect_error(dtt_complete(NA_POSIXct_), class = "chk_error")
  expect_identical(
    dtt_complete(as.POSIXct("2001-01-02", tz = "Etc/GMT+7")),
    as.POSIXct("2001-01-02", tz = "Etc/GMT+7")
  )
  expect_identical(
    length(dtt_complete(as.POSIXct(c("2001-01-02", "2001-01-01"), tz = "Etc/GMT+7"))),
    86401L
  )
  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-02", "2001-01-01"), tz = "Etc/GMT+7"), units = "days"),
    as.POSIXct(c("2001-01-01", "2001-01-02"), tz = "Etc/GMT+7")
  )


  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-02", "2001-01-01"), tz = "Etc/GMT+7"), units = "days", sort = FALSE),
    as.POSIXct(c("2001-01-02", "2001-01-01"), tz = "Etc/GMT+7")
  )
  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-03", "2001-01-01"), tz = "Etc/GMT+7"), units = "days"),
    as.POSIXct(c("2001-01-01", "2001-01-02", "2001-01-03"), tz = "Etc/GMT+7")
  )
  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-03", "2001-01-01"), tz = "Etc/GMT+7"), units = "days", sort = FALSE),
    as.POSIXct(c("2001-01-03", "2001-01-01", "2001-01-02"), tz = "Etc/GMT+7")
  )

  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-03", "2001-01-01", "2001-01-03"), tz = "Etc/GMT+7"), sort = FALSE, units = "days"),
    as.POSIXct(c("2001-01-03", "2001-01-01", "2001-01-02"), tz = "Etc/GMT+7")
  )
  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-03", "2001-01-01", "2001-01-03"), tz = "Etc/GMT+7"), units = "days", sort = FALSE, unique = FALSE),
    as.POSIXct(c("2001-01-03", "2001-01-01", "2001-01-03", "2001-01-02"), tz = "Etc/GMT+7")
  )

  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-03", "2001-01-01", "2001-01-03"), tz = "Etc/GMT+7"), unique = FALSE, units = "days"),
    as.POSIXct(c("2001-01-01", "2001-01-02", "2001-01-03", "2001-01-03"), tz = "Etc/GMT+7")
  )

  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-03", "2001-01-01"), tz = "Etc/GMT+7"), units = "months"),
    as.POSIXct("2001-01-01", tz = "Etc/GMT+7")
  )

  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-01 00:00:00", "2001-01-01 00:00:00"), tz = "Etc/GMT+7")),
    as.POSIXct("2001-01-01", tz = "Etc/GMT+7")
  )

  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-01 00:00:00", "2001-01-01 00:00:02"), tz = "Etc/GMT+7")),
    as.POSIXct(c("2001-01-01 00:00:00", "2001-01-01 00:00:01", "2001-01-01 00:00:02"), tz = "Etc/GMT+7")
  )

  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-01 00:00:04", "2001-01-01 00:00:02"), tz = "Etc/GMT+7"), sort = FALSE),
    as.POSIXct(c("2001-01-01 00:00:04", "2001-01-01 00:00:02", "2001-01-01 00:00:03"), tz = "Etc/GMT+7")
  )
  expect_identical(
    dtt_complete(as.POSIXct(c("2001-01-01 00:00:04", "2001-01-01 00:00:02"), tz = "Etc/GMT+7")),
    as.POSIXct(c("2001-01-01 00:00:02", "2001-01-01 00:00:03", "2001-01-01 00:00:04"), tz = "Etc/GMT+7")
  )
})

test_that("complete.hms", {
  expect_error(dtt_complete(NA_hms_[-1]), class = "chk_error")
  expect_error(dtt_complete(NA_hms_), class = "chk_error")

  expect_identical(
    dtt_complete(hms::as_hms(c("00:00:00", "00:00:00"))),
    hms::as_hms("00:00:00")
  )

  expect_identical(
    dtt_complete(hms::as_hms(c("00:00:00", "00:00:02"))),
    hms::as_hms(c("00:00:00", "00:00:01", "00:00:02"))
  )

  expect_identical(
    dtt_complete(hms::as_hms(c("00:00:04", "00:00:02")), sort = FALSE),
    hms::as_hms(c("00:00:04", "00:00:02", "00:00:03"))
  )
  expect_identical(
    dtt_complete(hms::as_hms(c("00:00:04", "00:00:02"))),
    hms::as_hms(c("00:00:02", "00:00:03", "00:00:04"))
  )
  expect_identical(
    length(dtt_complete(hms::as_hms(c("23:59:59", "00:00:01")))),
    86399L
  )
  expect_identical(
    length(dtt_complete(hms::as_hms(c("23:59:59", "00:00:01")), units = "hours")),
    24L
  )
})
