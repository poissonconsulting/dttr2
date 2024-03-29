test_that("completed.Date", {
  expect_identical(dtt_completed(NA_Date_), NA)
  expect_true(dtt_completed(NA_Date_[-1]))
  expect_true(dtt_completed(as.Date("2001-01-01")))
  expect_true(dtt_completed(as.Date(c("2001-01-01", "2001-01-02"))))
  expect_false(dtt_completed(as.Date(c("2001-01-02", "2001-01-01"))))
  expect_true(
    dtt_completed(as.Date(c("2001-01-02", "2001-01-01")), sorted = FALSE)
  )
  expect_false(dtt_completed(as.Date(c("2001-01-01", "2001-01-01"))))
  expect_true(
    dtt_completed(as.Date(c("2001-01-01", "2001-01-01")), unique = FALSE)
  )
  expect_false(dtt_completed(as.Date(c("2001-01-03", "2001-01-01"))))
  expect_false(dtt_completed(as.Date(c("2001-01-01", "2002-02-01"))))
  expect_false(
    dtt_completed(as.Date(c("2001-01-01", "2002-02-01")), units = "months")
  )
  expect_true(
    dtt_completed(as.Date(c("2001-01-01", "2002-02-01")), units = "years")
  )
})

test_that("completed.Date", {
  expect_identical(dtt_completed(NA_POSIXct_), NA)
  expect_true(dtt_completed(NA_POSIXct_[-1]))
  expect_true(dtt_completed(as.POSIXct("2001-01-01", tz = "Etc/GMT-9")))
  expect_true(
    dtt_completed(
      as.POSIXct(c("2001-01-01", "2001-01-02"), tz = "Etc/GMT-9"),
      units = "days"
    )
  )
  expect_false(
    dtt_completed(
      as.POSIXct(c("2001-01-02", "2001-01-01"), tz = "Etc/GMT-9"),
      units = "days"
    )
  )
  expect_true(
    dtt_completed(
      as.POSIXct(c("2001-01-02", "2001-01-01"), tz = "Etc/GMT-9"),
      sorted = FALSE,
      units = "days"
    )
  )
  expect_false(
    dtt_completed(
      as.POSIXct(c("2001-01-01", "2001-01-01"), tz = "Etc/GMT-9"),
      units = "days"
    )
  )
  expect_true(
    dtt_completed(
      as.POSIXct(c("2001-01-01", "2001-01-01"), tz = "Etc/GMT-9"),
      unique = FALSE,
      units = "days"
    )
  )
  expect_false(
    dtt_completed(
      as.POSIXct(c("2001-01-03", "2001-01-01"), tz = "Etc/GMT-9"),
      units = "days"
    )
  )
  expect_false(
    dtt_completed(
      as.POSIXct(c("2001-01-01", "2002-02-01"), tz = "Etc/GMT-9"),
      units = "days"
    )
  )
  expect_false(
    dtt_completed(
      as.POSIXct(c("2001-01-01", "2002-02-01"), tz = "Etc/GMT-9"),
      units = "months"
    )
  )
  expect_true(
    dtt_completed(
      as.POSIXct(c("2001-01-01", "2002-02-01"), tz = "Etc/GMT-9"),
      units = "years"
    )
  )
})

test_that("completed.hms", {
  expect_identical(dtt_completed(NA_hms_), NA)
  expect_true(dtt_completed(NA_hms_[-1]))
  expect_true(dtt_completed(hms::as_hms("00:00:01")))
  expect_true(dtt_completed(hms::as_hms(c("00:00:01", "00:00:02"))))
  expect_false(dtt_completed(hms::as_hms(c("00:00:01", "00:00:00"))))
  expect_true(
    dtt_completed(hms::as_hms(c("00:00:01", "00:00:02")), sorted = FALSE)
  )
  expect_false(dtt_completed(hms::as_hms(c("00:00:01", "00:00:01"))))
  expect_true(
    dtt_completed(hms::as_hms(c("00:00:01", "00:00:01")), unique = FALSE)
  )
  expect_false(dtt_completed(hms::as_hms(c("00:00:03", "00:00:01"))))
  expect_false(dtt_completed(hms::as_hms(c("00:01:01", "00:02:02"))))
  expect_false(
    dtt_completed(hms::as_hms(c("00:01:01", "01:02:02")), units = "minutes")
  )
  expect_true(
    dtt_completed(hms::as_hms(c("00:01:01", "01:02:02")), units = "hours")
  )
})
