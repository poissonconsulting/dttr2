test_that("dtt_month.Date", {
  expect_identical(dtt_month(as.Date("2001-01-01")[-1]), integer(0))
  expect_identical(dtt_month(as.Date("2001-01-01")), 1L)
  expect_identical(dtt_month(NA_Date_), NA_integer_)
  expect_identical(dtt_month(as.Date(c("2001-01-01", "1972-02-01"))), c(1L, 2L))
  expect_identical(dtt_month(as.Date(c("2001-04-03", NA_Date_))), c(4L, NA))
})

test_that("dtt_month.POSIXct", {
  expect_identical(dtt_month(Sys.time()[-1]), integer(0))
  expect_identical(dtt_month(as.POSIXct("2001-02-01", tz = "UTC")), 2L)
  expect_identical(dtt_month(NA_POSIXct_), NA_integer_)
  expect_identical(dtt_month(as.POSIXct("2001-03-01 02:03:31", tz = "UTC")), 3L)
  expect_identical(
    dtt_month(
      as.POSIXct(
        c("2001-04-01 05:06:31", "2001-06-05 00:01:33"),
        tz = "UTC"
      )
    ),
    c(4L, 6L)
  )
  expect_identical(
    dtt_month(c(as.POSIXct("2001-07-01 23:32:31", tz = "UTC"), NA_POSIXct_)),
    c(7L, NA_integer_)
  )
  expect_identical(
    dtt_month(as.POSIXct("2001-08-12 16:06:31", tz = "Etc/GMT+8")),
    8L
  )
})

test_that("dtt_month<-.Date", {
  x0 <- Sys.Date()[-1]
  dtt_month(x0) <- 11L
  expect_identical(x0, Sys.Date()[-1])

  xNA <- NA_Date_
  dtt_month(xNA) <- 11L
  expect_identical(xNA, NA_Date_)

  x <- as.Date("1970-01-01")
  expect_identical(dtt_set_month(x, 11L), as.Date("1970-11-01"))
  dtt_month(x) <- 11L
  expect_identical(x, as.Date("1970-11-01"))

  x2 <- as.Date(c("1970-01-01", "1980-02-03"))
  dtt_month(x2) <- 7L
  expect_identical(dtt_month(x2), c(7L, 7L))

  dtt_month(x2) <- c(11L, 9L)
  expect_identical(dtt_month(x2), c(11L, 9L))

  is.na(x2[2]) <- TRUE
  dtt_month(x2) <- c(10L, 10L)
  expect_identical(dtt_month(x2), c(10L, NA))
})

test_that("dtt_month<-.Date preserves names", {
  x <- setNames(as.Date("2001-01-01"), "a name")
  dtt_month(x) <- 2L
  expect_identical(names(x), "a name")
})

test_that("dtt_month<-.POSIXct", {
  x0 <- Sys.time()[-1]
  dtt_month(x0) <- 11L
  expect_identical(x0, Sys.time()[-1])

  xNA <- NA_POSIXct_
  dtt_month(xNA) <- 11L
  expect_identical(xNA, NA_POSIXct_)

  x <- as.POSIXct("1970-01-01", tz = "UTC")
  dtt_month(x) <- 11L
  expect_identical(x, as.POSIXct("1970-11-01 00:00:00", tz = "UTC"))

  x <- as.POSIXct("1970-01-01", tz = "Etc/GMT+1")
  expect_identical(
    dtt_set_month(x, 10L),
    as.POSIXct("1970-10-01 00:00:00", tz = "Etc/GMT+1")
  )
  dtt_month(x) <- 10L
  expect_identical(x, as.POSIXct("1970-10-01 00:00:00", tz = "Etc/GMT+1"))

  x <- as.POSIXct("1990-01-02 23:40:51", tz = "PST8PDT")
  dtt_month(x) <- 9L
  expect_identical(x, as.POSIXct("1990-09-02 23:40:51", tz = "PST8PDT"))

  x <- as.POSIXct("1990-01-02 23:40:51")
  dtt_month(x) <- 8L
  expect_identical(x, as.POSIXct("1990-08-02 23:40:51", tz = Sys.timezone()))

  x2 <- as.POSIXct(c("1970-01-01", "1980-02-03 04:50:05"), tz = "UTC")
  dtt_month(x2) <- 7L
  expect_identical(dtt_month(x2), c(7L, 7L))

  dtt_month(x2) <- c(11L, 9L)
  expect_identical(dtt_month(x2), c(11L, 9L))

  is.na(x2[2]) <- TRUE
  dtt_month(x2) <- c(10L, 10L)
  expect_identical(dtt_month(x2), c(10L, NA))
})

test_that("dtt_month<-.POSIXct preserves names", {
  x <- setNames(as.POSIXct("1990-01-17 23:40:51", tz = "PST8PDT"), "a name")
  dtt_month(x) <- 2L
  expect_identical(names(x), "a name")
})
