test_that("dtt_second.Date", {
  expect_identical(dtt_second(as.Date("2001-01-01")[-1]), integer(0))
  expect_identical(dtt_second(as.Date("2001-01-01")), 0L)
  expect_identical(dtt_second(NA_Date_), 0L)
  expect_identical(dtt_second(as.Date(c("2001-01-01", "1972-01-01"))), c(0L, 0L))
  expect_identical(dtt_second(as.Date(c("2001-01-01", NA_Date_))), c(0L, 0L))
})

test_that("dtt_second.POSIXct", {
  expect_identical(dtt_second(Sys.time()[-1]), integer(0))
  expect_identical(dtt_second(as.POSIXct("2001-01-01", tz = "UTC")), 0L)
  expect_identical(dtt_second(NA_POSIXct_), NA_integer_)
  expect_identical(dtt_second(as.POSIXct("2001-01-01 00:00:31", tz = "UTC")), 31L)
  expect_identical(
    dtt_second(as.POSIXct(c("2001-01-01 00:00:31", "2001-01-02 00:01:33"), tz = "UTC")),
    c(31L, 33L)
  )
  expect_identical(
    dtt_second(c(as.POSIXct("2001-01-01 00:00:31", tz = "UTC"), NA_POSIXct_)),
    c(31L, NA_integer_)
  )
  expect_identical(dtt_second(as.POSIXct("2001-01-01 00:00:31", tz = "Etc/GMT+8")), 31L)
})

test_that("dtt_second.hms", {
  expect_identical(dtt_second(hms::as_hms(1)[-1]), integer(0))
  expect_identical(dtt_second(NA_hms_), NA_integer_)
  expect_identical(dtt_second(hms::as_hms(1)), 1L)
  expect_identical(dtt_second(hms::as_hms(1.999)), 1L)
  expect_identical(dtt_second(hms::as_hms(-0.001)), 59L)
  expect_identical(dtt_second(hms::as_hms(-1)), 59L)
  expect_identical(dtt_second(hms::as_hms("20:30:32")), 32L)
  expect_identical(dtt_second(hms::as_hms(-63)), 57L)
  expect_identical(dtt_second(c(hms::as_hms(1), NA_hms_)), c(1L, NA_integer_))
  expect_identical(dtt_second(hms::as_hms("24:00:00")), 0L)
})

test_that("dtt_second<-.POSIXct", {
  x0 <- Sys.time()[-1]
  dtt_second(x0) <- 30L
  expect_identical(x0, Sys.time()[-1])

  xNA <- NA_POSIXct_
  dtt_second(xNA) <- 30L
  expect_identical(xNA, NA_POSIXct_)

  x <- as.POSIXct("1970-01-01", tz = "UTC")
  expect_identical(dtt_set_second(x, 30L), as.POSIXct("1970-01-01 00:00:30", tz = "UTC"))
  dtt_second(x) <- 30L
  expect_identical(x, as.POSIXct("1970-01-01 00:00:30", tz = "UTC"))

  x <- as.POSIXct("1970-01-01", tz = "Etc/GMT+1")
  expect_identical(dtt_set_second(x, 30L), as.POSIXct("1970-01-01 00:00:30", tz = "Etc/GMT+1"))
  dtt_second(x) <- 30L
  expect_identical(x, as.POSIXct("1970-01-01 00:00:30", tz = "Etc/GMT+1"))

  x <- as.POSIXct("1990-01-02 23:40:51", tz = "PST8PDT")
  dtt_second(x) <- 27L
  expect_identical(x, as.POSIXct("1990-01-02 23:40:27", tz = "PST8PDT"))

  x <- as.POSIXct("1990-01-02 23:40:51")
  dtt_second(x) <- 27L
  expect_identical(x, as.POSIXct("1990-01-02 23:40:27", tz = Sys.timezone()))

  x2 <- as.POSIXct(c("1970-01-01", "1980-02-03 04:50:05"), tz = "UTC")
  dtt_second(x2) <- 30L
  expect_identical(dtt_second(x2), c(30L, 30L))

  dtt_second(x2) <- c(11L, 9L)
  expect_identical(dtt_second(x2), c(11L, 9L))

  is.na(x2[2]) <- TRUE
  dtt_second(x2) <- c(10L, 59L)
  expect_identical(dtt_second(x2), c(10L, NA))
})

test_that("dtt_second<-.hms", {
  x0 <- hms::as_hms(1)[-1]
  dtt_second(x0) <- 30L
  expect_identical(dtt_second(x0), integer(0))

  xNA <- NA_hms_
  dtt_second(xNA) <- 30L
  expect_identical(dtt_second(xNA), NA_integer_)

  x <- hms::as_hms("12:13:14")
  expect_identical(dtt_set_second(x, 30L), hms::as_hms("12:13:30"))
  dtt_second(x) <- 30L
  expect_identical(x, hms::as_hms("12:13:30"))

  x2 <- hms::as_hms(c("12:13:14", "15:16:17"))
  dtt_second(x2) <- 30L
  expect_identical(dtt_second(x2), c(30L, 30L))

  dtt_second(x2) <- c(11L, 9L)
  expect_identical(dtt_second(x2), c(11L, 9L))

  x2[[2]] <- NA_hms_
  dtt_second(x2) <- c(10L, 59L)
  expect_identical(dtt_second(x2), c(10L, NA))
})
