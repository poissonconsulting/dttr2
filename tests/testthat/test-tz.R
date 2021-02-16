test_that("default_tz", {
  dtt_reset_default_tz()
  expect_identical(dtt_default_tz(), Sys.timezone())
  old <- dtt_set_default_tz("Etc/GMT+8")
  expect_identical(old, Sys.timezone())
  expect_identical(dtt_default_tz(), "Etc/GMT+8")
  expect_identical(dtt_reset_default_tz(), "Etc/GMT+8")
  expect_identical(dtt_default_tz(), Sys.timezone())
})

test_that("tz.POSIXct", {
  expect_null(attr(Sys.time(), "tzone"))
  expect_identical(dtt_tz(Sys.time()), Sys.timezone())
  expect_identical(attr(as.POSIXct("1970-01-01"), "tzone"), "")
  expect_identical(dtt_tz(as.POSIXct("1970-01-01")), Sys.timezone())
  expect_identical(dtt_tz(as.POSIXct("1970-01-01", tz = "Etc/GMT+8")), "Etc/GMT+8")
})

test_that("set_tz.POSIXct", {
  expect_identical(
    dtt_set_tz(as.POSIXct("1970-01-01", tz = "UTC")[-1], tz = "Etc/GMT+8"),
    as.POSIXct("1970-01-01", tz = "Etc/GMT+8")[-1]
  )

  expect_identical(
    dtt_set_tz(as.POSIXct("1970-01-01", tz = "UTC"), tz = "UTC"),
    as.POSIXct("1970-01-01", tz = "UTC")
  )
  expect_identical(
    dtt_set_tz(as.POSIXct("1970-01-01", tz = "UTC"), tz = "Etc/GMT+8"),
    as.POSIXct("1970-01-01", tz = "Etc/GMT+8")
  )

  expect_identical(
    dtt_set_tz(as.POSIXct(c("1970-01-01", "2000-01-02"), tz = "UTC"), tz = "Etc/GMT+8"),
    as.POSIXct(c("1970-01-01", "2000-01-02"), tz = "Etc/GMT+8")
  )

  expect_identical(
    dtt_set_tz(c(as.POSIXct("1970-01-01", tz = "UTC"), NA_POSIXct_), tz = "Etc/GMT+8"),
    c(as.POSIXct("1970-01-01", tz = "Etc/GMT+8"), NA_POSIXct_)
  )
})

test_that("adjust_tz.POSIXct", {
  expect_identical(
    dtt_adjust_tz(as.POSIXct("1970-01-01", tz = "UTC")[-1], tz = "Etc/GMT+8"),
    as.POSIXct("1970-01-01", tz = "Etc/GMT+8")[-1]
  )

  expect_identical(
    dtt_adjust_tz(as.POSIXct("1970-01-01", tz = "UTC"), tz = "UTC"),
    as.POSIXct("1970-01-01", tz = "UTC")
  )
  expect_identical(
    dtt_adjust_tz(as.POSIXct("1970-01-01", tz = "UTC"), tz = "Etc/GMT+8"),
    as.POSIXct("1969-12-31 16:00:00", tz = "Etc/GMT+8")
  )

  expect_identical(
    dtt_adjust_tz(as.POSIXct(c("1970-01-01", "2000-01-02"), tz = "UTC"), tz = "Etc/GMT+8"),
    as.POSIXct(c("1969-12-31 16:00:00 -08", "2000-01-01 16:00:00 -08"), tz = "Etc/GMT+8")
  )

  expect_identical(
    dtt_adjust_tz(c(as.POSIXct("1970-01-01", tz = "UTC"), NA_POSIXct_), tz = "Etc/GMT+8"),
    c(as.POSIXct("1969-12-31 16:00:00", tz = "Etc/GMT+8"), NA_POSIXct_)
  )
})
