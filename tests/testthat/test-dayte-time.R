test_that("dtt_dayte_time", {
  x <- as.POSIXct("2001-03-03 12:45:01", tz = "Etc/GMT+7")
  expect_identical(
    dtt_dayte_time(x),
    as.POSIXct("1972-03-03 12:45:01", tz = "Etc/GMT+7")
  )
  expect_identical(
    dtt_dayte_time(x, start = 2L),
    as.POSIXct("1972-03-03 12:45:01", tz = "Etc/GMT+7")
  )

  x <- as.Date("2002-03-04")
  expect_identical(
    dtt_dayte_time(x),
    as.POSIXct("1972-03-04 00:00:00", tz = "UTC")
  )
  x <- as.Date("2002-03-04")
  expect_identical(
    dtt_dayte_time(x, tz = "Etc/GMT+10"),
    as.POSIXct("1972-03-04 00:00:00", tz = "Etc/GMT+10")
  )
  expect_identical(
    dtt_dayte_time(x, start = 2L, tz = "Etc/GMT+10"),
    as.POSIXct("1972-03-04 00:00:00", tz = "Etc/GMT+10")
  )
  expect_identical(
    dtt_dayte_time(x, start = 4L, tz = "Etc/GMT+10"),
    as.POSIXct("1972-03-04 00:00:00", tz = "Etc/GMT+10")
  )
  x <- as.Date(c("2002-01-04", "2003-05-06"))
  expect_identical(
    dtt_dayte_time(x, start = 2L, tz = "Etc/GMT+10"),
    as.POSIXct(
      c("1973-01-04 00:00:00", "1972-05-06 00:00:00"),
      tz = "Etc/GMT+10"
    )
  )
  expect_identical(
    dtt_dayte_time(x, start = 4L, tz = "Etc/GMT+10"),
    as.POSIXct(
      c("1972-01-04 00:00:00", "1971-05-06 00:00:00"),
      tz = "Etc/GMT+10"
    )
  )
})
