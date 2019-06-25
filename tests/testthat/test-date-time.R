context("date-time")

test_that("date_time.integer", {
  expect_identical(dtt_date_time(integer(0)), as.POSIXct("1970-01-01", tz = "UTC")[-1])
  expect_identical(dtt_date_time(NA_integer_), NA_POSIXct_)
  expect_identical(as.integer(as.POSIXct("1970-01-01", tz = "UTC")), 0L)
  expect_identical(dtt_date_time(0L), as.POSIXct("1970-01-01", tz = "UTC"))
  expect_identical(dtt_date_time(-1L), as.POSIXct("1969-12-31 23:59:59", tz = "UTC"))
  expect_identical(dtt_date_time(0L, tz = "Etc/GMT+8"), 
                   as.POSIXct("1969-12-31 16:00:00", tz = "Etc/GMT+8"))
  
  expect_identical(dtt_date_time(2L), as.POSIXct("1970-01-01 00:00:02", tz = "UTC"))
  expect_identical(dtt_date_time(-2L), as.POSIXct("1969-12-31 23:59:58", tz = "UTC"))
  
  expect_identical(dtt_date_time(c(2L, NA)), 
                   c(as.POSIXct("1970-01-01 00:00:02", tz = "UTC"), NA_POSIXct_))
})

test_that("date_time.double", {
  expect_identical(dtt_date_time(double(0)), as.POSIXct("1970-01-01", tz = "UTC")[-1])
  expect_identical(dtt_date_time(NA_real_), NA_POSIXct_)
  expect_identical(as.double(as.POSIXct("1970-01-01", tz = "UTC")), 0)
  expect_identical(dtt_date_time(0), as.POSIXct("1970-01-01", tz = "UTC"))
  expect_identical(dtt_date_time(-1), as.POSIXct("1969-12-31 23:59:59", tz = "UTC"))
  expect_identical(dtt_date_time(0.99), as.POSIXct("1970-01-01", tz = "UTC"))
  expect_identical(dtt_date_time(-0.001), as.POSIXct("1969-12-31 23:59:59", tz = "UTC"))
  expect_identical(dtt_date_time(0, tz = "Etc/GMT+8"), 
                   as.POSIXct("1969-12-31 16:00:00", tz = "Etc/GMT+8"))

  expect_identical(dtt_date_time(2), as.POSIXct("1970-01-01 00:00:02", tz = "UTC"))
  expect_identical(dtt_date_time(-2), as.POSIXct("1969-12-31 23:59:58", tz = "UTC"))
  
  expect_identical(dtt_date_time(c(2, NA)), 
                   c(as.POSIXct("1970-01-01 00:00:02", tz = "UTC"), NA_POSIXct_))
  
  expect_identical(dtt_date(c(1,2)), 
                   as.Date(c("1970-01-02", "1970-01-03")))  
})

test_that("date_time.character", {
  expect_identical(dtt_date_time(character(0)), as.POSIXct("1970-01-01", tz = "UTC")[-1])
  expect_identical(dtt_date_time(NA_character_), NA_POSIXct_)
  expect_identical(dtt_date_time("1970-01-04"), as.POSIXct("1970-01-04", tz = "UTC"))
  expect_identical(dtt_date_time("1970-01-04", tz = "Etc/GMT+8"), 
                   as.POSIXct("1970-01-04", tz = "Etc/GMT+8"))
  expect_identical(dtt_date_time("1970-01-04 11:12:13"), 
                   as.POSIXct("1970-01-04 11:12:13", tz = "UTC"))
  expect_identical(dtt_date_time(c("1970-01-04", NA)), 
                   c(as.POSIXct("1970-01-04", tz = "UTC"), NA))
})

test_that("date_time.Date", {
  expect_identical(dtt_date_time(Sys.Date()[-1]), as.POSIXct("1970-01-01", tz = "UTC")[-1])
  expect_identical(dtt_date_time(NA_Date_), NA_POSIXct_)
  expect_identical(dtt_date_time(as.Date("2000-01-01")), as.POSIXct("2000-01-01", tz = "UTC"))
  expect_identical(dtt_date_time(as.Date("2000-01-01"), time = hms::as.hms("01:02:03")), 
                   as.POSIXct("2000-01-01 01:02:03", tz = "UTC"))
  expect_identical(dtt_date_time(as.Date("2000-01-01"), time = hms::as.hms("01:02:03"), tz = "Etc/GMT+8"), 
                   as.POSIXct("2000-01-01 01:02:03", tz = "Etc/GMT+8"))
  expect_identical(dtt_date_time(as.Date("1970-01-04") + 0.999), 
                   as.POSIXct("1970-01-04", tz = "UTC"))
  expect_identical(dtt_date_time(as.Date("1970-01-04") - 0.001), 
                   as.POSIXct("1970-01-03", tz = "UTC"))
})

test_that("date_time.POSIXct", {
  expect_identical(dtt_date_time(Sys.time()[-1]), as.POSIXct("1970-01-01", tz = Sys.timezone())[-1])
  expect_identical(dtt_date_time(NA_POSIXct_), NA_POSIXct_)
  expect_identical(dtt_date_time(as.POSIXct("1970-01-01", tz = "UTC")), 
                   as.POSIXct("1970-01-01", tz = "UTC"))
  expect_identical(dtt_date_time(as.POSIXct("1970-01-01", tz = "UTC") + 0.999), 
                   as.POSIXct("1970-01-01", tz = "UTC"))
  expect_identical(dtt_date_time(as.POSIXct("1970-01-01", tz = "UTC") - 1), 
                   as.POSIXct("1969-12-31 23:59:59", tz = "UTC"))
  expect_identical(dtt_date_time(as.POSIXct("1970-01-01", tz = "UTC"), tz = "Etc/GMT+8"), 
                   as.POSIXct("1969-12-31 16:00:0", tz = "Etc/GMT+8"))
  expect_identical(dtt_date_time(c(as.POSIXct("1970-01-01", tz = "UTC"), NA_POSIXct_), tz = "Etc/GMT+8"), 
                   c(as.POSIXct("1969-12-31 16:00:0", tz = "Etc/GMT+8"), NA_POSIXct_))
  
})

test_that("date_time.hms", {
  expect_identical(dtt_date_time(hms::as.hms(3L)[-1]), as.POSIXct("1970-01-01", tz = "UTC")[-1])
  expect_identical(dtt_date_time(NA_hms_), NA_POSIXct_)
  
  expect_identical(dtt_date_time(hms::as.hms(0L)), 
                   as.POSIXct("1970-01-01", tz = "UTC"))
  expect_identical(dtt_date_time(hms::as.hms(3L)), 
                   as.POSIXct("1970-01-01 00:00:03", tz = "UTC"))
  
  expect_identical(dtt_date_time(hms::as.hms(dtt_units_per_unit())), 
                   as.POSIXct("1970-01-01", tz = "UTC"))
  expect_identical(dtt_date_time(hms::as.hms(-1L)), as.POSIXct("1970-01-01 23:59:59", tz = "UTC"))
  
  expect_identical(dtt_date_time(hms::as.hms(dtt_units_per_unit()), tz = "Etc/GMT+8"), 
                   as.POSIXct("1970-01-01", tz = "Etc/GMT+8"))
  expect_identical(dtt_date_time(hms::as.hms(-1L), tz = "Etc/GMT+8"), 
                   as.POSIXct("1970-01-01 23:59:59", tz = "Etc/GMT+8"))
  
  expect_identical(dtt_date_time(hms::as.hms(-dtt_units_per_unit())), 
                   as.POSIXct("1970-01-01", tz = "UTC"))
  expect_identical(dtt_date_time(hms::as.hms(-dtt_units_per_unit()-1)), 
                   as.POSIXct("1970-01-01 23:59:59", tz = "UTC"))
  expect_identical(dtt_date_time(hms::as.hms(-1:0)), 
                   as.POSIXct(c("1970-01-01 23:59:59", "1970-01-01 00:00:00"), tz = "UTC"))
  expect_identical(dtt_date_time(hms::as.hms(c(-1L, NA))), 
                   as.POSIXct(c("1970-01-01 23:59:59", NA), tz = "UTC"))
})
