context("seq")

test_that("seq.Date", {
  expect_error(dtt_seq(NA_Date_[-1], NA_Date_[-1]), "from must have 1 element")
  expect_error(dtt_seq(NA_Date_, NA_Date_[-1]), "from must not include missing values")
  expect_error(dtt_seq(as.Date("2001-01-01"), NA_Date_[-1]), "to must have 1 element")
  expect_error(dtt_seq(as.Date("2001-01-01"), NA_Date_), "to must not include missing values")
  expect_error(dtt_seq(as.Date("2001-01-01"), as.Date("2001-01-01"), units = "hours"),
               "units can only include values 'days', 'months' or 'years'")
  
  expect_identical(dtt_seq(as.Date("2001-01-01"), length_out = 0L), 
                   as.Date("2001-01-01")[-1])
  expect_identical(dtt_seq(as.Date("2001-01-01")), 
                   as.Date("2001-01-01"))
  
  expect_identical(dtt_seq(as.Date("2001-01-01"), length_out = 2L), 
                   as.Date(c("2001-01-01", "2001-01-02")))
  
  expect_identical(dtt_seq(as.Date("2001-01-01"), length_out = -2L), 
                   as.Date(c("2001-01-01", "2000-12-31")))
  
  expect_identical(dtt_seq(as.Date("2001-01-01"), as.Date("2001-01-01")),
                   as.Date("2001-01-01"))
  
  expect_identical(dtt_seq(as.Date("2001-01-01"), as.Date("2001-01-03")),
                   as.Date(c("2001-01-01", "2001-01-02", "2001-01-03")))
  
  expect_identical(dtt_seq(as.Date("2001-01-03"), as.Date("2001-01-01")),
                   as.Date(c("2001-01-03", "2001-01-02", "2001-01-01")))
  
  expect_identical(dtt_seq(as.Date("2001-01-01"), as.Date("2001-01-03"), units = "months"),
                   as.Date("2001-01-01"))
  expect_identical(dtt_seq(as.Date("2001-01-01"), as.Date("2001-03-03"), units = "months"),
                   as.Date(c("2001-01-01", "2001-02-01", "2001-03-01")))
  
  expect_identical(dtt_seq(as.Date("2001-01-01"), as.Date("2001-01-03"), units = "years"),
                   as.Date("2001-01-01"))
  expect_identical(dtt_seq(as.Date("2001-01-01"), as.Date("2003-03-03"), units = "years"),
                   as.Date(c("2001-01-01", "2002-01-01", "2003-01-01")))
  
  expect_identical(dtt_seq(as.Date("2001-01-02"), as.Date("2003-03-01"), units = "years"),
                   as.Date(c("2001-01-01", "2002-01-01", "2003-01-01")))
  
  expect_identical(dtt_seq(as.Date("2001-12-13"), as.Date("2003-12-31"), units = "years"),
                   as.Date(c("2001-01-01", "2002-01-01", "2003-01-01")))
  
  expect_identical(length(dtt_seq(as.Date("2001-12-31"), as.Date("2002-12-31"), units = "months")),
                   13L)
  
  expect_identical(length(dtt_seq(as.Date("2001-12-31"), as.Date("2002-12-31"), units = "days")),
                   366L)
})

test_that("seq.POSIXct", {
  expect_error(dtt_seq(NA_POSIXct_[-1], NA_POSIXct_[-1]), "from must have 1 element")
  expect_error(dtt_seq(NA_POSIXct_, NA_POSIXct_[-1]), "from must not include missing values")
  expect_error(dtt_seq(as.POSIXct("2001-01-01"), NA_POSIXct_[-1]), "to must have 1 element")
  expect_error(dtt_seq(as.POSIXct("2001-01-01"), NA_POSIXct_), "to must not include missing values")
  expect_error(dtt_seq(as.POSIXct("2001-01-01"), as.POSIXct("2001-01-01"), units = "hour"),
               "units can only include values 'days', 'hours', 'minutes', 'months', 'seconds' or 'years'")
  
  expect_error(dtt_seq(as.POSIXct("2001-01-01", tz = "GMT"), as.POSIXct("2001-01-01", tz = "UTC")),
               "to's time zone must be 'GMT' not [(]'UTC'[)]")
  
  expect_identical(dtt_seq(as.POSIXct("2001-01-01", tz = "UTC"), length_out = 0L), 
                   as.POSIXct(c("2001-01-01 00:00:00"), tz = "UTC")[-1])
  
  expect_identical(dtt_seq(as.POSIXct("2001-01-01", tz = "UTC"), length_out = 2L), 
                   as.POSIXct(c("2001-01-01 00:00:00", "2001-01-01 00:00:01"), tz = "UTC"))
  
  expect_identical(dtt_seq(as.POSIXct("2001-01-01", tz = "UTC"), length_out = -2L), 
                   as.POSIXct(c("2001-01-01 00:00:00", "2000-12-31 23:59:59"), tz = "UTC"))
  
  expect_identical(dtt_seq(as.POSIXct("2001-01-01", tz = "UTC"), as.POSIXct("2001-01-01", tz = "UTC")), 
                   as.POSIXct("2001-01-01 00:00:00", tz = "UTC"))
  
  expect_identical(dtt_seq(as.POSIXct("2001-01-01", tz = "UTC"), as.POSIXct("2001-01-03", tz = "UTC"), units = "days"),
                   as.POSIXct(c("2001-01-01", "2001-01-02", "2001-01-03"), tz = "UTC"))
  
  expect_identical(dtt_seq(as.POSIXct("2001-01-03", tz = "UTC"), as.POSIXct("2001-01-01", tz = "UTC"), units = "days"),
                   as.POSIXct(c("2001-01-03", "2001-01-02", "2001-01-01"), tz = "UTC"))
  
  expect_identical(dtt_seq(as.POSIXct("2001-01-01", tz = "UTC"), as.POSIXct("2001-01-03", tz = "UTC"), units = "months"),
                   as.POSIXct("2001-01-01", tz = "UTC"))
  expect_identical(dtt_seq(as.POSIXct("2001-01-01", tz = "UTC"), as.POSIXct("2001-03-03", tz = "UTC"), units = "months"),
                   as.POSIXct(c("2001-01-01", "2001-02-01", "2001-03-01"), tz = "UTC"))
  
  expect_identical(dtt_seq(as.POSIXct("2001-01-01", tz = "UTC"), as.POSIXct("2001-01-03", tz = "UTC"), units = "years"),
                   as.POSIXct("2001-01-01", tz = "UTC"))
  expect_identical(dtt_seq(as.POSIXct("2001-01-01", tz = "UTC"), as.POSIXct("2003-03-03", tz = "UTC"), units = "years"),
                   as.POSIXct(c("2001-01-01", "2002-01-01", "2003-01-01"), tz = "UTC"))
  
  expect_identical(dtt_seq(as.POSIXct("2001-01-02", tz = "UTC"), as.POSIXct("2003-03-01", tz = "UTC"), units = "years"),
                   as.POSIXct(c("2001-01-01", "2002-01-01", "2003-01-01"), tz = "UTC"))
  
  expect_identical(dtt_seq(as.POSIXct("2001-12-13", tz = "UTC"), as.POSIXct("2003-12-31", tz = "UTC"), units = "years"),
                   as.POSIXct(c("2001-01-01", "2002-01-01", "2003-01-01"), tz = "UTC"))
  
  expect_identical(length(dtt_seq(as.POSIXct("2001-12-31", tz = "UTC"), as.POSIXct("2002-12-31", tz = "UTC"), units = "months")),
                   13L)
  
  expect_identical(length(dtt_seq(as.POSIXct("2001-12-31", tz = "UTC"), as.POSIXct("2002-12-31", tz = "UTC"), units = "days")),
                   366L)
})

test_that("seq.hms", {
  expect_error(dtt_seq(NA_hms_[-1], NA_hms_[-1]), "from must have 1 element")
  expect_error(dtt_seq(NA_hms_, NA_hms_[-1]), "from must not include missing values")
  expect_error(dtt_seq(hms::as.hms("00:00:00"), NA_hms_[-1]), "to must have 1 element")
  expect_error(dtt_seq(hms::as.hms("00:00:00"), NA_hms_), 
               "to must not include missing values")
  expect_error(dtt_seq(hms::as.hms("00:00:00"), hms::as.hms("00:00:00"), units = "days"),
               "units can only include values 'hours', 'minutes' or 'seconds'")

  expect_error(dtt_seq(hms::as.hms("00:00:00"), length_out = 86401L), 
                   "length_out of units must not exceed 24 hours")

  expect_error(dtt_seq(hms::as.hms("00:00:00"), length_out = 25L, units = "hours"), 
                   "length_out of units must not exceed 24 hours")

  expect_identical(dtt_seq(hms::as.hms("00:00:00"), length_out = 0L), 
                   hms::as.hms("00:00:00")[-1])

  expect_identical(dtt_seq(hms::as.hms("00:00:00"), length_out = 2L), 
                   hms::as.hms(c("00:00:00", "00:00:01")))

  expect_identical(dtt_seq(hms::as.hms("00:00:00"), length_out = 24L, units = "hours"), 
                   hms::as.hms(paste0(c("00", "01", "02", "03", "04", "05",
                                        "06", "07", "08", "09", 10:23), ":00:00")))

  expect_identical(dtt_seq(hms::as.hms("01:00:00"), length_out = 24L, units = "hours"), 
                   hms::as.hms(paste0(c("01", "02", "03", "04", "05",
                                        "06", "07", "08", "09", 10:23, "00"), ":00:00")))
  
  expect_identical(length(dtt_seq(hms::as.hms("00:00:00"), length_out = -2L)), 
                   86400L)
  
  expect_identical(dtt_seq(hms::as.hms("00:00:00"), hms::as.hms("00:00:00")), 
                   hms::as.hms("00:00:00"))
  
  expect_identical(dtt_seq(hms::as.hms("00:00:00"), hms::as.hms("00:00:02")),
                   hms::as.hms(c("00:00:00", "00:00:01", "00:00:02")))
  
  expect_identical(dtt_seq(hms::as.hms("00:00:00"), hms::as.hms("00:00:02"), units = "hours"),
                   hms::as.hms("00:00:00"))
  
  expect_identical(dtt_seq(hms::as.hms("00:00:00"), hms::as.hms("00:02:02"), units = "minutes"),
                   hms::as.hms(c("00:00:00", "00:01:00", "00:02:00")))
  
  expect_identical(dtt_seq(hms::as.hms("00:00:00"), hms::as.hms("01:02:02"), units = "hours"),
                   hms::as.hms(c("00:00:00", "01:00:00")))
  
  expect_identical(dtt_seq(hms::as.hms("00:59:59"), hms::as.hms("01:00:00"), units = "hours"),
                   hms::as.hms(c("00:00:00", "01:00:00")))
  
  expect_identical(length(dtt_seq(hms::as.hms("00:00:01"), hms::as.hms("23:59:59"))),
                   86399L)
  expect_identical(length(dtt_seq(hms::as.hms("23:59:59"), hms::as.hms("00:00:01"), wrap = FALSE)),
                   86399L)
  expect_identical(dtt_seq(hms::as.hms("23:59:59"), hms::as.hms("00:00:01")),
                   hms::as.hms(c("23:59:59", "00:00:00", "00:00:01")))
})
