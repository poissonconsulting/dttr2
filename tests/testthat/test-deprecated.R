context("daytt")

test_that("daytt deals with start and leap year", {
  more_dates <- c("1998-02-27", "1999-02-28", "2000-02-29", "2003-03-01", "2004-03-02")
  more_dates <- as.Date(more_dates)
  
  expect_identical(dtt_daytt(more_dates), 
                   as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02")))

  expect_identical(dtt_daytt(more_dates, start = as.Date("2000-02-27")), 
                   as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02")))
  expect_identical(dtt_daytt(more_dates, start = as.Date("2000-02-28")), 
                  as.Date(c("1973-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02")))
  expect_identical(dtt_daytt(more_dates, start = as.Date("2000-02-29")), 
                  as.Date(c("1973-02-27", "1973-02-28", "1972-02-29", "1972-03-01", "1972-03-02")))
  expect_identical(dtt_daytt(more_dates, start = 3L), 
                  as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1971-03-01", "1971-03-02")))
  expect_identical(dtt_daytt(more_dates, start = as.Date("2000-03-02")), 
                  as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1971-03-02")))
  expect_identical(dtt_daytt(more_dates, start = as.Date("2000-03-03")), 
                  as.Date(c("1972-02-27", "1972-02-28", "1972-02-29", "1972-03-01", "1972-03-02")))
})
  