test_that("dtt_study_year.Date", {
  expect_identical(dtt_study_year(as.Date("2001-01-01")[-1]), character(0))
  expect_identical(
    dtt_study_year(as.Date("2001-01-01")[-1], full = FALSE),
    integer(0)
  )
  expect_identical(dtt_study_year(as.Date("2005-04-03")), "2005-2005")
  expect_identical(dtt_study_year(as.Date("2005-04-03"), full = FALSE), 2005L)
  expect_identical(
    dtt_study_year(
      as.Date(c("2000-03-31", "2000-04-01", "2001-04-01")),
      start = 4L
    ),
    c("1999-2000", "2000-2001", "2001-2002")
  )
  expect_identical(
    dtt_study_year(
      as.Date(c("2000-03-31", "2000-04-01", "2001-04-01")),
      start = 4L,
      full = FALSE
    ),
    1999:2001
  )
  expect_identical(
    dtt_study_year(
      as.Date(c("2000-03-31", "2000-04-01", "2001-04-01")),
      start = dtt_date("1972-04-01")
    ),
    c("1999-2000", "2000-2001", "2001-2002")
  )
  expect_identical(
    dtt_study_year(
      as.Date(
        c("2000-03-31", "2000-04-01", "2001-04-01")
      ),
      start = dtt_date("1972-04-01"),
      full = FALSE
    ),
    1999:2001
  )
})

test_that("dtt_study_year.POSIXct", {
  expect_identical(dtt_study_year(as.POSIXct("2005-04-03")[-1]), character(0))
  expect_identical(
    dtt_study_year(as.POSIXct("2005-04-03")[-1], full = FALSE),
    integer(0)
  )
  expect_identical(dtt_study_year(as.POSIXct("2005-04-03")), "2005-2005")
  expect_identical(
    dtt_study_year(as.POSIXct("2005-04-03"), full = FALSE),
    2005L
  )
  expect_identical(
    dtt_study_year(
      as.POSIXct(c("2000-03-31", "2000-04-01", "2001-04-01")),
      start = 4L
    ),
    c("1999-2000", "2000-2001", "2001-2002")
  )
  expect_identical(
    dtt_study_year(
      as.POSIXct(
        c("2000-03-31", "2000-04-01", "2001-04-01")
      ),
      start = 4L,
      full = FALSE
    ),
    1999:2001
  )
  expect_identical(
    dtt_study_year(
      as.POSIXct(
        c("2000-03-31", "2000-04-01", "2001-04-01")
      ),
      start = dtt_date("1972-04-01"),
      full = FALSE
    ),
    1999:2001
  )
})
