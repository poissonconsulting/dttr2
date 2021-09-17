test_that("set_class", {
  expect_s3_class(set_class(1, "thingy"), "thingy")
})

test_that("set_attr", {
  expect_identical(attr(set_attr(1, "added", 5), "added"), 5)
})
