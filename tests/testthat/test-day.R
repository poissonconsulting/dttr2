test_that("dtt_day.Date", {
  expect_identical(dtt_day(as.Date("2001-01-01")[-1]), integer(0))
  expect_identical(dtt_day(as.Date("2001-01-01")), 1L)
  expect_identical(dtt_day(NA_Date_), NA_integer_)
  expect_identical(dtt_day(as.Date(c("2001-01-01", "1972-01-02"))), c(1L, 2L))
  expect_identical(dtt_day(as.Date(c("2001-01-03", NA_Date_))), c(3L, NA))
})

test_that("dtt_day.POSIXct", {
  expect_identical(dtt_day(Sys.time()[-1]), integer(0))
  expect_identical(dtt_day(as.POSIXct("2001-01-02", tz = "UTC")), 2L)
  expect_identical(dtt_day(NA_POSIXct_), NA_integer_)
  expect_identical(dtt_day(as.POSIXct("2001-01-03 02:03:31", tz = "UTC")), 3L)
  expect_identical(
    dtt_day(as.POSIXct(c("2001-01-04 05:04:31", "2001-01-05 00:01:33"), tz = "UTC")),
    c(4L, 5L)
  )
  expect_identical(
    dtt_day(c(as.POSIXct("2001-01-01 23:32:31", tz = "UTC"), NA_POSIXct_)),
    c(1L, NA_integer_)
  )
  expect_identical(dtt_day(as.POSIXct("2001-01-12 16:06:31", tz = "Etc/GMT+8")), 12L)
})

test_that("dtt_day<-.Date", {
  x0 <- Sys.Date()[-1]
  dtt_day(x0) <- 22L
  expect_identical(x0, Sys.Date()[-1])

  xNA <- NA_Date_
  dtt_day(xNA) <- 22L
  expect_identical(xNA, NA_Date_)

  x <- as.Date("1970-01-01")
  expect_identical(dtt_set_day(x, 22L), as.Date("1970-01-22"))
  dtt_day(x) <- 22L
  expect_identical(x, as.Date("1970-01-22"))

  x2 <- as.Date(c("1970-01-01", "1980-02-03"))
  dtt_day(x2) <- 7L
  expect_identical(dtt_day(x2), c(7L, 7L))

  dtt_day(x2) <- c(11L, 9L)
  expect_identical(dtt_day(x2), c(11L, 9L))

  is.na(x2[2]) <- TRUE
  dtt_day(x2) <- c(10L, 10L)
  expect_identical(dtt_day(x2), c(10L, NA))
})

test_that("dtt_day<-.Date preserves names", {
  x <- setNames(as.Date("2001-01-01"), "a name")
  dtt_day(x) <- 2L
  expect_identical(names(x), "a name")
})

test_that("dtt_day<-.POSIXct", {
  x0 <- Sys.time()[-1]
  dtt_day(x0) <- 22L
  expect_identical(x0, Sys.time()[-1])

  xNA <- NA_POSIXct_
  dtt_day(xNA) <- 22L
  expect_identical(xNA, NA_POSIXct_)

  x <- as.POSIXct("1970-01-01", tz = "UTC")
  expect_identical(
    dtt_set_day(x, 22L),
    as.POSIXct("1970-01-22 00:00:00", tz = "UTC")
  )
  dtt_day(x) <- 22L
  expect_identical(x, as.POSIXct("1970-01-22 00:00:00", tz = "UTC"))

  x <- as.POSIXct("1970-01-01", tz = "Etc/GMT+1")
  dtt_day(x) <- 21L
  expect_identical(x, as.POSIXct("1970-01-21 00:00:00", tz = "Etc/GMT+1"))

  x <- as.POSIXct("1990-01-02 23:40:51", tz = "PST8PDT")
  dtt_day(x) <- 17L
  expect_identical(x, as.POSIXct("1990-01-17 23:40:51", tz = "PST8PDT"))

  x <- as.POSIXct("1990-01-02 23:40:51")
  dtt_day(x) <- 18L
  expect_identical(x, as.POSIXct("1990-01-18 23:40:51", tz = Sys.timezone()))

  x2 <- as.POSIXct(c("1970-01-01", "1980-02-03 04:50:05"), tz = "UTC")
  dtt_day(x2) <- 7L
  expect_identical(dtt_day(x2), c(7L, 7L))

  dtt_day(x2) <- c(11L, 9L)
  expect_identical(dtt_day(x2), c(11L, 9L))

  is.na(x2[2]) <- TRUE
  dtt_day(x2) <- c(10L, 10L)
  expect_identical(dtt_day(x2), c(10L, NA))
})

test_that("dtt_day<-.POSIXct preserves names", {
  x <- setNames(as.POSIXct("1990-01-17 23:40:51", tz = "PST8PDT"), "a name")
  dtt_day(x) <- 2L
  expect_identical(names(x), "a name")
})
