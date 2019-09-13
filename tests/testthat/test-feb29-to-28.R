context("feb29-to-28")

test_that("feb29_to_28.Date", {
  expect_identical(
    dtt_feb29_to_28(as.Date("2004-02-29")),
    as.Date("2004-02-28")
  )
  expect_identical(
    dtt_feb29_to_28(as.Date(c("2004-02-29", "2003-03-01"))),
    as.Date(c("2004-02-28", "2003-03-01"))
  )
})


test_that("feb29_to_28.POSIXct", {
  expect_identical(
    dtt_feb29_to_28(as.POSIXct("2004-02-29")),
    as.POSIXct("2004-02-28")
  )
  expect_identical(
    dtt_feb29_to_28(as.POSIXct(c("2004-02-29", "2003-03-01"))),
    as.POSIXct(c("2004-02-28", "2003-03-01"))
  )
})
