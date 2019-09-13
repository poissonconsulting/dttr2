context("minute")

test_that("dtt_minute.Date", {
  expect_identical(dtt_minute(as.Date("2001-01-01")[-1]), integer(0))
  expect_identical(dtt_minute(as.Date("2001-01-01")), 0L)
  expect_identical(dtt_minute(NA_Date_), 0L)
  expect_identical(dtt_minute(as.Date(c("2001-01-01", "1972-01-01"))), c(0L, 0L))
  expect_identical(dtt_minute(as.Date(c("2001-01-01", NA_Date_))), c(0L, 0L))
})

test_that("dtt_minute.POSIXct", {
  expect_identical(dtt_minute(Sys.time()[-1]), integer(0))
  expect_identical(dtt_minute(as.POSIXct("2001-01-01", tz = "UTC")), 0L)
  expect_identical(dtt_minute(NA_POSIXct_), NA_integer_)
  expect_identical(dtt_minute(as.POSIXct("2001-01-01 00:03:31", tz = "UTC")), 3L)
  expect_identical(
    dtt_minute(as.POSIXct(c("2001-01-01 00:04:31", "2001-01-02 00:01:33"), tz = "UTC")),
    c(4L, 1L)
  )
  expect_identical(
    dtt_minute(c(as.POSIXct("2001-01-01 00:32:31", tz = "UTC"), NA_POSIXct_)),
    c(32L, NA_integer_)
  )
  expect_identical(dtt_minute(as.POSIXct("2001-01-01 00:06:31", tz = "Etc/GMT+8")), 6L)
})

test_that("dtt_minute.hms", {
  expect_identical(dtt_minute(hms::as_hms(1)[-1]), integer(0))
  expect_identical(dtt_minute(NA_hms_), NA_integer_)
  expect_identical(dtt_minute(hms::as_hms(60)), 1L)
  expect_identical(dtt_minute(hms::as_hms(1)), 0L)
  expect_identical(dtt_minute(hms::as_hms(-1)), 59L)
  expect_identical(dtt_minute(hms::as_hms("20:30:32")), 30L)
  expect_identical(dtt_minute(hms::as_hms(-63)), 58L)
  expect_identical(dtt_minute(c(hms::as_hms(60), NA_hms_)), c(1L, NA_integer_))
  expect_identical(dtt_minute(hms::as_hms("24:00:00")), 0L)
})

test_that("dtt_minute<-.POSIXct", {
  x0 <- Sys.time()[-1]
  dtt_minute(x0) <- 30L
  expect_identical(x0, Sys.time()[-1])

  xNA <- NA_POSIXct_
  dtt_minute(xNA) <- 30L
  expect_identical(xNA, NA_POSIXct_)

  x <- as.POSIXct("1970-01-01", tz = "UTC")
  dtt_minute(x) <- 30L
  expect_identical(x, as.POSIXct("1970-01-01 00:30:00", tz = "UTC"))

  x <- as.POSIXct("1970-01-01", tz = "Etc/GMT+1")
  expect_identical(
    dtt_set_minute(x, 30L),
    as.POSIXct("1970-01-01 00:30:00", tz = "Etc/GMT+1")
  )
  dtt_minute(x) <- 30L
  expect_identical(x, as.POSIXct("1970-01-01 00:30:00", tz = "Etc/GMT+1"))

  x <- as.POSIXct("1990-01-02 23:40:51", tz = "PST8PDT")
  dtt_minute(x) <- 27L
  expect_identical(x, as.POSIXct("1990-01-02 23:27:51", tz = "PST8PDT"))

  x <- as.POSIXct("1990-01-02 23:40:51")
  dtt_minute(x) <- 27L
  expect_identical(x, as.POSIXct("1990-01-02 23:27:51", tz = Sys.timezone()))

  x2 <- as.POSIXct(c("1970-01-01", "1980-02-03 04:50:05"), tz = "UTC")
  dtt_minute(x2) <- 30L
  expect_identical(dtt_minute(x2), c(30L, 30L))

  dtt_minute(x2) <- c(11L, 9L)
  expect_identical(dtt_minute(x2), c(11L, 9L))

  is.na(x2[2]) <- TRUE
  dtt_minute(x2) <- c(10L, 59L)
  expect_identical(dtt_minute(x2), c(10L, NA))
})

test_that("dtt_minute<-.hms", {
  x0 <- hms::as_hms(1)[-1]
  dtt_minute(x0) <- 30L
  expect_identical(dtt_minute(x0), integer(0))

  xNA <- NA_hms_
  dtt_minute(xNA) <- 30L
  expect_identical(dtt_minute(xNA), NA_integer_)

  x <- hms::as_hms("12:13:14")
  expect_identical(dtt_set_minute(x, 30L), hms::as_hms("12:30:14"))
  dtt_minute(x) <- 30L
  expect_identical(x, hms::as_hms("12:30:14"))

  x2 <- hms::as_hms(c("12:13:14", "15:16:17"))
  dtt_minute(x2) <- 30L
  expect_identical(dtt_minute(x2), c(30L, 30L))

  dtt_minute(x2) <- c(11L, 9L)
  expect_identical(dtt_minute(x2), c(11L, 9L))

  x2[[2]] <- NA_hms_
  dtt_minute(x2) <- c(10L, 59L)
  expect_identical(dtt_minute(x2), c(10L, NA))
})
