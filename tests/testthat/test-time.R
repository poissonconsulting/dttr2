context("time")

test_that("time.integer", {
  expect_identical(dtt_time(integer(0)), hms::as.hms(1)[-1])
  expect_identical(dtt_time(NA_integer_), NA_hms_)
  expect_identical(as.integer(hms::as.hms("00:00:00")), 0L)
  expect_identical(dtt_time(0L), hms::as.hms("00:00:00"))
  expect_identical(dtt_time(c(2L, NA)), c(hms::as.hms("00:00:02"), NA_hms_))
  expect_identical(dtt_time(c(-2L, NA)), c(hms::as.hms("23:59:58"), NA_hms_))
})

test_that("time.double", {
  expect_identical(dtt_time(numeric(0)), hms::as.hms(1)[-1])
  expect_identical(dtt_time(NA_real_), NA_hms_)
  expect_identical(dtt_time(1.999), hms::as.hms("00:00:01"))
  expect_identical(dtt_time(-1.999), hms::as.hms("23:59:58"))
  expect_identical(as.double(hms::as.hms("00:00:00")), 0)
  expect_equal(as.double(hms::as.hms("00:00:00.999999999")), 0.999999999)
  expect_identical(dtt_time(c(2, NA)), c(hms::as.hms("00:00:02"), NA_hms_))
})

test_that("time.character", {
  expect_identical(dtt_time(character(0)), hms::as.hms(1)[-1])
  expect_identical(dtt_time(NA_character_), NA_hms_)
  expect_identical(dtt_time("01:02:03"), hms::as.hms("01:02:03"))
  expect_identical(dtt_time("01:02:03.99999"), hms::as.hms("01:02:03"))
  expect_identical(dtt_time(c("01:02:03", NA)), c(hms::as.hms("01:02:03"), NA_hms_))
})

test_that("time.Date", {
  expect_identical(dtt_time(Sys.Date()[-1]), hms::as.hms(1)[-1])
  expect_identical(dtt_time(NA_Date_), hms::as.hms("00:00:00"))
  expect_identical(dtt_time(as.Date("2000-01-01")), hms::as.hms("00:00:00"))
  expect_identical(dtt_time(c(as.Date("2000-01-01"), NA_Date_)), 
                            c(hms::as.hms("00:00:00"), hms::as.hms("00:00:00")))
  expect_identical(dtt_time(as.Date("1970-01-04") + 0.999), 
                   hms::as.hms("00:00:00"))
  expect_identical(dtt_time(as.Date("1970-01-04") - 0.001), 
                   hms::as.hms("00:00:00"))
})

test_that("time.POSIXct", {
  expect_identical(dtt_time(Sys.time()[-1]), hms::as.hms(1)[-1])
  expect_identical(dtt_time(NA_POSIXct_), NA_hms_)
  expect_identical(dtt_time(as.POSIXct("1970-01-03 00:00:00", tz = "Etc/GMT+8")), 
                   hms::as.hms("00:00:00"))
  expect_identical(dtt_time(as.POSIXct("1970-01-03 00:00:00", tz = "Etc/GMT+7")), 
                   hms::as.hms("00:00:00"))
  expect_identical(dtt_time(as.POSIXct("1970-01-03 23:59:59", tz = "Etc/GMT+8")), 
                   hms::as.hms("23:59:59"))
  expect_identical(dtt_time(c(as.POSIXct("1970-01-03 23:59:59", tz = "Etc/GMT+8"), NA_POSIXct_)), 
                   c(hms::as.hms("23:59:59"), NA_hms_))
})

test_that("time.POSIXlt", {
  expect_identical(dtt_time(as.POSIXlt(Sys.time()[-1])), hms::as.hms(1)[-1])
  expect_identical(dtt_time(as.POSIXlt(NA_POSIXct_)), NA_hms_)
  expect_identical(dtt_time(as.POSIXlt("1970-01-03 00:00:00", tz = "Etc/GMT+8")), 
                   hms::as.hms("00:00:00"))
  expect_identical(dtt_time(as.POSIXlt("1970-01-03 23:59:59", tz = "Etc/GMT+8")), 
                   hms::as.hms("23:59:59"))
  expect_identical(dtt_time(as.POSIXlt(c(as.POSIXct("1970-01-03 23:59:59", tz = "Etc/GMT+8"), NA_POSIXct_))), 
                   c(hms::as.hms("23:59:59"), NA_hms_))
})

test_that("time.hms", {
  expect_identical(dtt_time(hms::as.hms(1)[-1]), hms::as.hms(1)[-1])
  expect_identical(dtt_time(NA_hms_), NA_hms_)
  expect_identical(dtt_time(hms::as.hms("01:02:03")), hms::as.hms("01:02:03"))
  expect_identical(dtt_time(hms::as.hms("01:02:03.99999")), hms::as.hms("01:02:03"))
  expect_identical(dtt_time(c(hms::as.hms("01:02:03"), NA_hms_)), 
                   c(hms::as.hms("01:02:03"), NA_hms_))
})
