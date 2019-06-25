context("hour")

test_that("dtt_hour.Date", {
  expect_identical(dtt_hour(as.Date("2001-01-01")[-1]), integer(0))
  expect_identical(dtt_hour(as.Date("2001-01-01")), 0L)
  expect_identical(dtt_hour(NA_Date_), 0L)
  expect_identical(dtt_hour(as.Date(c("2001-01-01", "1972-01-01"))), c(0L, 0L))
  expect_identical(dtt_hour(as.Date(c("2001-01-01", NA_Date_))), c(0L, 0L))
})

test_that("dtt_hour.POSIXct", {
  expect_identical(dtt_hour(Sys.time()[-1]), integer(0))
  expect_identical(dtt_hour(as.POSIXct("2001-01-01", tz = "UTC")), 0L)
  expect_identical(dtt_hour(NA_POSIXct_), NA_integer_)
  expect_identical(dtt_hour(as.POSIXct("2001-01-01 02:03:31", tz = "UTC")), 2L)
  expect_identical(dtt_hour(as.POSIXct(c("2001-01-01 05:04:31", "2001-01-02 00:01:33"), tz = "UTC")), 
                   c(5L, 0L))
  expect_identical(dtt_hour(c(as.POSIXct("2001-01-01 23:32:31", tz = "UTC"), NA_POSIXct_)),
                   c(23L, NA_integer_))
  expect_identical(dtt_hour(as.POSIXct("2001-01-01 16:06:31", tz = "Etc/GMT+8")), 16L)
})

test_that("dtt_hour.hms", {
  expect_identical(dtt_hour(hms::as.hms(1)[-1]), integer(0))
  expect_identical(dtt_hour(NA_hms_), NA_integer_)
  expect_identical(dtt_hour(hms::as.hms(3600)), 1L)
  expect_identical(dtt_hour(hms::as.hms(1)), 0L)
  expect_identical(dtt_hour(hms::as.hms(-1)), 23L)
  expect_identical(dtt_hour(hms::as.hms("20:30:32")), 20L)
  expect_identical(dtt_hour(hms::as.hms(-3601)), 22L)
  expect_identical(dtt_hour(c(hms::as.hms(3600), NA_hms_)), c(1L, NA_integer_))
  expect_identical(dtt_hour(hms::as.hms("24:00:00")), 0L)
})

test_that("dtt_hour<-.POSIXct", {
  x0 <- Sys.time()[-1]
  dtt_hour(x0) <- 22L
  expect_identical(x0, Sys.time()[-1])

  xNA <- NA_POSIXct_
  dtt_hour(xNA) <- 22L
  expect_identical(xNA, NA_POSIXct_)
  
  x <- as.POSIXct("1970-01-01", tz = "UTC")
  expect_identical(dtt_set_hour(x, 22L), 
                   as.POSIXct("1970-01-01 22:00:00", tz = "UTC"))
  dtt_hour(x) <- 22L
  expect_identical(x, as.POSIXct("1970-01-01 22:00:00", tz = "UTC"))
  
  x <- as.POSIXct("1970-01-01", tz = "Etc/GMT+1")
  dtt_hour(x) <- 21L
  expect_identical(x, as.POSIXct("1970-01-01 21:00:00", tz = "Etc/GMT+1"))
  
  x <- as.POSIXct("1990-01-02 23:40:51", tz = "PST8PDT")
  dtt_hour(x) <- 17L
  expect_identical(x, as.POSIXct("1990-01-02 17:40:51", tz = "PST8PDT"))
  
  x <- as.POSIXct("1990-01-02 23:40:51")
  dtt_hour(x) <- 0L
  expect_identical(x, as.POSIXct("1990-01-02 00:40:51", tz = Sys.timezone()))
  
  x2 <- as.POSIXct(c("1970-01-01", "1980-02-03 04:50:05"), tz = "UTC")
  dtt_hour(x2) <- 1L
  expect_identical(dtt_hour(x2), c(1L, 1L))
  
  dtt_hour(x2) <- c(11L, 9L)
  expect_identical(dtt_hour(x2), c(11L, 9L))
  
  is.na(x2[2]) <- TRUE
  dtt_hour(x2) <- c(10L, 10L)
  expect_identical(dtt_hour(x2), c(10L, NA))
})

test_that("dtt_hour<-.hms", {
  x0 <- hms::as.hms(1)[-1]
  dtt_hour(x0) <- 23L
  expect_identical(dtt_hour(x0), integer(0))
  
  xNA <- NA_hms_
  dtt_hour(xNA) <- 23L
  expect_identical(dtt_hour(xNA), NA_integer_)
  
  x <- hms::as.hms("12:13:14")
  expect_identical(dtt_set_hour(x, 23L), hms::as.hms("23:13:14"))
  dtt_hour(x) <- 23L
  expect_identical(x, hms::as.hms("23:13:14"))

  x2 <- hms::as.hms(c("12:13:14", "15:16:17"))
  dtt_hour(x2) <- 23L
  expect_identical(dtt_hour(x2), c(23L, 23L))

  dtt_hour(x2) <- c(11L, 9L)
  expect_identical(dtt_hour(x2), c(11L, 9L))
  
  x2[[2]] <- NA_hms_
  dtt_hour(x2) <- c(10L, 23L)
  expect_identical(dtt_hour(x2), c(10L, NA))
})

