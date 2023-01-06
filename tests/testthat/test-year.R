test_that("dtt_year.Date", {
  expect_identical(dtt_year(as.Date("2001-01-01")[-1]), integer(0))
  expect_identical(dtt_year(as.Date("2001-01-01")), 2001L)
  expect_identical(dtt_year(NA_Date_), NA_integer_)
  expect_identical(
    dtt_year(as.Date(c("2001-01-01", "1972-02-01"))),
    c(2001L, 1972L)
  )
  expect_identical(dtt_year(as.Date(c("2001-04-03", NA_Date_))), c(2001L, NA))
})

test_that("dtt_year.POSIXct", {
  expect_identical(dtt_year(Sys.time()[-1]), integer(0))
  expect_identical(dtt_year(as.POSIXct("2001-02-01", tz = "UTC")), 2001L)
  expect_identical(dtt_year(NA_POSIXct_), NA_integer_)
  expect_identical(
    dtt_year(as.POSIXct("2003-03-01 02:03:31", tz = "UTC")),
    2003L
  )
  expect_identical(
    dtt_year(
      as.POSIXct(c("2004-04-01 05:06:31", "2005-06-05 00:01:33"), tz = "UTC")
    ),
    c(2004L, 2005L)
  )
  expect_identical(
    dtt_year(c(as.POSIXct("2008-07-01 23:32:31", tz = "UTC"), NA_POSIXct_)),
    c(2008L, NA_integer_)
  )
  expect_identical(
    dtt_year(as.POSIXct("2009-08-12 16:06:31", tz = "Etc/GMT+8")),
    2009L
  )
})

test_that("dtt_year<-.Date", {
  x0 <- Sys.Date()[-1]
  dtt_year(x0) <- 11L
  expect_identical(x0, Sys.Date()[-1])

  xNA <- NA_Date_
  dtt_year(xNA) <- 11L
  expect_identical(xNA, NA_Date_)

  x <- as.Date("1970-01-01")
  expect_identical(dtt_set_year(x, 11L), as.Date("0011-01-01"))
  dtt_year(x) <- 11L
  expect_identical(x, as.Date("0011-01-01"))

  x2 <- as.Date(c("1970-01-01", "1980-02-03"))
  dtt_year(x2) <- 7L
  expect_identical(dtt_year(x2), c(7L, 7L))

  dtt_year(x2) <- c(11L, 9L)
  expect_identical(dtt_year(x2), c(11L, 9L))

  is.na(x2[2]) <- TRUE
  dtt_year(x2) <- c(10L, 10L)
  expect_identical(dtt_year(x2), c(10L, NA))
})

test_that("dtt_year<-.Date preserves names", {
  x <- setNames(as.Date("2001-01-01"), "a name")
  dtt_year(x) <- 2000L
  expect_identical(names(x), "a name")
})

test_that("dtt_year<-.POSIXct", {
  x0 <- Sys.time()[-1]
  dtt_year(x0) <- 11L
  expect_identical(x0, Sys.time()[-1])

  xNA <- NA_POSIXct_
  dtt_year(xNA) <- 11L
  expect_identical(xNA, NA_POSIXct_)

  x <- as.POSIXct("1970-01-01", tz = "UTC")
  dtt_year(x) <- 11L
  expect_identical(x, as.POSIXct("0011-01-01 00:00:00", tz = "UTC"))

  x <- as.POSIXct("1970-01-01", tz = "Etc/GMT+1")
  expect_identical(
    dtt_set_year(x, 10L),
    as.POSIXct("0010-01-01 00:00:00", tz = "Etc/GMT+1")
  )
  dtt_year(x) <- 10L
  expect_identical(x, as.POSIXct("0010-01-01 00:00:00", tz = "Etc/GMT+1"))

  x <- as.POSIXct("1990-01-02 23:40:51", tz = "PST8PDT")
  dtt_year(x) <- 9L
  expect_identical(x, as.POSIXct("0009-01-02 23:40:51", tz = "PST8PDT"))

  x <- as.POSIXct("1990-01-02 23:40:51")
  dtt_year(x) <- 8L
  expect_identical(x, as.POSIXct("0008-01-02 23:40:51", tz = Sys.timezone()))

  x2 <- as.POSIXct(c("1970-01-01", "1980-02-03 04:50:05"), tz = "UTC")
  dtt_year(x2) <- 7L
  expect_identical(dtt_year(x2), c(7L, 7L))

  dtt_year(x2) <- c(11L, 9L)
  expect_identical(dtt_year(x2), c(11L, 9L))

  is.na(x2[2]) <- TRUE
  dtt_year(x2) <- c(10L, 10L)
  expect_identical(dtt_year(x2), c(10L, NA))
})

test_that("dtt_year<-.POSIXct preserves names", {
  x <- setNames(as.POSIXct("1990-01-17 23:40:51", tz = "PST8PDT"), "a name")
  dtt_year(x) <- 2000L
  expect_identical(names(x), "a name")
})
