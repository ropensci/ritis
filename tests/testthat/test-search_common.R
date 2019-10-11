context("search_common")

test_that("search_common basic functionality works", {
  vcr::use_cassette("search_common", {
    aa <- search_common(x = "american bullfrog")
  })

  expect_is(aa, "data.frame")
  expect_is(aa, "tbl_df")

  expect_is(aa$tsn, "character")
  expect_gt(NROW(aa), 0)
})

test_that("search_common - xml works", {
  vcr::use_cassette("search_common-xml", {
    aa <- search_common(x = "american bullfrog", wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("search_common - raw JSON works", {
  vcr::use_cassette("search_common-json", {
    aa <- search_common(x = "american bullfrog", raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("search_common fails well", {
  expect_error(search_common(), "\"x\" is missing")
  expect_error(search_common("asdfadf", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("search_common-fails-well", {
    # query with no results lead to 0 row data.frame's
    tmp <- search_common(x = "asdfadf")
    expect_is(tmp, "tbl_df")
    expect_equal(NROW(tmp), 0)
  })
})
