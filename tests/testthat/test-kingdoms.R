context("kingdom functions")

test_that("kingdom_name basic functionality works", {
  skip_on_cran()

  aa <- kingdom_name(202385)

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$tsn, "character")
  expect_is(aa$kingdomname, "character")
  expect_equal(aa$kingdomname, "Animalia")
  expect_gt(NROW(aa), 0)
})

test_that("kingdom_names basic functionality works", {
  skip_on_cran()

  aa <- kingdom_names()

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$tsn, "character")
  expect_gt(NROW(aa), 0)
  expect_true(any(grepl("Fungi", aa$kingdomname)))
})

test_that("kingdom functions fail well", {
  skip_on_cran()

  expect_error(kingdom_name(), "\"tsn\" is missing")

  expect_error(kingdom_names(wt = "ffa"), "'wt' must be one of")

  # tsn's not found lead to 404
  expect_error(kingdom_name(tsn = "Asdfasdfa"), "Bad Request \\(HTTP 400\\)")
})
