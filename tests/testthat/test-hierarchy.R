context("hierarchy functions")

test_that("hierarchy_down basic functionality works", {
  vcr::use_cassette("hierarchy_down", {
    aa <- hierarchy_down(tsn = 179913)
  })

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$tsn, "character")
  expect_gt(NROW(aa), 0)
})

test_that("hierarchy_up basic functionality works", {
  vcr::use_cassette("hierarchy_up", {
    aa <- hierarchy_up(tsn = 36485)
  })

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$tsn, "character")
  expect_gt(NROW(aa), 0)
})

test_that("hierarchy_full basic functionality works", {
  vcr::use_cassette("hierarchy_full", {
    aa <- hierarchy_full(tsn = 37906)
  })

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$tsn, "character")
  expect_gt(NROW(aa), 0)
})

test_that("hierarchy functions fail well", {
  expect_error(hierarchy_down(), "\"tsn\" is missing")
  expect_error(hierarchy_up(), "\"tsn\" is missing")
  expect_error(hierarchy_full(), "\"tsn\" is missing")

  vcr::use_cassette("hierarchy-fails-well", {
    # tsn's not found gives 404
    expect_error(hierarchy_down(tsn = "Asdfasdfa"),
      "Bad Request \\(HTTP 400\\)", class = "error")

    expect_error(hierarchy_up(tsn = "Asdfasdfa"),
      "Bad Request \\(HTTP 400\\)", class = "error")

    expect_error(hierarchy_full(tsn = "Asdfasdfa"),
      "Bad Request \\(HTTP 400\\)", class = "error")
  })
})
