test_that("converts values to dates", {
  expect_equal(dtt_excel_to_date(42370L), as.Date("2016-01-01"))
  expect_equal(dtt_excel_to_date(40908, FALSE), as.Date("2016-01-01"))
  expect_equal(dtt_excel_to_date(0), as.Date("1899-12-30"))
  expect_equal(dtt_excel_to_date(0, FALSE), as.Date("1904-01-01"))
  expect_equal(dtt_excel_to_date(43890), as.Date("2020-02-29"))
  expect_equal(dtt_excel_to_date(42428, FALSE), as.Date("2020-02-29"))
  expect_equal(
    dtt_excel_to_date(c(0L, 43890L)),
    c(as.Date("1899-12-30"), as.Date("2020-02-29"))
  )
  expect_equal(dtt_excel_to_date(45323.12323), as.Date("2024-02-01"))
})

test_that("handles missing values", {
  expect_equal(
    dtt_excel_to_date(c(NA_real_, 43890)),
    c(NA_Date_, as.Date("2020-02-29"))
  )
  expect_equal(dtt_excel_to_date(NA_real_), NA_Date_)
  expect_equal(dtt_excel_to_date(NA_integer_), NA_Date_)
})

test_that("handles empty values", {
  expect_equal(dtt_excel_to_date(numeric(0L)), as.Date(character(0L)))
})

test_that("handles invalid values", {
  expect_error(dtt_excel_to_date("hello"), "`x` must be numeric.")
  expect_error(
    dtt_excel_to_date(40908, 4),
    "^`modern` must be a flag [(]TRUE or FALSE[)][.]$"
  )
})
