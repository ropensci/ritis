context("search_scientific")

test_that("search_scientific basic functionality works", {
  skip_on_cran()

  aa <- search_scientific("Tardigrada")

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$tsn, "character")
  expect_gt(NROW(aa), 0)
})

test_that("search_scientific - xml works", {
  skip_on_cran()

  aa <- search_scientific("Tardigrada", wt = "xml")

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("search_scientific - raw JSON works", {
  skip_on_cran()

  aa <- search_scientific("Tardigrada", raw = TRUE)

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("search_scientific fails well", {
  skip_on_cran()

  expect_error(search_scientific(), "\"x\" is missing")

  expect_error(search_scientific("asdfadf", wt = "ffa"), "'wt' must be one of")

  # query with no results lead to 0 row data.frame's
  tmp <- search_scientific(x = "asdfadf", wt = "json")
  expect_is(tmp, "tbl_df")
  expect_equal(NROW(tmp), 0)
})
