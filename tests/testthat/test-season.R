test_that("dtt_season.Date", {
  dates <- as.Date(c(
    "2001-01-01", "2011-05-30", "2001-02-28", "2011-03-01", "2013-06-01",
    "2012-09-01", "2012-12-31", NA
  ))

  expect_identical(
    dtt_season(dates),
    factor(
      c(
        "Winter", "Spring", "Winter", "Spring", "Summer", "Autumn", "Winter",
        NA
      ),
      levels = c("Winter", "Spring", "Summer", "Autumn")
    )
  )

  expect_identical(
    dtt_season(dates,
      start = c(Spring = 1L, Summer = 6L, Autumn = 8L, Winter = 11L)
    ),
    factor(
      c(
        "Spring", "Spring", "Spring", "Spring", "Summer", "Autumn", "Winter",
        NA
      ),
      levels = c("Spring", "Summer", "Autumn", "Winter")
    )
  )

  expect_identical(
    dtt_season(dates,
      start = c(
        Spring = as.Date("1972-01-01"), Summer = as.Date("1972-06-01"),
        Autumn = as.Date("1972-08-01"), Winter = as.Date("1972-11-01")
      )
    ),
    factor(
      c(
        "Spring", "Spring", "Spring", "Spring", "Summer", "Autumn", "Winter", NA
      ),
      levels = c("Spring", "Summer", "Autumn", "Winter")
    )
  )

  expect_identical(
    dtt_season(dates,
      start = c(Monsoon = 2L, `Dry Period` = 6L)
    ),
    factor(
      c(
        "Dry Period", "Monsoon", "Monsoon", "Monsoon", "Dry Period",
        "Dry Period", "Dry Period", NA
      ),
      levels = c("Dry Period", "Monsoon")
    )
  )

  expect_identical(
    dtt_season(dates, start = c(Monsoon = 2L, `Dry Period` = 6L)),
    dtt_season(dates, start = c(`Dry Period` = 6L, Monsoon = 2L))
  )

  expect_length(dtt_season(dates[1][-1]), 0)
  expect_s3_class(dtt_season(dates[1][-1]), "factor")
})

test_that("dtt_season.POSIXct", {
  dates <- as.POSIXct(c(
    "2001-01-01", "2011-05-30", "2001-02-28", "2011-03-01", "2013-06-01",
    "2012-09-01", "2012-12-31", NA
  ))

  expect_identical(
    dtt_season(dates),
    factor(
      c(
        "Winter", "Spring", "Winter", "Spring", "Summer", "Autumn", "Winter",
        NA
      ),
      levels = c("Winter", "Spring", "Summer", "Autumn")
    )
  )

  expect_identical(
    dtt_season(dates,
      start = c(Spring = 1L, Summer = 6L, Autumn = 8L, Winter = 11L)
    ),
    factor(
      c(
        "Spring", "Spring", "Spring", "Spring", "Summer", "Autumn", "Winter",
        NA
      ),
      levels = c("Spring", "Summer", "Autumn", "Winter")
    )
  )

  expect_identical(
    dtt_season(dates,
      start = c(
        Spring = as.Date("1972-01-01"), Summer = as.Date("1972-06-01"),
        Autumn = as.Date("1972-08-01"), Winter = as.Date("1972-11-01")
      )
    ),
    factor(
      c(
        "Spring", "Spring", "Spring", "Spring", "Summer", "Autumn", "Winter",
        NA
      ),
      levels = c("Spring", "Summer", "Autumn", "Winter")
    )
  )

  expect_identical(
    dtt_season(dates,
      start = c(Monsoon = 2L, `Dry Period` = 6L)
    ),
    factor(
      c(
        "Dry Period", "Monsoon", "Monsoon", "Monsoon", "Dry Period",
        "Dry Period", "Dry Period", NA
      ),
      levels = c("Dry Period", "Monsoon")
    )
  )

  expect_identical(
    dtt_season(dates, start = c(Monsoon = 2L, `Dry Period` = 6L)),
    dtt_season(dates, start = c(`Dry Period` = 6L, Monsoon = 2L))
  )

  expect_length(dtt_season(dates[1][-1]), 0)
  expect_s3_class(dtt_season(dates[1][-1]), "factor")
})

test_that("season order", {
  expect_identical(
    dtt_season(as.Date(paste("2000", c(1, 4, 8, 12), "01", sep = "-")),
      start = c(Summer = 6L, Winter = 11L)
    ),
    structure(
      c(1L, 1L, 2L, 1L),
      .Label = c("Winter", "Summer"),
      class = "factor"
    )
  )

  expect_identical(
    dtt_season(as.Date(paste("2000", c(1, 4, 8, 12), "01", sep = "-")),
      start = c(Summer = 6L, Winter = 11L), first = "Summer"
    ),
    structure(
      c(2L, 2L, 1L, 2L),
      .Label = c("Summer", "Winter"),
      class = "factor"
    )
  )
})
