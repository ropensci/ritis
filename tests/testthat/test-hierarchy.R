context("hierarchy functions")

test_that("hierarchy_down basic functionality works", {
  skip_on_cran()

  aa <- hierarchy_down(tsn = 161030)

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$tsn, "character")
  expect_gt(NROW(aa), 0)
})

test_that("hierarchy_up basic functionality works", {
  skip_on_cran()

  aa <- hierarchy_up(tsn = 36485)

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$tsn, "character")
  expect_gt(NROW(aa), 0)
})

test_that("hierarchy_full basic functionality works", {
  skip_on_cran()

  aa <- hierarchy_full(tsn = 37906)

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$tsn, "character")
  expect_gt(NROW(aa), 0)
})

test_that("hierarchy functions fail well", {
  skip_on_cran()

  expect_error(hierarchy_down(), "\"tsn\" is missing")
  expect_error(hierarchy_up(), "\"tsn\" is missing")
  expect_error(hierarchy_full(), "\"tsn\" is missing")

  # tsn's not found gives 404
  expect_error(hierarchy_down(tsn = "Asdfasdfa"), "Not Found")

  expect_error(hierarchy_up(tsn = "Asdfasdfa"), "Not Found")

  expect_error(hierarchy_full(tsn = "Asdfasdfa"), "Not Found")
})
