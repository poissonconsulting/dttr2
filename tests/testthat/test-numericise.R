test_that("numericise.hms", {
  x <- structure(10.9, class = c("hms", "difftime"), units = "secs")
  expect_identical(numericise(x), 10.9)
})
