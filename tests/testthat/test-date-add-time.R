test_that("date_add_time", {
  expect_identical(
    dtt_date_add_time(
      as.Date("2001-03-05"),
      hms::as_hms("06:07:08"),
      tz = "Etc/GMT+9"
    ),
    as.POSIXct("2001-03-05 06:07:08", tz = "Etc/GMT+9")
  )
  expect_identical(
    dtt_date_add_time(
      as.Date(c("2001-03-05", "2002-06-12")),
      hms::as_hms("06:07:08"),
      tz = "Etc/GMT+7"
    ),
    as.POSIXct(
      c("2001-03-05 06:07:08", "2002-06-12 06:07:08"),
      tz = "Etc/GMT+7"
    )
  )
  expect_identical(
    dtt_date_add_time(
      as.Date(character(0)), hms::as_hms("06:07:08"),
      tz = "Etc/GMT+7"
    ),
    as.POSIXct(character(0), tz = "Etc/GMT+7")
  )
  expect_identical(
    dtt_date_add_time(
      as.Date("2001-01-05"), hms::as_hms(NA),
      tz = "Etc/GMT+7"
    ),
    as.POSIXct(NA_character_, tz = "Etc/GMT+7")
  )
  expect_identical(
    dtt_date_add_time(NA_Date_, hms::as_hms("01:02:03"), tz = "Etc/GMT+7"),
    as.POSIXct(NA_character_, tz = "Etc/GMT+7")
  )
})
