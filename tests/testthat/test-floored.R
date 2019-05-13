context("floored")

test_that("floored", {
  expect_true(dtt_floored(as.Date("2002-02-02"), "days"))
  expect_false(dtt_floored(as.Date("2002-02-02"), "months"))
  expect_false(dtt_floored(as.Date("2002-01-02"), "months"))
  expect_true(dtt_floored(as.Date("2002-02-01"), "months"))
})
