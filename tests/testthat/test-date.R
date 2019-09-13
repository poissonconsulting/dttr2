context("date")

test_that("date.integer", {
  expect_identical(dtt_date(integer(0)), Sys.Date()[-1])
  expect_identical(dtt_date(NA_integer_), NA_Date_)
  expect_identical(as.integer(as.Date("1970-01-01")), 0L)
  expect_identical(dtt_date(0L), as.Date("1970-01-01"))
  expect_identical(dtt_date(c(2L, NA)), as.Date(c("1970-01-03", NA)))
  expect_identical(
    dtt_date(1:2),
    as.Date(c("1970-01-02", "1970-01-03"))
  )
})

test_that("date.double", {
  expect_identical(dtt_date(numeric(0)), Sys.Date()[-1])
  expect_identical(dtt_date(NA_real_), NA_Date_)
  expect_identical(dtt_date(1.999), dtt_date(1L))
  expect_identical(dtt_date(-1.999), dtt_date(-2L))
  expect_identical(dtt_date(c(2, NA)), as.Date(c("1970-01-03", NA)))
  expect_identical(
    dtt_date(c(1, 2)),
    as.Date(c("1970-01-02", "1970-01-03"))
  )
})

test_that("date.character", {
  expect_identical(dtt_date(character(0)), Sys.Date()[-1])
  expect_identical(dtt_date(NA_character_), NA_Date_)
  expect_identical(dtt_date("1970-01-04"), dtt_date(3L))
  expect_identical(dtt_date("1970-01-04.99999"), dtt_date(3L))
  expect_identical(dtt_date(c("1970-01-04", NA)), dtt_date(c(3L, NA)))
})

test_that("date.Date", {
  expect_identical(dtt_date(Sys.Date()[-1]), Sys.Date()[-1])
  expect_identical(dtt_date(NA_Date_), NA_Date_)
  expect_identical(dtt_date(as.Date("1970-01-04")), as.Date("1970-01-04"))
  expect_identical(dtt_date(as.Date("1970-01-04") + 0.999), as.Date("1970-01-04"))
  expect_identical(dtt_date(as.Date("1970-01-04") - 0.001), as.Date("1970-01-03"))
  expect_identical(dtt_date(c(as.Date("1970-01-04"), NA_Date_)), c(as.Date("1970-01-04"), NA_Date_))
})

test_that("date.POSIXct", {
  expect_identical(dtt_date(Sys.time()[-1]), Sys.Date()[-1])
  expect_identical(dtt_date(NA_POSIXct_), NA_Date_)
  expect_identical(
    dtt_date(as.POSIXct("1970-01-03 00:00:00", tz = "Etc/GMT+8")),
    as.Date("1970-01-03")
  )
  expect_identical(
    dtt_date(as.POSIXct("1970-01-03 23:59:59", tz = "Etc/GMT+8")),
    as.Date("1970-01-03")
  )
  expect_identical(
    dtt_date(c(as.POSIXct("1970-01-03 23:59:59", tz = "Etc/GMT+8"), NA_POSIXct_)),
    c(as.Date("1970-01-03"), NA_Date_)
  )
})

test_that("date.hms", {
  expect_identical(dtt_date(hms::as_hms(3L))[-1], Sys.Date()[-1])
  expect_identical(dtt_date(NA_hms_), NA_Date_)
  expect_identical(dtt_date(hms::as_hms(0L)), as.Date("1970-01-01"))
  expect_identical(dtt_date(hms::as_hms("23:59:59")), as.Date("1970-01-01"))
  expect_identical(dtt_date(hms::as_hms("24:00:00")), as.Date("1970-01-02"))
  expect_identical(dtt_date(hms::as_hms(0L)), as.Date("1970-01-01"))
  expect_identical(dtt_date(hms::as_hms(3L)), as.Date("1970-01-01"))
  expect_identical(dtt_date(hms::as_hms(dtt_units_per_unit())), as.Date("1970-01-02"))
  expect_identical(dtt_date(hms::as_hms(-1L)), as.Date("1969-12-31"))
  expect_identical(dtt_date(hms::as_hms(-dtt_units_per_unit())), as.Date("1969-12-31"))
  expect_identical(dtt_date(hms::as_hms(-dtt_units_per_unit() - 1)), as.Date("1969-12-30"))
  expect_identical(
    dtt_date(hms::as_hms(-1:0)),
    as.Date(c("1969-12-31", "1970-01-01"))
  )
  expect_identical(dtt_date(hms::as_hms(c(-1L, NA))), as.Date(c("1969-12-31", NA)))
})
