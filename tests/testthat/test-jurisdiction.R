context("jurisdiction functions")

test_that("jurisdictional_origin basic functionality works", {
  skip_on_cran()

  aa <- jurisdictional_origin(tsn=180543)

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$origin, "character")
  expect_gt(NROW(aa), 0)
})

test_that("jurisdiction_origin_values - basic functionality works", {
  skip_on_cran()

  aa <- jurisdiction_origin_values()

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_named(aa, c('jurisdiction', 'origin'))
})

test_that("jurisdiction_values - basic functionality works", {
  skip_on_cran()

  aa <- jurisdiction_values()

  expect_is(aa, "character")

  expect_gt(length(aa), 1)
})

test_that("jurisdiction functions fail well", {
  skip_on_cran()

  expect_error(jurisdictional_origin(), "\"tsn\" is missing")

  expect_error(jurisdiction_origin_values(wt = "ffa"), "'wt' must be one of")

  expect_error(jurisdiction_values(wt = "ffa"), "'wt' must be one of")

  # lsid's not found lead 404
  expect_error(jurisdictional_origin(tsn = "asdfasdf"), "Not Found")
})
