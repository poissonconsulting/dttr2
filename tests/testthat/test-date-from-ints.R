test_that("create date from vector of values", {
  
  year <- c(1990, 1991, 2010, 2022)
  month <- c(1L, 5L, 8L, 12L)
  day <- c(1L, 10L, 16L, 31L)
  
  dates <- dtt_date_from_ints(
    year = year, 
    month = month, 
    day = day, 
    tz = "Etc/GMT+8"
  )
  
  expect_identical(
    dates, 
    as.Date(c("1990-01-01", "1991-05-10", "2010-08-16", "2022-12-31"))
  )
  
})
