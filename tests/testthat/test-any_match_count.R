context("any_match_count")

test_that("any_match_count basic functionality works", {
  skip_on_cran()

  aa <- any_match_count(x = 202385)

  expect_true(class(aa) %in% c('numeric', 'integer'))
  expect_gt(aa, 0)

  bb <- any_match_count(x = "dolphin")

  expect_true(class(bb) %in% c('numeric', 'integer'))
  expect_gt(bb, 0)
})

test_that("any_match_count - xml works", {
  skip_on_cran()

  aa <- any_match_count(202385, wt = "xml")

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("any_match_count - raw JSON works", {
  skip_on_cran()

  aa <- any_match_count(202385, raw = TRUE)

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("any_match_count fails well", {
  skip_on_cran()

  expect_error(any_match_count(), "\"x\" is missing")

  expect_error(any_match_count("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  # character string query with no results lead to values of "0"
  tmp <- any_match_count(x = "asdfadf")
  expect_equal(tmp, 0)

  # numeric query with no results lead to values of "0"
  tmp <- any_match_count(x = 343423432423424)
  expect_equal(tmp, 0)
})
