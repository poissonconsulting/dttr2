test_that("wday for Dates", {
  expect_identical(dtt_wday(as.Date("2020-03-05")), "Thursday")
  expect_identical(dtt_wday(as.Date("2020-03-05")[-1]), character(0))
  expect_identical(dtt_wday(NA_Date_), NA_character_)
  expect_identical(
    dtt_wday(as.Date("2020-03-05") + 0:6),
    c(
      "Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday",
      "Wednesday"
    )
  )
  expect_identical(
    dtt_wday(as.Date("2020-03-05") + 0:6, abbr = TRUE),
    c("Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed")
  )
})

test_that("wday for POSIXct", {
  expect_identical(dtt_wday(as.POSIXct("2020-03-05")), "Thursday")
  expect_identical(dtt_wday(as.POSIXct("2020-03-05")[-1]), character(0))
  expect_identical(dtt_wday(NA_POSIXct_), NA_character_)
  expect_identical(
    dtt_wday(as.POSIXct("2020-03-05") + 0:6 * 86400),
    c(
      "Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday",
      "Wednesday"
    )
  )
  expect_identical(
    dtt_wday(as.POSIXct("2020-03-05") + 0:6 * 86400, abbr = TRUE),
    c("Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed")
  )
})
