test_that("POSIXct", {
  expect_identical(as.double(as.POSIXct(0, origin = as.POSIXct("1970-01-01", tz = "GMT"))), 0)
  expect_identical(as.double(as.POSIXct(0.1, origin = as.POSIXct("1970-01-01", tz = "GMT"))), 0.1)
  expect_identical(as.double(as.POSIXct(0.99, origin = as.POSIXct("1970-01-01", tz = "GMT"))), 0.99)
  expect_identical(as.double(as.POSIXct(1.99, origin = as.POSIXct("1970-01-01", tz = "GMT"))), 1.99)
  expect_identical(as.double(as.POSIXct(-0.1, origin = as.POSIXct("1970-01-01", tz = "GMT"))), -0.1)
  expect_identical(as.double(as.POSIXct(-0.99, origin = as.POSIXct("1970-01-01", tz = "GMT"))), -0.99)
  expect_identical(as.double(as.POSIXct(-1.99, origin = as.POSIXct("1970-01-01", tz = "GMT"))), -1.99)

  expect_identical(
    format(as.POSIXct(0, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1970-01-01"
  )
  expect_identical(
    format(as.POSIXct(0.1, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1970-01-01 00:00:00"
  )
  expect_identical(
    format(as.POSIXct(0.99, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1970-01-01 00:00:00"
  )
  expect_identical(
    format(as.POSIXct(1, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1970-01-01 00:00:01"
  )
  expect_identical(
    format(as.POSIXct(1.99, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1970-01-01 00:00:01"
  )

  skip_on_os("linux")
  skip_on_os("solaris")
  skip_on_os("windows")

  expect_identical(
    format(as.POSIXct(-0.1, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1970-01-01 00:00:00"
  )
  expect_identical(
    format(as.POSIXct(-0.99, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1970-01-01 00:00:00"
  )
  expect_identical(
    format(as.POSIXct(-1, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1969-12-31 23:59:59"
  )
  expect_identical(
    format(as.POSIXct(-1.99, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1969-12-31 23:59:59"
  )

  expect_identical(
    format(as.POSIXct(-1.99, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1969-12-31 23:59:59"
  )
  expect_identical(
    format(as.POSIXct(-1.99 + 1, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1970-01-01 00:00:00"
  )
  expect_identical(
    format(as.POSIXct(-1.99 + 2, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1970-01-01 00:00:00"
  )
  expect_identical(
    format(as.POSIXct(-0.99 + 3, origin = as.POSIXct("1970-01-01", tz = "GMT")), tz = "GMT"),
    "1970-01-01 00:00:02"
  )
})
