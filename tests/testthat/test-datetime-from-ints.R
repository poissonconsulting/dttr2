test_that("create datetime from vector of values", {
  
  year <- c(1990, 1991, 2010, 2022)
  month <- c(1L, 5L, 8L, 12L)
  day <- c(1L, 10L, 16L, 31L)
  hour <- c(0, 10, 14, 23)
  minute <- c(0, 25, 45, 59)
  second <- c(0, 24, 47, 59)
  
  
  dates <- dtt_datetime_from_ints(
    year = year, 
    month = month, 
    day = day, 
    tz = "Etc/GMT+8"
  )
  
  expect_identical(
    dates, 
    as.POSIXct(
      c("1990-01-01 00:00:00", "1991-05-10 10:25:24", "2010-08-16 14:45:47", 
        "2022-12-31 23:59:59"),
      tz = "Etc/GMT+8"
    )
  )
  
})
