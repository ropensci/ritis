context("any_match_count")

test_that("any_match_count basic functionality works", {
  vcr::use_cassette("any_match_count", {
    aa <- any_match_count(x = 202385)
    bb <- any_match_count(x = "dolphin")
  })
  
  expect_true(class(aa) %in% c('numeric', 'integer'))
  expect_gt(aa, 0)
  expect_true(class(bb) %in% c('numeric', 'integer'))
  expect_gt(bb, 0)
})

test_that("any_match_count - xml works", {
  vcr::use_cassette("any_match_count-xml", {
    aa <- any_match_count(202385, wt = "xml")
  })

  expect_is(aa, "character")
  expect_true(grepl("xmlns", aa))
})

test_that("any_match_count - raw JSON works", {
  vcr::use_cassette("any_match_count-json", {
    aa <- any_match_count(202385, raw = TRUE)
  })

  expect_is(aa, "character")
  expect_false(grepl("xmlns", aa))
})

test_that("any_match_count fails well", {
  skip_on_cran()

  expect_error(any_match_count(), "\"x\" is missing")

  expect_error(any_match_count("asdfafasffd", wt = "ffa"), "'wt' must be one of")

  vcr::use_cassette("any_match_count-fails-well", {
    # character string query with no results lead to values of "0"
    tmp1 <- any_match_count(x = "asdfadf")
    # numeric query with no results lead to values of "0"
    tmp2 <- any_match_count(x = 343423432423424)
  })
  
  expect_equal(tmp1, 0)
  expect_equal(tmp2, 0)
})
